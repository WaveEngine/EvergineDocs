# Effects
---
![Effect header](images/effects.jpg)

An **effect** is a _uber-shader_ so be able to represent a single shader or a large group of shaders. A shader is a **GPU program** that can be run  on the GPU and are able to perform rendering calculation using textures, vertoces and other resources. The effects in Evergine are written using [**HLSL**](https://docs.microsoft.com/en-us/windows/win32/direct3dhlsl/dx-graphics-hlsl-pguide).

While HLSL is only supported by DirectX backends (DX11 and DX12), The effects are automatically translated to another language when it is necessary (to GLSL when using OpenGL, or Spir-V in Vulkan).

## Standard Effect

Default evergine project template imports the [ **Evergine.Core** package](../../addons/index.md) package and this package includes several effects like the [**Standard Effect**](builtin_effects.md) used by Default Material asset. Effects are a type of asset and have a dedicated Editor [Effect Editor](effect_editor.md).

## In this section

* [Create Effects](create_effects.md)
* [Effect metatags](effect_metatags.md)
* [Using Effects](using_effects.md)
* [Effect Editor](effect_editor.md)
* [Built-in Effect](builtin_effects.md)
