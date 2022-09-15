# Import Fonts
---
![Fonts header](../images/fonts.jpg)

The **font** asset allow you render text in your project using differents font families and styles.

## Import a Font asset in Evergine Studio
You can create a font click button on ![Plus Icon](../images/plusIcon.jpg) from [Assets Details](../../evergine_studio/interface.md) panel to deploy a create menu options and click on the option _"Create material"_

![Create new material menu option](images/import_fonts.png)

### Inspect materials in Asset Details
You can find the material assets in the [**Assets Details**](../../evergine_studio/interface.md) panel when you select a folder in the [**Project Explorer**](../../evergine_studio/interface.md).

![Material asset](images/materialAsset.jpg)

### Material files in content directory
The material file has the `.wemt` extension.

![Material file](images/materialFile.jpg)

## Create a new Material from code
The following sample code can be used to create a new material and apply to an entity in your scene.
In that case the material will be created using the **StandardEffect** effect and the **Opaque** render layer:

```csharp
protected override void CreateScene()
{
    var assetsService = Application.Current.Container.Resolve<AssetsService>();

    // Load the effect...
    Effect standardEffect = assetsService.Load<Effect>(EvergineContent.Effects.StandardEffect);

    // Load a Render Layer description...
    RenderLayerDescription layer = assetsService.Load<RenderLayerDescription>(EvergineContent.RenderLayers.Opaque);

    // Create your own material...
    Material material = new Material(standardEffect);
    material.LayerDescription = layer;

    // Apply to an entity
    Entity primitive = new Entity()
            .AddComponent(new Transform3D())
            .AddComponent(new MaterialComponent() { Material = material })  
            .AddComponent(new SphereMesh())
            .AddComponent(new MeshRenderer());

    this.Managers.EntityManager.Add(primitive);
}