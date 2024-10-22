# Binding Elements
---

Evergine allows you to bind dependencies automatically across your components, services, and scene managers.

For example, bindings allow a custom component to require that its Owner Entity has a Transform3D component and set it to a property during the **Attach** phase (see the [Lifecycle](../lifecycle_elements.md) documents).

This binding feature gives developers a lot of flexibility to interconnect components, services, and scene managers, avoiding the tedious setup of these dependencies in Evergine Studio or from code.

In Evergine, we define bindings using property attributes ([BindComponent] for example).

> [!NOTE]
> All dependencies are not available until the Attach phase. If you try to access them during the constructor, `OnLoaded()`, or `OnDestroy()` methods, the property value is going to be `null`.

## In this section

There are four types of binding:
* [Bind Components](bind_components.md)
* [Bind Services](bind_services.md)
* [Bind Entities](bind_entities.md)
* [Bind Scene Managers](bind_scenemanagers.md)

## Example

In the following example, the component will bind a service, a component, and a scene manager.
```csharp
public class MyComponent : Component
{
    [BindService]
    private AssetsService assetsService;

    [BindSceneManager]
    private RenderManager renderManager;

    [BindComponent]
    private Transform3D transform;

    private Material defaultMaterial;

    protected override Start()
    {
        // All values of bind attributes will be injected after the Attach phase...
        
        // Bind assetsService
        this.defaultMaterial = this.assetsService.Load<Material>(EvergineContent.Materials.DefaultMaterial);
        
        // Bind SceneManagers
        this.renderManager.DebugLines = true;
        
        // Bind Components
        this.transform.Position = Vector3.Zero;
    }

    // ... 
}
```

## Bind Collections

If the [Bind] attribute is set on top of a `List<T>` property, it will attempt to search for a list of elements that satisfy the dependency:

```csharp
// Bind with the Transform component of the owner entity...
[BindComponent]
private Transform3D transform;

// Bind a list with all Camera3D components in the entire scene...
[BindComponent(source: BindComponentSource.Scene)]
private List<Camera3D> sceneCameras;
```