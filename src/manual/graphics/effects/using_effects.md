# Using Effects
---
![Materials header](images/effects.jpg)

In this document, you will learn how to load and use **Effects** in your applications.

## How to apply an effect to a material from Evergine Studio

From the [Material Editor](../materials/material_editor.md), you can select the effect that the material will use from the top side of the properties.

![Material Editor](images/ApplyEffect.jpg)

## Load Effect from code
The following sample code can be used to instantiate an existing effect asset, create an associated material, and apply it to an entity in your scene.
```csharp
protected override void CreateScene()
{
    var assetsService = Application.Current.Container.Resolve<AssetsService>();

    // Load effect
    Effect standardEffect = assetsService.Load<Effect>(EvergineContent.Effects.StandardEffect);

    // Create material associated
    Material defaultMaterial = new Material(standardEffect)
    {
        LayerDescription = assetsService.Load<RenderLayerDescription>(EvergineContent.RenderLayers.Opaque),
    };

    // Apply to an entity
    Entity primitive = new Entity()
            .AddComponent(new Transform3D())
            .AddComponent(new MaterialComponent() { Material = defaultMaterial })
            .AddComponent(new SphereMesh())
            .AddComponent(new MeshRenderer());

    this.Managers.EntityManager.Add(primitive);
}
```