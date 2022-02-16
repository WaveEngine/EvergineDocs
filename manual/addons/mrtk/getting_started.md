# Getting started
---
To get started using our Mixed Reality Toolkit, you have to follow these steps:
1. Create a new Evergine project, or open an existing one.
2. Install the Evergine.MRTK add-on using the add-on management option in Evergine Studio.

![Add-on installation](images/addon_installation.png)

3. Change all scenes that will use MRTK functionality so they extend MRTK's XRScene class instead of Evergine's Scene class. You must also fill in some values for material properties that the scene uses.
```csharp
using System;
using Evergine.MRTK.Scenes;

namespace Evergine.MRTK.Demo.Scenes
{
    public class DemoScene : XRScene
    {
        protected override Guid CursorMatPressed => EvergineContent.MRTK.Materials.Cursor.CursorPinch;

        protected override Guid CursorMatReleased => EvergineContent.MRTK.Materials.Cursor.CursorBase;

        protected override Guid HoloHandsMat => EvergineContent.MRTK.Materials.HoloHands;

        protected override Guid SpatialMappingMat => Guid.Empty;

        protected override Guid HandRayTexture => EvergineContent.MRTK.Textures.line_dots_png;

        protected override Guid HandRaySampler => EvergineContent.MRTK.Samplers.LinearWrapSampler;
    }
}
```
> [!Note]
> You will probably see an error related to the CreateScene method, which is sealed in the XRScene class. If you need to add more entities to your scene, override the OnPostCreateXRScene instead.

4. Register an instance of the NoesisService class in your Application.
```csharp
var noesisService = new NoesisService();
this.Container.RegisterInstance(noesisService);
```

And that's it! Your project should be ready to use MRTK components.