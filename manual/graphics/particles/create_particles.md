# Create Particle Systems
---
![Particles header](images/plasma.jpg)

Particle systems simulates and renders a large amount of quads called particles. 

## Create a Particle Systems asset in Evergine Studio
You can create a material click button on ![Plus Icon](../images/plusIcon.jpg) from [Assets Details](../../evergine_studio/interface.md) panel to deploy a create menu options and click on the option _"Create particles"_

![Create new particle system menu option](images/create_particles.png)

### Inspect Particle Systems in Asset Details
You can find the material assets in the [**Assets Details**](../../evergine_studio/interface.md) panel when you select a folder in the [**Project Explorer**](../../evergine_studio/interface.md).

![Material asset](images/materialAsset.jpg)

### Particle System files in content directory
The material file has the `.wemt` extension.

![Material file](images/materialFile.jpg)

## Create a new Particle System from code
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