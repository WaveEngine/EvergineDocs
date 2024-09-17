<#
.SYNOPSIS
	Docfx config creation for Evergine APIs. (c) Evergine
.DESCRIPTION
	This script generates specific configuration for Docfx to compile Evergine APIs information.
.EXAMPLE
	.\<script_name> -evergineFolder "../Engine"
.LINK
	https://evergine.com
#>

param
(
	[Parameter(Mandatory=$true, HelpMessage="The Evergine folder path")][string]$evergineFolder = $null
)

# Config variables
$sources = @(
	"src/Engine",
	"src/Extensions",
	"src/Runtimes",
	"src/Tools/Evergine.HLSLEverywhere"
)
$defaultTargetFramework = "net8.0"
$targetFrameworks = @(
	@{"framework"="net8.0-android"; "filter"="android"},
	@{"framework"="net8.0-ios"; "filter"="ios|macos|metal"},
	@{"framework"="net8.0-windows"; "filter"="wpf|forms|winui"}
)
$metadataConfigFile = "docfx_api_template.json"
$buildFolder = "build"
$configFolder = Join-Path $buildFolder "config"

# Add common configuration and functions
. "$PSScriptRoot/ps_support.ps1"

# Set root as working directory
$currentDir = (Get-Location).Path
Push-Location $currentDir
Set-Location $PSScriptRoot/..

$isSRCAvailable = Test-Path -Path $evergineFolder
if (-Not $isSRCAvailable)
{
	LogError "Evergine folder not found. No API config has been generated."
	Pop-Location
	exit 1
}

# Clean api folder
$configFolder = Resolve-Path $configFolder
Remove-Item -Recurse -Force -Path $configFolder -Exclude ".gitignore"

# Builds the api docfx config based on an src folder
function BuildDocfxConfig($srcFolder)
{
	$srcid = $srcFolder.Replace("/", "_")
	$absoluteSRCFolder = Resolve-Path (Join-Path $evergineFolder $srcFolder)

	# Get all csproj file paths that are inside src folder
	$csprojFiles = Get-ChildItem -Path $absoluteSRCFolder -Filter "*.csproj" -Recurse

	# arrange csprojs by target framework
	$csprojFilesByTargetFramework = @{}
	foreach ($csproj in $csprojFiles)
	{
		$csprojPath = (Resolve-Path -Relative -Path $csproj -RelativeBasePath $absoluteSRCFolder).Replace("\", "/").Replace("./", "")

		$isTargetFrameworkFound = $false
		foreach ($targetFramework in $targetFrameworks)
		{
			# if csproj name contains the filter, add it to the target framework
			if ($csproj.Name -match $targetFramework.filter)
			{
				$csprojFilesByTargetFramework[$targetFramework.framework] += @($csprojPath)
				$isTargetFrameworkFound = $true
				break
			}
		}

		if (-Not $isTargetFrameworkFound)
		{
			$csprojFilesByTargetFramework[$defaultTargetFramework] += @($csprojPath)
		}
	}

	# build docfx config for each target framework
	foreach ($targetFramework in $csprojFilesByTargetFramework.Keys)
	{
		$outputFolder = Join-Path $configFolder $targetFramework
		# create output folder if not exists
		if (-Not (Test-Path -Path $outputFolder))
		{
			New-Item -ItemType Directory -Force -Path $outputFolder
		}

		# load template metadata
		$metadata = Get-Content $metadataConfigFile -Raw | ConvertFrom-Json

		# update metadata with the new csproj files
		$metadata.metadata[0].src[0].files = @()
		foreach ($csproj in $csprojFilesByTargetFramework[$targetFramework])
		{
			$metadata.metadata[0].src[0].files += $csproj
		}

		# update metadata with the new src folder
		$metadata.metadata[0].src[0].src = (Resolve-Path -Relative -Path $absoluteSRCFolder -RelativeBasePath $outputFolder).Replace("\", "/")

		# update metadata with the new target framework
		$metadata.metadata[0].properties.TargetFramework = $targetFramework


		# write the new metadata to a new file
		$metadataFile = Join-Path $outputFolder "docfx-$srcid.json"
		$metadata | ConvertTo-Json -Depth 5 | Set-Content $metadataFile
	}
}


foreach ($src in $sources)
{
	BuildDocfxConfig $src
}

Pop-Location
