# Drawables

---

**Drawables** are a type of Component that allows you to perform an action during each Draw/Render cycle of the Application. A Drawable is associated with an Entity, and all Drawables in a scene are managed by [**RenderManager**](../../../graphics/rendering_overview.md).

## Drawable3D
![Drawable3D](../../../graphics/images/teapot.png)

**Drawable3Ds** are a type of Drawable designed to provide 3D content. They are processed on every **Camera3D** render. In these components, you usually create graphic elements to draw 3D features (models, billboards, background environments, etc...).

Add the following property:
 
| Property | Description |
| --- | --- |
| **CastShadows** | Boolean value indicating whether this model will cast shadows. True by default. |

### Creating a Drawable3D
From Visual Studio, you can create a C# class with the following code:

```csharp
using Evergine.Common.Graphics;
using Evergine.Framework;
using Evergine.Framework.Graphics;
using Evergine.Mathematics;
using System;

namespace MyProject
{
    public class BBoxDrawable : Drawable3D
    {
        [BindComponent]
        private Transform3D transform;

        public Vector3 Size {get;set;} = Vector3.One;
        public Color Color {get; set;} = Color.Red;

        public override void Draw(DrawContext drawContext)
        {
            var orientedBBox = new BoundingOrientedBox(
                this.transform.Position, 
                this.Size, 
                this.transform.Orientation);

            // Draw an oriented bounding box with the specified color and size...
            this.Managers.RenderManager.LineBatch3D.DrawBoundingOrientedBox(orientedBBox, this.Color);
        }
    }
}
```

## Graphics Content

A Drawable will add objects to the RenderManager to be drawn (sprites, meshes, etc...). Read the [Render Overview](../../../graphics/rendering_overview.md) document for further details.

## Add/Remove a Drawable
To add/remove a Drawable to/from your entity, both from code or Evergine Studio, is the same as adding/removing a component because a Drawable is a type of component. You can see how to add/remove a component [here](index.md).