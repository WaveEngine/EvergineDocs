# UWP platform

## Desktop and tablets

You can add _UWP_ as one of the platforms for your project, using _Universal Windows Platform_ template. With this template, you can create an application that runs in devices such PC, tablet or Xbox.

![Create a new project](images/launcher-desktop.jpg)

Project targets _Windows 10_ build _16299_ as minimal version, and _Windows 10_ build _18362_ as target version.

![Project structure](images/project-structure.jpg)

You can also deploy applications to _HoloLens_ devices, as stated in [Mixed Reality](#Mixed-Reality) section.

### Prerequisites
You have to install target SDKs to build and run the application. You can find download links [here](https://developer.microsoft.com/en-us/windows/downloads/sdk-archive).

### Application deployment
As a standard _UWP_ application, you can deploy your application in your local Windows device, in a remote device or in a physical device connected by _USB_ to your development machine.

## <a name="Mixed-Reality"></a>Mixed Reality

If you want to create an Evergine project for _HoloLens_ you should use _Mixed Reality_ template.

![Create a new project](images/launcher-mixed-reality.jpg)

Project targets _Windows 10_ build _16299_ as minimal version, and _Windows 10_ build _18362_ as target version.

### XR capabilities
Evergine for _Mixed Reality_ relies on a set on interfaces and classes defined in _Evergine.Framework.XR.*_ namespace:
- QR code detection with [IQRCodeWatcherService](xref:Evergine.Framework.XR.QR.IQRCodeWatcherService). 
- Spatial anchors with [SpatialAnchor](xref:Evergine.Framework.XR.SpatialAnchors.SpatialAnchor).
- Spatial mapping with [SpatialMappingObserver](xref:Evergine.Framework.XR.SpatialMapping.SpatialMappingObserver) and [SpatialMappingSurface](xref:Evergine.Framework.XR.SpatialMapping.SpatialMappingSurface).

### Application deployment
In this case, there are two options for application deployment: 
- Deploy in _HoloLens_ emulator: before deploying, you need to install device emulator from [official documentation](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/advanced-concepts/hololens-emulator-archive) page.
- Deploy in a _HoloLens_ device: remember that you should mark _ARM64_ as active configuration to deploy an application for _HoloLens 2_. For more information, read [official documentation](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/advanced-concepts/using-visual-studio?tabs=hl2).