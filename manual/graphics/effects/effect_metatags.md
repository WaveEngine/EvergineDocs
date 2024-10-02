# Effect Metatags

---

In Evergine, effects are written in [**HLSL**](https://docs.microsoft.com/en-us/windows/win32/direct3dhlsl/dx-graphics-hlsl-pguide) language, but to automate some tasks, Evergine includes additional tags that you can add to the HLSL code.

## Block Metatags

Effect codes are organized into fourth important kinds of blocks:

| Block            | Tags                                                                                                                                                  | Description                                                                        |
|------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Resource Layout  | <span style="color:lightgreen">[Begin_ResourceLayout]<br/> [End_ResourceLayout]</span>                                                                  | This block of code defines all resources (Constant Buffers, Structured Buffers, Textures, and Samplers) using all effect passes.     |
| Pass             | <span style="color:lightgreen">[Begin_Pass:PassName] <br/> [End_Pass]</span>                                                                           | This block of code defines a RenderPipeline pass. The _DefaultRenderPipeline_ defines three passes that any effect can define: ZPrePass, Distortion, Default. |
| Library | <span style="color:lightgreen">[Begin_Library] <br/> [End_Library]</span>                                                                           | This block of code defines a Library Effect, which is a collection of static variables, constants, directives, and reusable functions. This block is exclusive to Library Effects and cannot be used together with Resource Layout or Pass blocks. |
| Global  | -  | All code placed outside of any block will be assigned to the Global section. This can be useful when defining variables that configure a library, such as in the case of FXAA. | 

## Include Metatags

To use a Library Effect in your Graphics or Compute effects, simply include it using the following metatag:

<span style="color:lightgreen">[Include_Library LibraryName LibraryIdentifierNumber]</span>     

- **LibraryName**: A human-readable name for your library.
- **LibraryIdentifierNumber**: A unique GUID that identifies the library effect asset.

The advantage of using the GUID is that it remains independent of the asset’s relative path. This means you can move your library assets around the project’s content folders without breaking the references.



## Directives Metatags

Inside a resource layout block, you can define the directive set that your custom effect will have. Directives are useful to enable different features of your effect.

A directive can be defined as a two-value On/Off feature or can define a feature with multiple values:

<span style="color:lightgreen">[Directive:Name `A_OFF` `A`]</span>

<span style="color:lightgreen">[Directive:Name `A_OFF` `B` `C` `D` ...]</span>
<br/>
Example:

<span style="color:lightgreen">[Directive:NormalMapping Normal_OFF, Normal]</span>

<span style="color:lightgreen">[Directive:ShadowFilter Shadow_OFF, ShadowFilter3, ShadowFilter5, ShadowFilter7]</span>

An effect is a set of shaders (known as _Uber-shader_), and directives help you define this set of shaders. The directives automatically generate multiple shaders when the effects are compiled.

Example:

<span style="color:lightgreen">[Directive:Name `A_OFF` `A`]</span> will generate a shader with `A` enabled and another shader with `A` disabled.

<span style="color:lightgreen">[Directive:Name `A_OFF` `B` `C` `D` ...]</span> will generate `A`, `B`, `C`, `D` ... shaders.

Additionally, if you define several directives, it will multiply the combinations. In that case, if you define two directives:

<span style="color:lightgreen">[Directive:FeatureA `A_OFF` `A`]</span>

<span style="color:lightgreen">[Directive:FeatureB `B_OFF` `C` `D`]</span>

It will generate the following shader combinations: `A_OFF-B_OFF`, `A-B_OFF`, `A_OFF-C`, `A-C`, `A_OFF-D`, `A-D`.

The number of combinations is multiplied by the number of effect passes, so a complex effect would have hundreds or thousands of combinations.

The effects can compile their combinations on-demand at runtime or pre-compile combinations beforehand and use them later at runtime without compilation. This allows you to generate a bundle with compiled shader combinations. To know more details, go to this [section](using_effects.md).

You can shape your effect code with the `#if`, `#else`, and `#endif` preprocessor directives:
```csharp
#if TEX
    // This code is compiled only if TEX directive is used...
    finalColor = ColorTexture.Sample(ColorSampler, input.Tex); 
#else
    // If TEX directive is not present, this code is reached...
    finalColor = ColorAttribute; 
#endif
```

Or use any directive combinations:
```csharp
#if TEX || NORMAL
    // This code is compiled only if TEX and NORMAL directives are used...
    output.texCoord = input.TexCoord; 
#endif
```

## Default Values Metatag

Evergine allows injecting default values into constant buffer attributes automatically using tags.

Default values can be injected directly using the <span style="color:lightgreen">[Default(value)]</span> tag:
```csharp
cbuffer Parameters : register(b0)
{
    float SpeedFactor : packoffset(c0.x); [Default(1.5)]
    float3 Position   : packoffset(c0.y); [Default(2.3, 3.3, 5.6)]
}
```
The default value tag supports the following types: `int`, `float`, `bool`, `float2`, `float3`, `float4`.

## Inject Engine Parameters

Evergine allows injecting engine data into resource layout resources _(Constant Buffers attributes and Textures)_ automatically using tags.

For example, in the following code, the `[WorldViewProjection]` metatag is used to inject the object world view projection matrix:
```csharp
cbuffer PerDrawCall : register(b0)
{
    float4x4 WorldViewProj : packoffset(c0); [WorldViewProjection]
};
```

## Pass Settings Metatags

These tags are used inside a pass block code and are useful to configure which settings you want to compile for this pass.

| Tag                                                 | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
|-----------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span style="color:lightgreen">[Profile `API_Level`]</span>                 | Defines HLSL language version and capabilities. The API level values could be: <ul><li>**9_1:** DirectX9.1 HLSL 3.0.</li><li>**9_2:** DirectX 9.2 HLSL 3.0</li><li>**9_3:** DirectX 9.3 HLSL 3.0</li><li>**10_0:** DirectX 10 HLSL 4.0</li><li>**10_1:** DirectX 10.1 HLSL 4.1</li><li>**11_0:** DirectX 11 HLSL 5.0</li><li>**11_1:** DirectX 11 HLSL 5.0</li><li>**12_0:** DirectX 12 HLSL 6.0</li><li>**12_1:** DirectX 12 HLSL 6.1</li><li>**12_3:** DirectX 12 HLSL 6.3 (Raytracing)</li></ul> |
| <span style="color:lightgreen">[EntryPoints `Stage=MethodName`]</span>      | Defines the entry point stage methods of the pass. The valid stage values are: <ul><li>**VS:** Vertex Shader.</li><li>**HS:** Hull Shader.</li><li>**DS:** Domain Shader.</li><li>**GS:** Geometry Shader.</li><li>**PS:** Pixel Shader.</li><li>**CS:** Compute Shader.</li></ul>                                                                                                                                                                                                                                                                                                                                                     |
| <span style="color:lightgreen">[Mode `value`]</span>                        | Defines the compilation mode of the pass. Available mode list:<ul><li>**None:** Default compilation mode.</li><li>**Debug:** Debug mode includes debugging symbols to analyze with shader tools like [RenderDoc](https://renderdoc.org/), [PIX](https://devblogs.microsoft.com/pix/introduction/), or [NVidia Nsight Graphics](https://developer.nvidia.com/nsight-graphics).<br/>See [Profile

## Textures Metatags

| Texture Tag                                   | Description                       |
|-----------------------------------------------|-----------------------------------|
| <span style="color:lightgreen">[Framebuffer]</span>                       | Framebuffer texture.              |
| <span style="color:lightgreen">[DepthBuffer]</span>                       | Depth buffer texture.             |
| <span style="color:lightgreen">[GBuffer]</span>                           | GBuffer texture.                  |
| <span style="color:lightgreen">[Lighting]</span>                          | Lighting texture.                 |
| <span style="color:lightgreen">[DFGLut]</span>                            | Lookup table for DFG precalculated texture. |
| <span style="color:lightgreen">[IBLRadiance]</span>                       | IBL Prefiltered Mipmapped radiance environment texture. |
| <span style="color:lightgreen">[ZPrePass]</span>                          | ZPrePass in forward rendering (Normal + Roughness). |
| <span style="color:lightgreen">[DistortionPass]</span>                    | Distortion pass in forward rendering. |
| <span style="color:lightgreen">[IBLIrradiance]</span>                     | IBL diffuse irradiance map.       |
| <span style="color:lightgreen">[TemporalHistory]</span>                   | Temporal AA history texture.      |
| <span style="color:lightgreen">[DirectionalShadowMap]</span>              | Shadow map array texture.         |
| <span style="color:lightgreen">[SpotShadowMap]</span>                     | Shadow map array texture.         |
| <span style="color:lightgreen">[PunctualShadowMap]</span>                 | Shadow map array cube texture.    |
| <span style="color:lightgreen">[Custom`0..N`]</span>                      | Custom render pipeline texture.   |

## List of Parameter Tags

Here you can find a complete list of available parameter tags that you can use in your effects:

| Parameters Tag                              | Type         | Update Policy | Description                                                              |
|---------------------------------------------|--------------|---------------|--------------------------------------------------------------------------|
| <span style="color:lightgreen">[FrameID]</span>                         | long          | PerFrame      | Gets Frame ID.                                                           |
| <span style="color:lightgreen">[DrawContextID]</span>                   | int           | PerView       | Gets draw context ID.                                                    |
| <span style="color:lightgreen">[DrawContextViewIndex]</span>            | int           | PerView       | Gets the view index of this draw context. A draw context can contain several views (cascade shadow, point light shadows, reflection probe, etc.). |
| <span style="color:lightgreen">[World]</span>                           | Matrix4x4     | PerDrawCall   | Gets the world value of the current render mesh.                         |
| <span style="color:lightgreen">[View]</span>                            | Matrix4x4     | PerView       | Gets the view value of the current camera.                               |
| <span style="color:lightgreen">[ViewInverse]</span>                     | Matrix4x4     | PerView       | Gets the view inverse value of the current camera.                       |
| <span style="color:lightgreen">[Projection]</span>                      | Matrix4x4     | PerView       | Gets the projection value of the current camera.                         |
| <span style="color:lightgreen">[UnjitteredProjection]</span>            | Matrix4x4     | PerView       | Gets the unjittered projection value of the current camera.              |
| <span style="color:lightgreen">[ProjectionInverse]</span>               | Matrix4x4     | PerView       | Gets the projection inverse value of the current camera.                 |
| <span style="color:lightgreen">[ViewProjection]</span>                  | Matrix4x4     | PerView       | Gets the view projection value of the current camera.                    |
| <span style="color:lightgreen">[UnjitteredViewProjection]</span>        | Matrix4x4     | PerView       | Gets the unjittered view projection value of the current camera.         |
| <span style="color:lightgreen">[PreviousViewProjection]</span>          | Matrix4x4     | PerView       | Gets the view projection value of the current camera in the previous frame. |
| <span style="color:lightgreen">[WorldViewProjection]</span>             | Matrix4x4     | PerDrawCall   | Gets the world view projection value of the current camera and mesh.     |
| <span style="color:lightgreen">[UnjitteredWorldViewProjection]</span>   | Matrix4x4     | PerDrawCall   | Gets the unjittered (TAA) world view projection value of the current camera and mesh. |
| <span style="color:lightgreen">[WorldInverse]</span>                    | Matrix4x4     | PerDrawCall   | Gets the inverse world value of the current render mesh.                 |
| <span style="color:lightgreen">[WorldInverseTranspose]</span>           | Matrix4x4     | PerDrawCall   | Gets the world inverse transpose of the current mesh.                    |
| <span style="color:lightgreen">[Time]</span>                            | float         | PerFrame      | Gets the time value since the game has started.                          |
| <span style="color:lightgreen">[CameraPosition]</span>                  | Vector3       | PerView       | Gets the position value of the current camera.                           |
| <span style="color:lightgreen">[CameraJitter]</span>                    | Vector2       | PerView       | Gets the current frame camera jittering.                                 |
| <span style="color:lightgreen">[CameraPreviousJitter]</span>            | Vector2       | PerView       | Gets the previous frame camera jittering.                                |
| <span style="color:lightgreen">[CameraRight]</span>                     | Vector3       | PerView       | Gets the right component of the camera orientation.                      |
| <span style="color:lightgreen">[CameraUp]</span>                        | Vector3       | PerView       | Gets the up component of the camera orientation.                         |
| <span style="color:lightgreen">[CameraForward]</span>                   | Vector3       | PerView       | Gets the forward component of the camera orientation.                    |
| <span style="color:lightgreen">[CameraFocalDistance]</span>             | float         | PerView       | Gets the camera focal distance (used with DoF).                          |
| <span style="color:lightgreen">[CameraFocalLength]</span>               | float         | PerView       | Gets the camera focal length.                                            |
| <span style="color:lightgreen">[CameraAperture]</span>                  | float         | PerView       | Gets the camera aperture.                                                |
| <span style="color:lightgreen">[CameraExposure]</span>                  | float         | PerView       | Gets the camera exposure.                                                |
| <span style="color:lightgreen">[CameraFarPlane]</span>                  | float         | PerView       | Gets the far plane of the camera.                                        |
| <span style="color:lightgreen">[CameraNearPlane]</span>                 | float         | PerView       | Gets the near plane of the camera.                                       |
| <span style="color:lightgreen">[ViewProjectionInverse]</span>           | Matrix4x4     | PerView       | Gets the inverse of the view projection value of the current camera.     |
| <span style="color:lightgreen">[MultiviewCount]</span>                  | int           | PerView       | Gets the number of eyes to be rendered.                                  |
| <span style="color:lightgreen">[MultiviewProjection]</span>             | Matrix4x4     | PerView       | Gets the stereo camera projection.                                       |
| <span style="color:lightgreen">[MultiviewView]</span>                   | Matrix4x4     | PerView       | Gets the stereo camera view.                                             |
| <span style="color:lightgreen">[MultiviewViewProjection]</span>         | Matrix4x4     | PerView       | Gets the stereo camera view projection.                                  |
| <span style="color:lightgreen">[MultiviewViewProjectionInverse]</span>  | Matrix4x4     | PerView       | Gets the stereo camera inverse view projection.                          |
| <span style="color:lightgreen">[MultiviewPosition]</span>               | Vector4       | PerView       | Gets the stereo camera view.                                             |
| <span style="color:lightgreen">[ForwardLightMask]</span>                | ulong         | PerDrawCall   | Gets the lighting mask, used in Forward passes.                          |
| <span style="color:lightgreen">[LightCount]</span>                      | uint          | PerView       | Gets the number of lights.                                               |
| <span style="color:lightgreen">[LightBuffer]</span>                     | IntPtr        | PerView       | Gets the light buffer ptr.                                               |
| <span style="color:lightgreen">[LightBufferSize]</span>                 | uint          | PerView       | Gets the light buffer size.                                              |
| <span style="color:lightgreen">[ShadowViewProjectionBuffer]</span>      | IntPtr        | PerView       | Gets the shadow view projection buffer pointer.                          |
| <span style="color:lightgreen">[ShadowViewProjectionBufferSize]</span>  | uint          | PerView       | Gets the shadow view projection buffer size.                              |
| <span style="color:lightgreen">[IBLMipMapLevel]</span>                  | uint          | PerFrame      | Gets the IBL texture mipmap level.                                       |
| <span style="color:lightgreen">[IBLLuminance]</span>                    | float         | PerFrame      | Gets the IBL luminance.                                                  |
| <span style="color:lightgreen">[IrradianceSH]</span>                    | IntPtr        | PerFrame      | Gets the irradiance spherical harmonics buffer ptr.                      |
| <span style="color:lightgreen">[IrradianceSHBufferSize]</span>          | uint          | PerFrame      | Gets the irradiance spherical harmonics buffer size.                     |
| <span style="color:lightgreen">[EV100]</span>                           | float         | PerView       | Gets the Exposition Value at ISO 100.                                    |
| <span style="color:lightgreen">[Exposure]</span>                        | float         | PerView       | Gets the camera exposure.                                                |
| <span style="color:lightgreen">[SunDirection]</span>                    | Vector3       | PerFrame      | Gets the sun direction.                                                  |
| <span style="color:lightgreen">[SunColor]</span>                        | Vector3       | PerFrame      | Gets the sun color.                                                      |
| <span style="color:lightgreen">[SunIntensity]</span>                    | float         | PerFrame      | Gets the sun intensity.                                                  |
| <span style="color:lightgreen">[SkyboxTransform]</span>                 | Matrix4x4     | PerFrame      | Gets the skybox transform.                                               |


## Overridden properties of the RenderLayer tags

These tags allow the pass to modify the render layer properties when the render pipeline runs this pass. To know more details about the RenderLayer properties read this [section](../renderlayers/index.md):


| Rasterization Process Tag      |  Description                               |
| ------------------------------ | ------------------------------------------ |
| <span style="color:lightgreen">[FillMode `Value`]</span>           | Determines the fill mode to use when rendering.<br/>Available values: _WireFrame_ or _Solid_   |
| <span style="color:lightgreen">[CullMode `Value`] </span>            |  Indicates triangles facing the specified direction are not drawn.<br/>Available values: _None_, _Front_ or _Back_      |
| <span style="color:lightgreen">[FrontCounterClockwise `bool`]</span>| Determines if a triangle is front- or back-facing. If this parameter is true, a triangle will be considered front-facing if its vertices are counter-clockwise on the render target and considered back-facing if they are clockwise. <br/> Available values: _True_ or _false_            |
| <span style="color:lightgreen">[DepthBias `int`]   | Depth value added to a given pixel. <br/> The value is an integer. |
| <span style="color:lightgreen">[DepthBiasClamp `float`] | Maximum depth bias of a pixel. <br/> The value is a float [0-1].|
| <span style="color:lightgreen">[SlopeScaledDepthBias `float`]</span> | Scalar on a given pixel's slope. <br/> The value is a float.|
| <span style="color:lightgreen">[DepthClipEnable `bool`]</span> | Enable clipping based on distance. <br/> Available values: _True_ or _False_|
| <span style="color:lightgreen">[ScissorEnable `bool`]</span> | Enable scissor-rectangle culling. All pixels outside an active scissor rectangle are culled. <br/> Available values: _True_ or _False_ |
| <span style="color:lightgreen">[AntialiasedLineEnable `bool`]</span> |  Specifies whether to enable line antialiasing; only applies if doing line drawing and MultisampleEnable is false. <br/> Available values: _True_ or _False. |

| Blend State Tag | Description |
| ------------------------------ | ------------------------------------------ |
| <span style="color:lightgreen">[AlphaToCoverageEnable `bool`]</span> | Specifies whether to use alpha-to-coverage as a multisampling technique when setting a pixel to a render target.<br/> Available values: _True_ or _False. |
| <span style="color:lightgreen">[IndependentBlendEnable `bool`]</span> | Specifies whether to enable independent blending in simultaneous render targets. Set to true to enable independent blending. If set to false, only the RenderTarget[0] members are used; RenderTarget[1..7] are ignored. <br/> Available values: _True_ or _False. |
| <span style="color:lightgreen">[RT0BlendEnable `bool`]</span> | Enable (or disable) blending for RenderTarget 0. <br/> Available values: _True_ or _False. | 
| <span style="color:lightgreen">[RT0SourceBlendColor `Value`]</span> | This blend option specifies the operation to perform on the RGB value that the pixel shader outputs. The BlendOp member defines how to combine the SrcBlend and DestBlend operations. <br/> Availables values: _Zero_, _One_ _SourceColor_, _InverseSourceColor_, _SourceAlpha_, _InverseSourceAlpha_, _DestinationAlpha_, _InverseDesinationAlpha_, _DestinationColor_, _InverseDestinatinoColor_, _SourceAlphaSaturate_, _BlendFactor_, _InverseBlendFactor_, _SecondarySourceColor_, _InverseSecondarySourceColor_, SecondarySourceAlpha_ or _InverseSecondarySourceAlpha_. |
| <span style="color:lightgreen">[RT0DestinationBlendColor `Value`]</span> | This blend option specifies the operation to perform on the current RGB value in the render target. The BlendOp member defines how to combine the SrcBlend and DestBlend operations. <br/> Availables values: _Zero_, _One_ _SourceColor_, _InverseSourceColor_, _SourceAlpha_, _InverseSourceAlpha_, _DestinationAlpha_, _InverseDesinationAlpha_, _DestinationColor_, _InverseDestinatinoColor_, _SourceAlphaSaturate_, _BlendFactor_, _InverseBlendFactor_, _SecondarySourceColor_, _InverseSecondarySourceColor_, SecondarySourceAlpha_ or _InverseSecondarySourceAlpha_. |
| <span style="color:lightgreen">[RT0BlendOperationColor `Value`]</span> | This blend operation defines how to combine the SrcBlend and DestBlend operations. <br/> Available values: _Add_, _Substract_, _ReverseSubstract_, _Min_ or _Max_.|
| <span style="color:lightgreen">[RT0SourceBlendAlpha `Value`]</span> | This blend option specifies the operation to perform on the alpha value that the pixel shader outputs. Blend options that end in _COLOR are not allowed. The BlendOpAlpha member defines how to combine the SrcBlendAlpha and DestBlendAlpha operations. <br/> Availables values: _Zero_, _One_ _SourceColor_, _InverseSourceColor_, _SourceAlpha_, _InverseSourceAlpha_, _DestinationAlpha_, _InverseDesinationAlpha_, _DestinationColor_, _InverseDestinatinoColor_, _SourceAlphaSaturate_, _BlendFactor_, _InverseBlendFactor_, _SecondarySourceColor_, _InverseSecondarySourceColor_, SecondarySourceAlpha_ or _InverseSecondarySourceAlpha_. |
| <span style="color:lightgreen">[RT0DestinationBlendAlpha `Value`]</span> | This blend option specifies the operation to perform on the current alpha value in the render target. Blend options that end in _COLOR are not allowed. The BlendOpAlpha member defines how to combine the SrcBlendAlpha and DestBlendAlpha operations. <br/> Availables values: _Zero_, _One_ _SourceColor_, _InverseSourceColor_, _SourceAlpha_, _InverseSourceAlpha_, _DestinationAlpha_, _InverseDesinationAlpha_, _DestinationColor_, _InverseDestinatinoColor_, _SourceAlphaSaturate_, _BlendFactor_, _InverseBlendFactor_, _SecondarySourceColor_, _InverseSecondarySourceColor_, SecondarySourceAlpha_ or _InverseSecondarySourceAlpha_. |
| <span style="color:lightgreen">[RT0BlendOperationAlpha `Value`]</span> | This blend operation defines how to combine the SrcBlendAlpha and DestBlendAlpha operations for RenderTarget 0. <br/> Available values: _Add_, _Substract_, _ReverseSubstract_, _Min_ or _Max_.|
| <span style="color:lightgreen">[RT0ColorWriteChannels `Value`]</span> | A write mask for Render target 0. <br/> Availables values: _None_, _Red_, _Green_, _Blue_, _Alpha_ or _All_. |

| Depth Stencil Tag | Description |
| ------------------------------ | ------------------------------------------ |
| <span style="color:lightgreen">[DepthEnable `bool`]</span> | Enable depth testing. <br/> Availables values: _True_ or _False_.|
| <span style="color:lightgreen">[DepthWriteMask `bool`]</span> | Identify a portion of the depth-stencil buffer that can be modified by depth data. <br/> Available values: _True_ or _False_.|
| <span style="color:lightgreen">[DepthFunction `Value`]</span> | A function that compares depth data against existing depth data. <br/> Availables values: _Never_, _Less_, _Equal_, _LessEqual_, _Greater_, _NotEqual_, _GreaterEqual_ or _Always_. |
| <span style="color:lightgreen">[StencilEnable `bool`]</span> | Enable stencil testing. <br/> Availables values: _True_ or _False_. |
| <span style="color:lightgreen">[StencilReadMask `byte`]</span> | Identify a portion of the depth-stencil buffer for reading stencil data. <br/> The value is a byte. |
| <span style="color:lightgreen">[StencilWriteMask `byte`]</span> | Identify a portion of the depth-stencil buffer for writing stencil data. <br/> The value is a byte.
| <span style="color:lightgreen">[FrontFaceStencilFailOperation `Value`]</span> | The stencil operation to perform when stencil testing fails in FrontFace <br/> Availables values: _Keep_, _Zero_, _Replace_, _IncrementSaturation_, _DescrementSaturation_, _Invert_, _Increment_, _Decrement_. |
| <span style="color:lightgreen">[FrontFaceStencilDepthFailOperation `Value`]</span> | The stencil operation to perform when stencil testing passes and depth testing fails in FrontFace. <br/> Availables values: _Keep_, _Zero_, _Replace_, _IncrementSaturation_, _DescrementSaturation_, _Invert_, _Increment_, _Decrement_. |
| <span style="color:lightgreen">[FrontFaceStencilPassOperation `Value`]</span> | The stencil operation to perform when stencil testing and depth testing both pass in FrontFace. <br/> Availables values: _Never_, _Less_, _Equal_, _LessEqual_, _Greater_, _NotEqual_, _GreaterEqual_ or _Always_. |
| <span style="color:lightgreen">[FrontFaceStencilFunction `Value`]</span> | A function that compares stencil data against existing stencil data in FrontFace. <br/> Availables values: _Never_, _Less_, _Equal_, _LessEqual_, _Greater_, _NotEqual_, _GreaterEqual_ or _Always_. |
| <span style="color:lightgreen">[BackFaceStencilFailOperation `Value`]</span> |The stencil operation to perform when stencil testing fails in BackFace <br/> Availables values: _Keep_, _Zero_, _Replace_, _IncrementSaturation_, _DescrementSaturation_, _Invert_, _Increment_, _Decrement_. |
| <span style="color:lightgreen">[BackFaceStencilDepthFailOperation `Value`]</span> | The stencil operation to perform when stencil testing passes and depth testing fails in BackFace. <br/> Availables values: _Keep_, _Zero_, _Replace_, _IncrementSaturation_, _DescrementSaturation_, _Invert_, _Increment_, _Decrement_. |
| <span style="color:lightgreen">[BackFaceStencilPassOperation `Value`]</span> | The stencil operation to perform when stencil testing and depth testing both pass in BackFace. <br/> Availables values: _Never_, _Less_, _Equal_, _LessEqual_, _Greater_, _NotEqual_, _GreaterEqual_ or _Always_. |
| <span style="color:lightgreen">[BackFaceStencilFunction `Value`]</span> | A function that compares stencil data against existing stencil data in BackFace. <br/> Availables values: _Never_, _Less_, _Equal_, _LessEqual_, _Greater_, _NotEqual_, _GreaterEqual_ or _Always_. |
| <span style="color:lightgreen">[StencilReference `int`]</span> | The reference value to use when doing a stencil test. <br/> The value is a integer. |