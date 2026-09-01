<#
.SYNOPSIS
  Syncs a Vintage Story Mods folder to match this repo's MOD_DB.json.

.DESCRIPTION
  Downloads each mod listed as installed in MOD_DB.json directly from
  mods.vintagestory.at at the exact version recorded there, into the given
  Mods folder. Re-running it after a `git pull` picks up any changes:
  new mods get added, changed versions get updated, and mods removed from
  MOD_DB.json get removed from your Mods folder too.

  Before downloading anything, it reads the actual modinfo.json inside
  every .zip already in your Mods folder (regardless of filename) to find
  out what's really installed — a mod already present at the right version
  is left completely alone, whatever it's named; a mod present at the wrong
  version gets that exact file replaced. Fresh downloads are saved under
  the same filename mods.vintagestory.at itself gives the release, so a
  script-installed mod looks identical to one you downloaded by hand.

  Only removes files this script itself installed or adopted (tracked in
  .sync-state.json inside the Mods folder) — mods you added yourself and
  never matched against MOD_DB.json are left alone.

  No mod files are stored in this repo; everything is fetched fresh from
  the official mod DB, so there's no redistribution concern.

.PARAMETER ModsDir
  Path to your Vintage Story Mods folder. Defaults to the standard
  Windows location.

.EXAMPLE
  .\sync-mods.ps1
  .\sync-mods.ps1 -ModsDir "D:\Games\VintagestoryData\Mods"
#>

param(
    [string]$ModsDir = "$env:APPDATA\VintagestoryData\Mods"
)

$ErrorActionPreference = 'Stop'
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$modDbPath = Join-Path $scriptDir 'MOD_DB.json'
$stateFilePath = Join-Path $ModsDir '.sync-state.json'

if (-not (Test-Path $modDbPath)) {
    Write-Error "MOD_DB.json not found next to this script at $modDbPath"
    exit 1
}
if (-not (Test-Path $ModsDir)) {
    New-Item -ItemType Directory -Path $ModsDir -Force | Out-Null
}

Add-Type -AssemblyName System.IO.Compression.FileSystem

function Get-ModInfoFromZip {
    param([string]$ZipPath)
    try {
        $zip = [System.IO.Compression.ZipFile]::OpenRead($ZipPath)
        try {
            $entry = $zip.Entries | Where-Object { $_.Name -ieq 'modinfo.json' } | Select-Object -First 1
            if (-not $entry) { return $null }
            $reader = New-Object System.IO.StreamReader($entry.Open())
            try {
                $content = $reader.ReadToEnd()
            } finally {
                $reader.Close()
            }
            $info = $content | ConvertFrom-Json
            # PowerShell property access is case-insensitive, so this handles
            # modid/modID/ModID and version/Version however the mod wrote it.
            if (-not $info.modid -or -not $info.version) { return $null }
            return @{ modid = $info.modid; version = $info.version }
        } finally {
            $zip.Dispose()
        }
    } catch {
        return $null
    }
}

# Scan every zip already in the Mods folder, regardless of filename or
# whether this script has ever seen it before, so an existing manually-
# downloaded mod is recognized instead of duplicated.
$existingByModid = @{}
Get-ChildItem -Path $ModsDir -Filter '*.zip' -File -ErrorAction SilentlyContinue | ForEach-Object {
    $info = Get-ModInfoFromZip -ZipPath $_.FullName
    if ($info -and -not $existingByModid.ContainsKey($info.modid)) {
        $existingByModid[$info.modid] = @{ filename = $_.Name; version = $info.version }
    }
}

$modDb = Get-Content $modDbPath -Raw | ConvertFrom-Json
$target = @{}
foreach ($mod in $modDb.mods) {
    if ($mod.installed) {
        $target[$mod.modid] = $mod.version
    }
}

$state = @{}
if (Test-Path $stateFilePath) {
    $raw = Get-Content $stateFilePath -Raw | ConvertFrom-Json
    foreach ($prop in $raw.PSObject.Properties) {
        # Support both the current format ({filename, version}) and the
        # older format (a bare filename string) so existing state files
        # from before this fix don't get discarded.
        if ($prop.Value -is [string]) {
            $state[$prop.Name] = @{ filename = $prop.Value; version = $null }
        } else {
            $state[$prop.Name] = @{ filename = $prop.Value.filename; version = $prop.Value.version }
        }
    }
}

$installed = @()
$updated = @()
$skipped = @()
$adopted = @()
$removed = @()
$failed = @()

