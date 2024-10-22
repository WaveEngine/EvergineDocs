# Metal

![Metal API](images/metal.jpg)

**Metal** is a low-level graphics and compute API created by **Apple** and is the default API on MacOS and iOS devices.

**Metal** has been available since June 2, 2014, on iOS devices powered by Apple A7 or later, and since June 8, 2015, on MacOS running OS X El Capitan.

**Evergine** uses the **Metal** API on MacOS and iOS devices like iPhone and iPad, but it also supports the [Vulkan](vulkan.md) graphics API on these platforms through MoltenVK, which allows for the conversion of a subset of the **Vulkan** API to run on top of **Metal** on MacOS and iOS operating systems.

## Supported Metal devices

* MacOS x64/x86/ARM64 desktop
* iOS iPhone and iPad

## Checking Metal version

**Metal** is the default graphics API used on iOS and MacOS devices, and **Apple** provides updates through system updates. To ensure you have the latest version, simply update to the latest OS version.

## Create a Graphics Context

To create a graphics context based on **Metal**, just write:

```csharp
GraphicsContext graphicsContext = new Evergine.Metal.MTLGraphicsContext();
graphicsContext.CreateDevice();
```

## Build & Run

The project template will be available soon.