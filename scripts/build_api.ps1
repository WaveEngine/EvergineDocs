<#
.SYNOPSIS
	Evergine API Docs generation script. (c) Evergine
.DESCRIPTION
	This script generates the Evergine API Documentation for an specific framework. Defaults to net8.0 .
	It uses DocFX.
.EXAMPLE
	.\<script_name> [-targetFramework net8.0-android]
.LINK
	https://evergine.com
#>

param
(
	[Parameter(HelpMessage="API Target Framework to build")][string]$targetFramework = "net8.0"
)

# Config variables
$buildFolder = "build"
$apiConfigFolder = Join-Path $buildFolder "config"

# Add common configuration and functions
. "$PSScriptRoot/ps_support.ps1"

# Set root as working directory
$currentDir = (Get-Location).Path
Push-Location $currentDir
Set-Location $PSScriptRoot/..

$docfx = InstallDocFX

# Get all json files apiConfigFolder/$targetFramework
$configPath = Resolve-Path (Join-Path $apiConfigFolder $targetFramework)
$configFiles = Get-ChildItem -Path $configPath -Filter "*.json"

LogInfo "START Building the documentation with DocFX for $targetFramework ..."
$cmd = "$(Resolve-Path (Join-Path $toolsFolder docfx.exe))"
foreach ($configFile in $configFiles)
{
	Invoke-Expression "$docfx metadata $configFile"
}
LogInfo "END Building the documentation with DocFX for $targetFramework."

Pop-Location
