# Install docfx

Push-Location $PSScriptRoot

$docfxInstalled = Test-Path -Path Tools\docfx.exe
if(-Not ($docfxInstalled))
{
	mkdir -Force Tools
	$toolsDir = Get-Location
	(New-Object Net.WebClient).DownloadFile('https://github.com/dotnet/docfx/releases/download/v2.76.0/docfx-win-x64-v2.76.0.zip', "$toolsDir\Tools\docfx.zip");(new-object -com shell.application).namespace("$toolsDir\Tools").CopyHere((new-object -com shell.application).namespace("$toolsDir\Tools\docfx.zip").Items(),16)
}

Tools\docfx ..\docfx_metadata_net8-android.json
Tools\docfx ..\docfx_metadata_net8-ios.json
Tools\docfx ..\docfx_metadata_net8-windows.json
Tools\docfx ..\docfx_metadata_net8.json
Tools\docfx ..\docfx.json

Pop-Location
