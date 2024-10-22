# Android Platform

## Create a New Application

Use Evergine Launcher to add _Android_ as one of your project platforms. The current _Android_ template runs with _Xamarin Android_, and there is a new _Android .NET6_ template that runs with _.NET6 for Android_.

![Create a new project](images/launcher.jpg)

### Prerequisites
If you choose the _Android_ template, you need to install _.NET Multi-platform App UI development_ tools using the _Visual Studio_ installer:

![Visual Studio Installer](images/visual-studio-installer-mobile.jpg)

On the other hand, if you choose the _Android .NET6_ template, you should install the Android workload for _.NET6_. You can do this using a PowerShell console:

```PowerShell
dotnet workload install android
```

## Project Structure
The project structure created when you add an Android template is the following:

![Project structure](images/project-structure.jpg)

## Application Deployment
You can deploy your application on _Android_ emulators, or you can use a physical device for development. Evergine uses _Vulkan_ as the graphics backend for _Android_, which is included in _Android Nougat_ and later versions.

![Running on Android](images/app.jpg)