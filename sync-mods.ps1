<#
.SYNOPSIS
  Syncs a Vintage Story Mods folder to match this repo's MOD_DB.json.

.DESCRIPTION
  Downloads each mod listed as installed in MOD_DB.json directly from
  mods.vintagestory.at at the exact version recorded there, into the given
  Mods folder. Re-running it after a `git pull` picks up any changes:
  new mods get added, changed versions get updated, and mods removed from
  MOD_DB.json get removed from your Mods folder too.

  Only touches files this script itself installed (tracked in
  .sync-state.json inside the Mods folder) — mods you added yourself are
  left alone.

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
        $state[$prop.Name] = $prop.Value
    }
}

$installed = @()
$updated = @()
$skipped = @()
$removed = @()
$failed = @()

# Remove mods no longer in the target list
foreach ($modid in @($state.Keys)) {
    if (-not $target.ContainsKey($modid)) {
        $oldFile = Join-Path $ModsDir $state[$modid]
        if (Test-Path $oldFile) { Remove-Item $oldFile -Force }
        $state.Remove($modid)
        $removed += $modid
    }
}

foreach ($modid in $target.Keys) {
    $wantedVersion = $target[$modid]
    $expectedFilename = "${modid}_${wantedVersion}.zip"
    $expectedPath = Join-Path $ModsDir $expectedFilename

    if ($state.ContainsKey($modid) -and $state[$modid] -eq $expectedFilename -and (Test-Path $expectedPath)) {
        $skipped += $modid
        continue
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

        # remove old version of this mod if present
        $wasInstalled = $state.ContainsKey($modid)
        if ($wasInstalled) {
            $oldFile = Join-Path $ModsDir $state[$modid]
            if (Test-Path $oldFile) { Remove-Item $oldFile -Force }
        }

        Invoke-WebRequest -Uri $downloadUrl -OutFile $expectedPath -TimeoutSec 60
        $state[$modid] = $expectedFilename

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
if ($removed.Count -gt 0)   { Write-Host "Removed ($($removed.Count)):" -ForegroundColor Red; $removed | ForEach-Object { Write-Host "  - $_" } }
if ($skipped.Count -gt 0)   { Write-Host "Already up to date: $($skipped.Count) mods" -ForegroundColor DarkGray }
if ($failed.Count -gt 0)    { Write-Host "FAILED ($($failed.Count)) - fix manually:" -ForegroundColor Red; $failed | ForEach-Object { Write-Host "  ! $_" } }
