# Import a Texture

![Drag and Drop Asset](../../evergine_studio/assets/Images/importAssets.jpg)

In **Evergine Studio**, importing an image file will create a **Texture** asset, as explained [in this article](../../evergine_studio/assets/create.md).

## Inspect Textures in Asset Details
You can find the texture assets in the Asset Details panel when you select a folder in the Project Explorer.

![Texture view](Images/textureAssetDetail.png)

## Texture Files in Content Directory

**Textures** imported into **Evergine** create an additional metadata `.wetx` file.

![Texture view](Images/textureFiles.png)

## Supported Formats:
**Evergine** supports the following image formats:

| Extension | Compression | Alpha | Bits per pixel | Supported texture types | 
| ----| ----| ---- | ---- | ---- |
| `.jpg`, `jpeg` | Lossy compression. Configurable | No | 24 | Texture2D |
| `.png` | Lossless compression | Yes | 8, 24, 48 | Texture2D |
| `.bmp` | No compression | Yes (not common) | 24 | Texture2D |
| `.gif` | Indexed colors | Yes | 8 | Texture2D |
| `.tga` | No | Yes | 32 | Texture2D |
| `.hdr` | No | No | 48 or 96 (high dynamic range) | Texture2D |
| `.dds` | Yes (S3, DXT1, DXT3, DXT5) | Yes | Multiple | Texture2D, Texture2DArray, Texture1D, Texture1DArray, TextureCube, TextureCubeArray, Texture3D |
| `.ktx` | Yes (ETC1S) | Yes | Multiple | Texture2D, Texture2DArray, Texture1D, Texture1DArray, TextureCube, TextureCubeArray, Texture3D |

## Sampler State Association
A **Texture** graphic resource needs a **Sampler State** asset for proper filtering. That's why the **Texture** asset contains a reference to a **Sampler State** in your project.

![Texture Sampler](Images/textureSampler.png)

This way, the Texture has a default **Sampler State** associated. **Evergine** will automatically use it.