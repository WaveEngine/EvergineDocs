<#
.SYNOPSIS
	Installs docfx locally. (c) Evergine
.EXAMPLE
	.\<script_name>
.LINK
	https://evergine.com
#>

# Config variables
$configFile = "docfx.json"

# Add common configuration and functions
. "$PSScriptRoot/ps_support.ps1"

# Set root as working directory
$currentDir = (Get-Location).Path
Push-Location $currentDir
Set-Location $PSScriptRoot/..

InstallDocFX
