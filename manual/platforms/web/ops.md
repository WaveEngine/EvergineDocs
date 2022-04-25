# Detailed information to develop & debug & deploy Evergine for the web

## Build

Use VS2022 or VSCode/Terminal. You can build and test only the client project (web), the server is only needed for publishing with compression (see below).

`dotnet build -c [Debug|Release] ./sample.web/sample.web.[Server.]csproj`

## Run

From VS2022 you can run the profile `sample.web[.Server]`. There is also an IIS Express profile for each cliente and server projects, but it is usually slower.

Additionally you can publish the app

`dotnet publish -c [Debug|Release] ./sample.web/sample.web.csproj`

and run the app by populating the folder `./sample.web/bin/[Debug|Release]/net6.0/publish/wwwroot`. In this second case we do recommend to use VSCode Live Server, instead of Fenix, as the second has known issues with Web Assembly.

### Debug

Debug is now possible from VS2022 by running the application in debug mode only on __Chrome__ browser.

## Publish with Compression

To publish the application with automatic compression (Brotli & GZip), the AspNetCore server is needed. Use VS2022 or from Terminal:

`dotnet publish -c Release -r win-x86 --self-contained ./sample.web.Server/sample.web.Server.csproj`

If done from terminal, you can publish the files in `sample.web.Server/bin/Release/net6.0/win-x86/publish` to an AspNetCore server, from VSCode or manually.
