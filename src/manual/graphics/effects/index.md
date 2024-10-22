# Effects
---

![Effect header](images/effects.jpg)

An **effect** is an _uber-shader_ that can represent a single shader or a large group of shaders. A shader is a **GPU program** that can run on the GPU and perform rendering calculations using textures, vertices, and other resources. The effects in Evergine are written using [**HLSL**](https://docs.microsoft.com/en-us/windows/win32/direct3dhlsl/dx-graphics-hlsl-pguide).

While HLSL is only supported by DirectX backends (DX11 and DX12), the effects are automatically translated to another language when necessary (to GLSL when using OpenGL, or Spir-V in Vulkan).

## Standard Effect

The default Evergine project template imports the [**Evergine.Core** package](../../addons/index.md) package, and this package includes several effects like the [**Standard Effect**](builtin_effects.md) used by the Default Material asset. Effects are a type of asset and have a dedicated Editor [Effect Editor](effect_editor.md).

## In this section

* [Create Effects](create_effects.md)
* [Library Effects](library_effect.md)
* [Effect Metatags](effect_metatags.md)
* [Using Effects](using_effects.md)
* [Effect Editor](effect_editor.md)
* [Built-in Effects](builtin_effects.md)