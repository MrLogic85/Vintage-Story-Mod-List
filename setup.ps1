<#
.SYNOPSIS
  One-time setup: creates a "Vintage Story (Modded)" desktop shortcut that
  runs play.ps1 (update modlist, then launch the game) instead of
  launching Vintage Story directly.

.PARAMETER Path
  Path to Vintagestory.exe. Auto-detected from common install locations
  if not given; pass this only if auto-detection fails or you want a
  specific install baked into the shortcut instead of relying on
  play.ps1 re-detecting it at every launch.

.EXAMPLE
  .\setup.ps1
  .\setup.ps1 -Path "D:\Games\Vintagestory\Vintagestory.exe"
#>

param(
    [string]$Path = ""
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

if (-not $Path) {
    $candidates = @(
        "$env:APPDATA\Vintagestory\Vintagestory.exe",
        "$env:ProgramFiles\Vintagestory\Vintagestory.exe",
        "${env:ProgramFiles(x86)}\Vintagestory\Vintagestory.exe"
    )
    $Path = $candidates | Where-Object { Test-Path $_ } | Select-Object -First 1
}

if (-not $Path -or -not (Test-Path $Path)) {
    Write-Error "Couldn't find Vintagestory.exe in any common location."
    Write-Host "Run again with: .\setup.ps1 -Path 'C:\path\to\Vintagestory.exe'" -ForegroundColor Yellow
    exit 1
}

$playScript = Join-Path $scriptDir "play.ps1"
if (-not (Test-Path $playScript)) {
    Write-Error "play.ps1 not found next to setup.ps1 at $playScript"
    exit 1
}

$shortcutPath = Join-Path ([Environment]::GetFolderPath('Desktop')) "Vintage Story (Modded).lnk"
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut($shortcutPath)
$lnk.TargetPath = "powershell.exe"
$lnk.Arguments = "-ExecutionPolicy Bypass -File `"$playScript`" -GameExe `"$Path`""
$lnk.WorkingDirectory = $scriptDir
$lnk.IconLocation = $Path
$lnk.Save()

Write-Host "Created shortcut: $shortcutPath" -ForegroundColor Green
Write-Host "Use it instead of your old Vintage Story shortcut from now on - it updates the modlist automatically before every launch." -ForegroundColor Green
