# Bind Components

Using the **[BindComponent]** attribute allows your [Components](../component_arch/components/index.md) to establish dependencies with other components.

```csharp
// Bind with the Transform component of the owner entity...
[BindComponent]
private Transform3D transform;

// Bind a list with all Camera3D components of the entire scene...
[BindComponent(source: BindComponentSource.Scene)]
private List<Camera3D> sceneCameras;
```

> [!NOTE]
> [BindComponent] can only be used inside Components. Otherwise, the binding cannot be resolved.

## [BindComponent] Properties

This attribute offers several ways to customize:

### isRequired (default `true`)

If the value is true, the dependency is required to be resolved; otherwise, the current Component won't be attached.

For instance, in the following example, we have a custom component `MyComponent`, and a definition of an Entity with two components (a `Transform3D` and `MyComponent`):

```csharp
public class MyComponent : Component
{
    [BindComponent(isRequired: true)] 
    private Transform3D transform;

    [BindComponent(isRequired: false)] 
    private Camera3D camera;
}
```

```csharp
Entity entity = new Entity()
    .AddComponent(new Transform3D())
    .AddComponent(new MyComponent());
```

The MyComponent will be attached correctly because all requirements have been satisfied:
* The **required Transform3D** will be injected into the `transform` attribute, because we previously added a Transform3D component.
* The `camera` attribute won't be resolved, and this value will be equal to `null`; however, the component will be attached because **this dependency is not required**.

On the other hand, in this other Entity, the MyComponent instance won't be attached because the Transform3D dependency cannot be resolved:

```csharp
Entity anotherEntity = new Entity()    
    .AddComponent(new MyComponent());
```

### isExactType (default `true`)

If the value is true, it indicates that the Type of the component to bind must be the same as the type required (neither subclass nor parent class).

For instance, the following component `MyComponent` requires a component of the exact type `Camera`:

```csharp
public class MyComponent : Component
{
    [BindComponent] // isExactType: true by default
    private Camera camera;
}
```

```csharp
Entity entity = new Entity()
    .AddComponent(new Transform3D())
    .AddComponent(new Camera3D())
    .AddComponent(new MyComponent());
```

In that case, the dependency won't be injected because the entity has no `Camera` component (it has a `Camera3D` component, which is a subclass, but `isExactType` is true).

However, if we change the MyComponent definition and set `isExactType` value to false, the dependency will be satisfied because the entity has a component assignable to a Camera type (the Camera3D component):

```csharp
public class MyComponent : Component
{
    [BindComponent(isExactType: false)]
    private Camera camera;
}
```

### source (default `BindComponentSource.Owner`)

This property indicates where the component or components will be searched. There are several values:

| Source | Description |
| --- | --- |
| `Owner` (default) | The Component will be searched in the owner entity. |
| `Scene` | The Component is searched in the entire Scene. It iterates over all entities in the scene to find if components exist. |
| `Children` | Search the Components in its descendant entities, **including the owner entity**. |
| `ChildrenSkipOwner` | Search the Components in its descendant entities, **not including the owner entity**. |
| `Parents` | Search the Components in the ascendant entities, **including the owner entity**. |
| `ParentsSkipOwner` | Search the Components in its ascendant entities, **not including the owner entity**. |

A brief example:

```csharp
public class MyComponent : Component
{
    // Bind the first Camera3D component in the scene...
    [BindComponent(source: BindComponentSource.Scene)]
    private Camera3D firstCamera;

    // Bind a list with all Camera3D components in the entire scene...
    [BindComponent(source: BindComponentSource.Scene)]
    private List<Camera3D> sceneCameras;

    // ...
}
```

### isRecursive (default `true`)

If set to `true`, the search will include all descendants (or ascendants) in the hierarchy; otherwise, the search will only include direct descendants.

### tag (default `null`)

If the tag has value, it will only find components in entities that have the specified Tag. It works for filtering entities.

```csharp
public class MyComponent : Component
{
    // Bind a list with all Camera3D components of all Entities tagged with "Tag"
    [BindComponent(source: BindComponentSource.Scene, tag: "Tag")]
    private List<Camera3D> sceneCameras;

    // ...
}
```