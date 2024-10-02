# Textures
---

![Textures](Images/textures.jpg)

**Textures** are assets that usually contain an image. In **Evergine**, they are mostly used in materials to provide color detail in your application. How the **texture** is viewed in your application depends on the material itself. For example, a texture can be used as _diffuse_ or _emissive_ color information.

**Textures** can also be used in other areas, such as **Sprites** or **UI** elements. 

## Mipmapping

**Evergine** also supports **mipmapping**. It can generate or load the successive half-reductions of the texture, consisting of the **mip levels**. This process is crucial when dealing with **Texture Filtering** (_anisotropic_, _linear_, _bilinear_, etc.).

![Mip mapping](Images/mipmapping.jpg)

## Texture Types

**Evergine** supports these basic GPU texture types (detailed in this [section](textureTypes.md)):

- Texture2D
- Texture1D
- Texture1DArray
- Texture2DArray
- TextureCube
- TextureCubeArray
- Texture3D

## Supported File Types

**Evergine** supports importing the following texture types:

- `.png`
- `.jpg`
- `.jpeg`
- `.bmp`
- `.gif`
- `.tga`
- `.dds`
- `.ktx`
- `.hdr`

> [!NOTE]
> **Evergine** will only import the first frame of any animated image file like `.gif` and will load it as a static texture.

## In This Section

* [Texture types](textureTypes.md)
* [Import Textures](import_textures.md)
* [How to create a texture from code](create_texture_from_code.md)
* [Texture Editor](texture_editor.md)