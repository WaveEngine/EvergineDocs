# Loading models on runtime

Loading dynamic models has always been challenging in _Evergine_. To address this, we have introduced new packages that support _GLB_ and _STL_ formats. These packages allow you to manage scenarios where your models are not part of the initial application bundle (i.e., they are not static application assets) or are marked as _Raw_  [assets](../../evergine_studio/assets/index.md). For instance, you can dynamically download models from the internet and display them to users. The new runtime loader packages facilitate this process.

```csharp
var assetsService = Application.Current.Container.Resolve<AssetsService>();
var glbModel = await GLBRuntime.Instance.Read("Models/samurai_toad.glb");
var stlModel = await STLRuntime.Instance.Read("Models/Star_Destroyer_Fixed.stl");
```

The _Read_ method supports both a file path and a file stream.

Remember to add package references to your csproj file.

```xml
<PackageReference Include="Evergine.Runtimes.GLB" Version="2024.6.??" />
<PackageReference Include="Evergine.Runtimes.STL" Version="2024.6.??" />
```

If you are running a web project, you should also add following package in your start project.

```xml
<PackageReference Include="SkiaSharp.Views.Blazor" Version="2.88.8" />
```

## Material assigners
Both packages offer their unique methods for loading models and textures. However, you can customize this process by providing your own material assigner function.

```csharp
public async Task LoadModelTask() {
    var model = await GLBRuntime.Instance.Read("Scenes/DamagedHelmet.glb", this.CustomMaterialAssigner);
    var entity = model.InstantiateModelHierarchy(assetsService);
    this.Managers.EntityManager.Add(entity);
}

private async Task<Material> CustomMaterialAssigner(MaterialData data)
{
    var assetsService = Application.Current.Container.Resolve<AssetsService>();

    // Get textures            
    var baseColor = await data.GetBaseColorTextureAndSampler();
    var metallicRoughness = await data.GetMetallicRoughnessTextureAndSampler();
    var normalTex = await data.GetNormalTextureAndSampler();  
    var emissive = await data.GetEmissiveTextureAndSampler();
    var occlussion = await data.GetOcclusionTextureAndSampler();            

    // Get Layer
    var opaqueLayer = assetsService.Load<RenderLayerDescription>(DefaultResourcesIDs.OpaqueRenderLayerID);
    var alphaLayer = assetsService.Load<RenderLayerDescription>(DefaultResourcesIDs.AlphaRenderLayerID);
    RenderLayerDescription layer;
    float alpha = data.BaseColor.A / 255.0f;
    switch (data.AlphaMode)
    {
        default:
        case Evergine.Framework.Runtimes.AlphaMode.Mask:
        case Evergine.Framework.Runtimes.AlphaMode.Opaque:
            layer = opaqueLayer;
            break;
        case Evergine.Framework.Runtimes.AlphaMode.Blend:
            layer = alphaLayer;
            break;
    }

    // Create standard material            
    var effect = assetsService.Load<Effect>(DefaultResourcesIDs.StandardEffectID);            
    StandardMaterial standard = new StandardMaterial(effect)
    {
        LightingEnabled = data.HasVertexNormal,
        IBLEnabled = data.HasVertexNormal,
        BaseColor = data.BaseColor,
        Alpha = alpha,
        BaseColorTexture = baseColor.Texture,
        BaseColorSampler = baseColor.Sampler,
        Metallic = data.MetallicFactor,
        Roughness = data.RoughnessFactor,
        MetallicRoughnessTexture = metallicRoughness.Texture,
        MetallicRoughnessSampler = metallicRoughness.Sampler,
        EmissiveColor = data.EmissiveColor.ToColor(),
        EmissiveTexture = emissive.Texture,
        EmissiveSampler = emissive.Sampler,
        OcclusionTexture = occlussion.Texture,
        OcclusionSampler = occlussion.Sampler,
        LayerDescription = layer,                
    };

    // Normal textures
    if (data.HasVertexTangent)
    {
        standard.NormalTexture = normalTex.Texture;
        standard.NormalSampler = normalTex.Sampler;
    }

    // Alpha test
    if (data.AlphaMode == Evergine.Framework.Runtimes.AlphaMode.Mask)
    {
        standard.AlphaCutout = data.AlphaCutoff;
    }

    // Vertex Color
    if (data.HasVertexColor)
    {
        if (standard.ActiveDirectivesNames.Contains("VCOLOR"))
        {
            var directivesArray = standard.ActiveDirectivesNames;
            Array.Resize(ref directivesArray, directivesArray.Length + 1);
            directivesArray[directivesArray.Length - 1] = "VCOLOR";
            standard.ActiveDirectivesNames = directivesArray;
        }
    }

    return standard.Material;
}
```