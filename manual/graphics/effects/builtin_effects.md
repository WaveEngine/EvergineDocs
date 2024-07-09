# Built-in Effects
---
This section describes the effects included in the [**Evergine.Core** package](../../addons/index.md).

## Standard Effect

| Property                       | Description |
|-------------------------------|-------------|
| **Lighting enabled**          | Indicates that the material interacts with the lights of the scene. In the following image, the left material has lighting disabled and the right material has it enabled. <br> ![Light off/on](images/DefaultMaterialLightOnOff.png) |
| **IBL enabled**               | Indicates that the material reflects the environment of the scene. In the following image, the left material has it disabled while the right material has it enabled. <br> ![IBL off/on](images/DefaultMaterialIBLOnOff.png) |
| **Base Color**                | Indicates the surface color. |
| **Alpha**                     | Indicates the transparency of the surface. _Note: This parameter requires setting the LayerDescription property to Alpha or a layer with blend mode enabled._ <br> ![Alpha values](images/DefaultMaterialAlphaOnOff.png) |
| **Vertex Color**              | Indicates that the surface color will be read from vertex data of the mesh. |
| **Base Color Texture**        | Albedo texture to define the color of the surface. |
| **Base Color Sampler**        | Albedo texture sampler used by the Base Color Texture. |
| **UVOffsets 0**               | Texcoord UV offset added to the vertex texcoord data of the mesh. _Note: You can create interesting material effects by animating this parameter._ |
| **Metallic**                  | Indicates how "metal-like" the surface is. Its value is between [0-1]. In the following image, you can see the result with different values. <br> ![Metallic values](images/DefaultMaterialMetallic.png) |
| **Roughness**                 | Defines the smoothness or roughness of the surface. The value is between 0.0 and 1.0. <br> ![Roughness values](images/DefaultMaterialRoughness.png) |
| **Reflectance**               | Fresnel reflectance at normal incidence for dielectric surfaces. This replaces an explicit index of refraction. <br> ![Reflectance values](images/DefaultMaterialReflectance.png) |
| **Reference Alpha**           | Threshold alpha value. |
| **Alpha Cutout**              | Discard pixels when alpha value is less than the specified value. |
| **AllowInstancing**           | Indicates whether this material allows instancing draw. |
| **OrderBias**                 | This value is used to modify the rendering order of the meshes. |
| **LayerDescription**          | Defines the RenderLayer used by the material. |

### Metal Roughness
| Property                       | Description |
|-------------------------------|-------------|
| **MetalRoughness Texture**    | This texture allows defining multiple roughness and metallic values to the surface area instead of a constant roughness/metallic value for the whole surface. Note: Metallic value is in the blue channel and Roughness is in the green channel. |
| **MetalRoughness Sampler**    | Sampler used by the MetalRoughness texture.  |

### Normal

| Property                       | Description |
|-------------------------------|-------------|
| **Normal Texture**            | This texture allows simulating more details without using more polygons. |
| **Normal Sampler**            | Sampler used by the Normal texture. |

### Ambient Occlusion

| Property                       | Description |
|-------------------------------|-------------|
| **Occlusion Texture**         | Defines how much of the ambient light is accessible to a surface point. It is a per-pixel shadowing factor between 0.0 and 1.0. |
| **Occlusion Sampler**         | Sampler used by the Occlusion Texture. |

### Emissive

| Property                       | Description |
|-------------------------------|-------------|
| **Emissive Color**            | Additional diffuse color to simulate emissive surfaces (such as neons, etc.). This parameter is mostly useful in an HDR pipeline with a bloom pass. |
| **Emissive Compensation**     | The exposure compensation value of the emissive property can be used to force the emissive color to be brighter (positive values) or darker (negative values) than the current exposure. |
| **Emissive Texture**          | Additional diffuse albedo to simulate emissive surfaces (such as neons, etc.). This parameter is mostly useful in an HDR pipeline with a [bloom postprocessing effect](../postprocessing_graph/default_postprocessing_graph/bloom.md). |
| **Emissive Sampler**          | Sampler used by the Emissive texture. |

### Clear Coat

| Property                       | Description |
|-------------------------------|-------------|
| **ClearCoat**                 | Strength of the clear coat layer. Scalar between 0 and 1. |
| **ClearCoat Roughness**       | Perceived smoothness or roughness of the clear coat layer. Scalar between 0 and 1. |
| **ClearCoat Normal Texture**  | Normal map texture that affects the clear coat layer. |
| **ClearCoat Normal Sampler**  | Sampler used by the Clear Coat Normal texture. |

### Dual Texture

| Property                       | Description |
|-------------------------------|-------------|
| **Dual Texture Blend**        | Blend mode between Base Color and 2nd Base Color. Available values: _Lightmap_, _Multiplicative_, _Additive_, _Mask_. |
| **UV Offsets 1**              | UV Coord offset applied to the 2nd UV coords on the vertex format. |
| **2nd Base Color Texture**    | Texture used with the 2nd UV coords set on the vertex format. |
| **2nd Base Color Sampler**    | Sampler used by the 2nd Base Color texture. |

## Distortion Effect

This effect requires the **Distortion effect** inside the [**Default postprocessing effect**](../postprocessing_graph/default_postprocessing_graph/tonemapping.md).

| Property                       | Description |
|-------------------------------|-------------|
| **RenderLayer**               | Defines the RenderLayer used by the material. |
| **Intensity**                 | Defines the intensity of the distortion. |
| **Distortion Texture**        | The texture used with the distortion. |
| **Sampler**                   | Sampler used by the Distortion texture. |