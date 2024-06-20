# Android platform

## Create a new application

Use Evergine launcher to add _Android_ as one of your project platforms. Current _Android_ template runs with _Xamarin Android_, and we have a new _Android .NET6_ template that runs with _.NET6 for Android_.

![Create a new project](images/launcher.jpg)

### Prerequisites
If you choose _Android_ template, you need to install _.NET Multi-platform App UI develoipment_ development tools using _Visual Studio_ installer:

![Visual Studio Installer](images/visual-studio-installer-mobile.jpg)

In other hand, if you choose _Android .NET6_ template, you should install Android workload for _.NET6_. You can do it using a PowerShell console.

`dotnet workload install android`

## Project structure
The project structure created when you add an Android template are the following:


![Project structure](images/project-structure.jpg)

## Application deployment
You can deploy your application on _Android_ emulators, or you should use a physical device for development. Evergine uses _Vulkan_ as graphics backend for _Android_, that is included since _Android Nougat_ and later versions.

![Running on Android](images/app.jpg)