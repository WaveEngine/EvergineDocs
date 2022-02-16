# Create a texture from code

The most common use **Texture** is assigning them into **Materials** and **Components**. However, it's perfectly valid to use and even create a **Texture** from code.

## Load Texture asset from code
As explained in [this article](../../evergine_studio/assets/use.md), it's perfectly possible. Here is a sample code for creating a primitive entity with a Diffuse material.

```csharp

protected override void CreateScene()
{
    AssetSceneManager assets = this.Managers.AssetSceneManager;

    // Loading  'Diffuse.png' located in 'Content/Textures/
    Texture diffuseTexture = assets.Load<Texture>(EvergineContent.Textures.Diffuse**png);

    // We create a standard material and assign the texture as diffuse channel.
    StandardMaterial materialDecorator = new StandardMaterial(assets.Load<Effect>(EvergineContent.Effects.StandardEffect));
    material.BaseColorTexture = diffuseTexture;

    // We create a primitive
    Entity teapot = new Entity("texturedTeapot")
                        .AddComponent(new Transform3D())
                        .AddComponent(new TeapotMesh())
                        .AddComponent(new MaterialComponent(){ Material = materialDecorator.Material})
                        .AddComponent(new MeshRenderer());

    this.Managers.EntityManager.Add(teapot);
}

```

## Create a Texture from code
Creating a **Texture** demands a little bit more effort, and it's defined in [this article](../low_level_api/texture.md). Bassically we need to define two main things:
- **TextureDescription** structure. 
- **DataBoxes** with the texture data.

#### TextureDescription

The **TextureDescription** struct that contains all the specifications of the **Texture** so the graphic card can properly load the **buffer data** accordingly and be able to extract all their information. 

| Property | Values | Description |
| -------- | ------ | ----------- |
| TextureType | Texture2D, Texture2DArray, Texture1D, Texture1DArray, TextureCube, TextureCubeArray, Texture3D | The type of the texture.
| Width | unsigned integer | Width of the texture (first dimmension). The maximum value is defined by the device hardware.
| Height | unsigned integer | Height of the texture (second dimmension). The maximum value is defined by the device hardware.
| Depth | unsigned integer | Depth of the texture (third dimension). Used in **Texture3D**. The maximum value is defined by the device hardware.
| ArraySize | unsigned integer | The number of  textures in a **Texture Array** (either 1D, 2D or Cube).
| Faces | unsigned integer | The number of texture faces used in **TextureCube** and **TextureCubeArray**.
| MipLevels | unsigned integer | Maximum number of mipmap levels in the **Texture**.
| ResourceUsage | <ul><li>**Default**: Requires read and write acces from the GPU.</li><li>**Immutable**: Can only be read by GPU. Cannot be writtend or accessed by CPU.</li><li>**Dynamic**: Can be accessed by the GPU (read only) and the CPU (write only). Used for textures updated in CPU.</li><li>**Staging**: Supports data transfer (copy) from the GPU to the CPU.</li></ul> |  Type of access of the **Texture**. |
| Usage | None, Count2, Count4, Count8, Count16, Count32| Number of samples in the **Texture**.

#### DataBoxes
A **DataBox** represents a data buffer that contains all pixel of an element of texture. Every mipmap level, array slice or cube face defines its own DataBox.