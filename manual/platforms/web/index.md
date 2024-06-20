# Evergine on the web with WebGL and WebAssembly

---
An Evergine application can be deployed as a web app, using WebGL 2.0 as rendering API.

Evergine web applications can run statically on client side quite fast by the use of Blazor Web Assembly for native code execution. Furthermore, they are optimzed for fast loading, by parallelizing asset downloading and leveraging compressing techniques such as Brotli and Zip. Finally, to improve the loading as much as possible, which is crucial in web sites, we also provide an optional ASP server application that implements some optimizations that can only be done from server side.

## Prerequisites

- .Net8.0 SDK
  - Install Visual Studio 2022 (Recommended)
  - Alternatively, [Install](https://dotnet.microsoft.com/download/dotnet/8.0) latest dotnet SDK release.
- Install wasm-tools
  - From Visual Studio Installer, add _web development workload_ and the _.Net WebAssembly build tools_ individual component.
  - Additionally, install the `wasm-tools` workload in a root terminal: `dotnet workload install wasm-tools`

## Limitations

- Due to the very recent support of WebGL2.0 by iOS devices, support on its Safari browser is still a work in progress.

## In this section

- [Getting started](getting_started.md)
- [DevOps](ops.md)
- [Tips](tips.md)
<!-- - [Working with inputs and outputs](io.md) -->
