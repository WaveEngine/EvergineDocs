# WebGPU

![WebGPU API](images/webgpu.jpg)

**WebGPU** is an ongoing project aimed at becoming a future web standard API for accelerated graphics and compute, providing modern 3D graphics and computation capabilities on the Web platform.

It is developed by the **W3C** Web Community Group with engineers from **Apple**, **Mozilla**, **Microsoft**, **Google**, and others. This technology runs on top of the latest graphics APIs like DirectX 12, Vulkan, and Metal.

**Chrome**, **Edge**, and **Firefox** already support it as an experimental feature, so you need to switch to the beta channel and activate it. **Evergine** uses **WebGPU** on Web platforms when it is available; otherwise, it uses [WebGL](opengl.md), which is the most supported graphics technology today.

To check the implementation status of this technology, visit [webgpu.io](https://github.com/gpuweb/gpuweb/wiki/Implementation-Status).

## Supported WebGPU devices

* Chrome, Edge, Safari, and Firefox browsers on Desktop, tablet, and mobile.

## Checking WebGPU version

| Browser | Check command |
| ---- | ---- | 
| **Chrome** |  The WebGPU flag must be enabled by writing this in your browser: <br/> `chrome://flags/#enable-unsafe-webgpu`
| **Edge** |  The WebGPU flag must be enabled by writing this in your browser: <br/> `edge://flags/#enable-unsafe-webgpu` | 

## Create a Graphics Context

To create a graphics context based on **WebGPU**, just write:

```csharp  
GraphicsContext graphicsContext = new Evergine.WebGPU.WGPUGraphicsContext();
graphicsContext.CreateDevice();
```

## Build & Run on WebGPU

The project template will be available soon.