# Remove mods no longer in the target list
foreach ($modid in @($state.Keys)) {
    if (-not $target.ContainsKey($modid)) {
        $oldFile = Join-Path $ModsDir $state[$modid].filename
        if (Test-Path $oldFile) { Remove-Item $oldFile -Force }
        $state.Remove($modid)
        $removed += $modid
    }
}

foreach ($modid in $target.Keys) {
    $wantedVersion = $target[$modid]

    # Already tracked by this script at the right version and the file is
    # still there - nothing to do, no need to even open the zip again.
    if ($state.ContainsKey($modid) -and $state[$modid].version -eq $wantedVersion -and (Test-Path (Join-Path $ModsDir $state[$modid].filename))) {
        $skipped += $modid
        continue
    }

    # Not tracked at the right version (or tracked file is missing) - check
    # what's actually on disk under ANY filename before assuming it needs
    # downloading.
    if ($existingByModid.ContainsKey($modid)) {
        $existing = $existingByModid[$modid]
        if ($existing.version -eq $wantedVersion) {
            # Correct version already present under its own filename - adopt
            # it into the state file so future runs recognize it instantly,
            # and don't touch the file itself.
            $state[$modid] = @{ filename = $existing.filename; version = $existing.version }
            $adopted += "$modid $wantedVersion ($($existing.filename))"
            continue
        }
        # Wrong version - remove that exact file (whatever it's named) before
        # downloading the correct one.
        $existingPath = Join-Path $ModsDir $existing.filename
        if (Test-Path $existingPath) { Remove-Item $existingPath -Force }
    } elseif ($state.ContainsKey($modid)) {
        # State pointed at a file that's gone missing - clean up the stale entry.
        $state.Remove($modid)
    }

    try {
        $apiResp = Invoke-RestMethod -Uri "https://mods.vintagestory.at/api/mod/$modid" -TimeoutSec 30
        $release = $apiResp.mod.releases | Where-Object { $_.modversion -eq $wantedVersion } | Select-Object -First 1
        if (-not $release) {
            $failed += "$modid (version $wantedVersion not found on mods.vintagestory.at)"
            continue
        }

        $downloadUrl = $release.mainfile
        if ($downloadUrl -notmatch '^https?://') {
            $downloadUrl = "https://moddbcdn.vintagestory.at/$downloadUrl"
        }

        # Use the same filename mods.vintagestory.at itself gives the file,
        # so a script-installed mod looks identical to a manually-downloaded
        # one instead of introducing its own naming convention.
        $downloadFilename = $release.filename
        if (-not $downloadFilename) { $downloadFilename = "${modid}_${wantedVersion}.zip" }
        $downloadPath = Join-Path $ModsDir $downloadFilename

        $wasInstalled = $existingByModid.ContainsKey($modid)

        Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath -TimeoutSec 60
        $state[$modid] = @{ filename = $downloadFilename; version = $wantedVersion }

        if ($wasInstalled) { $updated += "$modid -> $wantedVersion" }
        else { $installed += "$modid $wantedVersion" }
    }
    catch {
        $failed += "$modid ($($_.Exception.Message))"
    }
}

$state | ConvertTo-Json | Set-Content $stateFilePath

Write-Host ""
Write-Host "=== Mod sync complete ===" -ForegroundColor Cyan
if ($installed.Count -gt 0) { Write-Host "Installed ($($installed.Count)):" -ForegroundColor Green; $installed | ForEach-Object { Write-Host "  + $_" } }
if ($updated.Count -gt 0)   { Write-Host "Updated ($($updated.Count)):" -ForegroundColor Yellow; $updated | ForEach-Object { Write-Host "  ~ $_" } }
if ($adopted.Count -gt 0)   { Write-Host "Recognized as already installed ($($adopted.Count)):" -ForegroundColor Cyan; $adopted | ForEach-Object { Write-Host "  = $_" } }
if ($removed.Count -gt 0)   { Write-Host "Removed ($($removed.Count)):" -ForegroundColor Red; $removed | ForEach-Object { Write-Host "  - $_" } }
if ($skipped.Count -gt 0)   { Write-Host "Already up to date: $($skipped.Count) mods" -ForegroundColor DarkGray }
if ($failed.Count -gt 0)    { Write-Host "FAILED ($($failed.Count)) - fix manually:" -ForegroundColor Red; $failed | ForEach-Object { Write-Host "  ! $_" } }
