# Set the script to stop on failure
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$PSDefaultParameterValues['*:ErrorAction']='Stop'
function ThrowOnNativeFailure {
    if (-not $?)
    {
      pop-location
      throw 'Native Failure'
    }
}

$docfxURI = "https://github.com/dotnet/docfx/releases/download/v2.76.0/docfx-win-x64-v2.76.0.zip"
$toolsFolder = "build/tools"

# Set log functions
function LogDebug($line) { Write-Host "##[DBG] $line" -Foreground Blue -Background Black }
function LogError($line) { Write-Host "##[ERR] $line" -Foreground Red -Background Black }
function LogWarning($line) { Write-Host "##[WARN] $line" -Foreground DarkYellow -Background Black }
function LogInfo($line) { Write-Host "`n##[INFO] $line`n" -Foreground Green -Background Black }
function LogSection($line){ Write-Host "##[section] $line" -Foreground DarkGreen -Background Black }

# Function to install docfx if not installed, based on $toolsFolder
function InstallDocFX()
{
    LogDebug "Checking if DocFX is installed ..."
    $toolsFolder = Resolve-Path $toolsFolder
    $docfxPath = Join-Path $toolsFolder "docfx.exe"
    $docfxInstalled = Test-Path -Path $docfxPath

    if(-Not ($docfxInstalled))
    {
        LogInfo "Installing DocFX ..."

        $zipPath = Join-Path $toolsFolder "docfx.zip"
        New-Item -ItemType Directory -Force -Path $toolsFolder

        LogDebug "Downloading DocFX ..."
        (New-Object Net.WebClient).DownloadFile($docfxURI, $zipPath)
        ThrowOnNativeFailure

        LogDebug "Unzipping DocFX ..."
        Microsoft.PowerShell.Archive\Expand-Archive -LiteralPath $zipPath -DestinationPath "$toolsFolder"
        ThrowOnNativeFailure
    }

    return "$(Resolve-Path (Join-Path $toolsFolder docfx.exe))"
}