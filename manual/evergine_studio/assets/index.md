# Assets
---
![Assets](images/assets.jpg)

An **asset** is an item that represents an element in **Evergine Studio** that can be used in your project. It can represent visual or graphic elements like **3D models**, **textures**, or either more abstract engine elements like **sampler states**, **materials** and **render layers**. 

## Type of assets

Here it is a summary of different asset types.

### Assets with resource file

Some assets are created using external applications, like _3ds Max_, _Blender_ or _Photoshop_. 

These assets are _resource files_ that can be imported in **Evergine Studio** and used in your project, either by the **Studio** or directly by code. 

Here are the asset with resource files that **Evergine** currently supports.

| Asset | Description | Supported file extensions|
|--------------------|-------------|-------------|
| [Texture](../../graphics/textures/index.md) | Image file used as texture graphic resource. | `.jpg`, `.jpeg`, `.png`, `.bmp`, `.tga`, `.ktx`, `.dds`, `.hdr` |
| [Model](../../graphics/models/index.md) | 3d model with geometry, animation and material information. | `.gltf`, `.glb`, `.fbx`, `.3ds`, `.obj`, `.dae` |
| [Sound](../../audio/sounds/index.md) | Audio file used for music and sound effects | `.wav`, `.mp3`, `.ogg`
| File | Any file that does not satisfy the previous formats | Any other file.
| [Font](../../graphics/fonts/index.md) | Font file used as font graphics resource | `.ttf`, `.otf`

### Assets created only by Evergine

However, some assets represents just abstract elements that can only be created by **Evergine Studio**, some of them even by code. They don't have any external associated resource file. Some of these assets have complex folder structure, while others are more basic.

| Asset | Description |
|-------|-------------|
| [Scene](../../basics/scenes/index.md) | Main **Evergine** asset. It defines an entity graph that populates a scene, and also define their components. 
| [Effect](../../graphics/effects/index.md) | Contains a **HLSL shader**. It automatically translates to other shading languages like **GLSL**. They are also flavored with custom attributes and annotations for a better integration.
| [Post Processing Graph](../../graphics/postprocessing_graph/index.md) | Defines a visual post processing graph node, using **compute shaders** for effects like _anti-aliasing_, _tone mapping_, _SSAO_, and many others.
| [Material](../../graphics/materials/index.md) | Represents how a geometry is rendered. It references an Effect asset and describes its parameters like textures and values.
| [Prefab](../../basics/component_arch/prefabs/index.md) | Contains an entity hierarchy that can be instanced in any scene.
| [Render Layer](../../graphics/render_layers.md) | Contains **Rasterizer**, **Blending**, **Depth** and **Stencil** information. Every material needs a Render Layer asset.
| [Sampler State](../../graphics/samplers.md) | Element that represents a texture sampler state description, like **filtering**, **clamping** or **wrapping** information.|

## In this section
* [Create Assets](create.md)
* [Edit Assets](edit.md)
* [Export Assets](export.md)
* [Use Assets](use.md)
