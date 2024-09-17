<#
.SYNOPSIS
	Evergine Docs generation script. (c) Evergine
.DESCRIPTION
	This script generates the Evergine Documentation.
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

# Generate the Evergine documentation
LogInfo "START Building the documentation with DocFX for Evergine ..."

$docfx = GetDocFX

Invoke-Expression "$docfx build $configFile"

LogInfo "END Building the documentation with DocFX for Evergine."

Pop-Location
