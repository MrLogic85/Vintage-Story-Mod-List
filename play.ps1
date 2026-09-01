<#
.SYNOPSIS
  Updates the modlist and launches Vintage Story.

.DESCRIPTION
  Run this instead of launching Vintagestory.exe directly. It:
    1. git pulls this repo (fast-forward only — never creates merge commits
       or touches local changes; if it can't fast-forward, or git/network
       isn't available, it just warns and continues with whatever mods
       you already have).
    2. Runs sync-mods.ps1 to install/update/remove mods to match MOD_DB.json.
    3. Launches the game.

.PARAMETER GameExe
  Path to Vintagestory.exe. Auto-detected from common install locations
  if not given.

.EXAMPLE
  .\play.ps1
  .\play.ps1 -GameExe "D:\Games\Vintagestory\Vintagestory.exe"
#>

param(
    [string]$GameExe = ""
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir

Write-Host "=== Checking for modlist updates ===" -ForegroundColor Cyan
if (Get-Command git -ErrorAction SilentlyContinue) {
    git pull --ff-only
    if ($LASTEXITCODE -ne 0) {
        Write-Warning "git pull didn't succeed (offline, or local changes prevent a fast-forward) - continuing with the modlist as it currently is."
    }
} else {
    Write-Warning "git not found on PATH - skipping update check."
}

Write-Host ""
Write-Host "=== Syncing mods ===" -ForegroundColor Cyan
& "$scriptDir\sync-mods.ps1"

if (-not $GameExe) {
    $candidates = @(
        "$env:APPDATA\Vintagestory\Vintagestory.exe",
        "$env:ProgramFiles\Vintagestory\Vintagestory.exe",
        "${env:ProgramFiles(x86)}\Vintagestory\Vintagestory.exe"
    )
    $GameExe = $candidates | Where-Object { Test-Path $_ } | Select-Object -First 1
}

if (-not $GameExe -or -not (Test-Path $GameExe)) {
    Write-Host ""
    Write-Error "Couldn't find Vintagestory.exe in any common location."
    Write-Host "Run this again with: .\play.ps1 -GameExe 'C:\path\to\Vintagestory.exe'" -ForegroundColor Yellow
    Read-Host "Press Enter to close"
    exit 1
}

Write-Host ""
Write-Host "=== Launching Vintage Story ===" -ForegroundColor Green
Start-Process -FilePath $GameExe
