# Create custom LineBatch
---
In most cases will be enough to use the default linebatch3D provided by the RenderManager, but sometimes is useful to create your custom line batch because you can modify its global transformation or you can modify its render behavior without impact in the default line batch included in Evergine. In these cases will be interesting to create an independent custom line batch.

## How to create a custom linebatch
```csharp
public class MyDrawable : Drawable3D
{
    [BindService]
    private AssetsService assetsService = null;

    private GraphicsContext graphicsContext;

    private LineBatch3D lineBatch;

    protected override bool OnAttached()
    {
        this.graphicsContext = Application.Current.Container.Resolve<GraphicsContext>();
        var layer = this.assetsService.Load<RenderLayerDescription>(DefaultResourcesIDs.OpaqueRenderLayerID);

        // Create custom line batch 3D
        this.lineBatch = new LineBatch3D(this.graphicsContext, layer);

        // Add line batch to render
        this.Managers.RenderManager.AddRenderObject(this.lineBatch);

        return base.OnAttached();
    }

    protected override void OnActivated()
    {
        // Enable line batch when the component is activated
        this.lineBatch.IsEnabled= true;
        base.OnActivated();
    }

    protected override void OnDeactivated()
    {
        // Disable line batch when the component is deactivated
        this.lineBatch.IsEnabled= false;
        base.OnDeactivated();
    }

    protected override void OnDetach()
    {
        // Remove line batch from render when the component is detached
        this.Managers.RenderManager.RemoveRenderObject(this.lineBatch);
        base.OnDetach();
    }

    public override void Draw(DrawContext drawContext)
    {
        // Draw a sample blue cone
        this.lineBatch.DrawCone(0.5f, 1.0f, Vector3.UnitY, Vector3.Down, Color.Blue);
    }
}
```

The line batch has a **Transform** property that could be used to apply transformations (translation, rotation, or scale) to all elements added to the batch. For example, if you use the line batch to draw a CAD map you can use this property to rotate the whole map.

The line batch by default requires that every frame the elements to draw will be added to the batch, but in some cases is interesting to create a static batch and draw the same elements every frame because any new element will not need to be added to the batch at runtime, so you can use the property **ResetAfterRender** to indicates that the line batch doesn't reset the batch every frame.

```csharp
this.lineBatch = new LineBatch3D(this.graphicsContext, layer)
{
    ResetAfterRender = false,
};
```