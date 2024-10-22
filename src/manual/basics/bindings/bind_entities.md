# Bind Entities

Using the **[BindEntity]** attribute allows your components to establish dependencies with [Entities](../component_arch/entities/index.md) in your scene.

The search is made using the Entity.Tag property:

```csharp
// Binding with the first Entity in the Scene tagged with "Player"
[BindEntity(tag: "Player")]
private Entity player;

// Search all Entities with the "Item" tag...
[BindComponent(tag: "Item")]
private List<Entity> itemList;
```

> [!NOTE]
> [BindEntity] can only be used inside Components. In other cases, the binding cannot be resolved.

## [BindEntity] Properties

This attribute offers several ways to customize:

### source (default `BindEntitySource.Scene`)

This property indicates where the component or components will be searched. The possible values are:

| Source | Description |
| --- | --- |
| `Scene` (default)| The Entity is searched in the entire Scene. It iterates over all entities in the scene. |
| `Children` | Searches the Entity in its descendant entities, **excluding the owner entity** |
| `ChildrenSkipOwner` | Searches the Entity in its descendant entities, **not including the owner entity** |
| `Parents` | Searches the Entity in the ascendant entities, **including the owner entity** |
| `ParentsSkipOwner` | Searches the Entity in its ascendant entities, **not including the owner entity** |

A brief example:

```csharp
public class MyComponent : Component
{
    // Binding with the first Entity in the Scene tagged with "Player"
    [BindEntity(tag: "Player")] // source: Scene is default value 
    private Entity player;
    // ...
}
```

### isRequired (default `true`)

If the value is `true`, the dependency is required to be resolved; otherwise, the current Component won't be attached.

The IsRequired value has the same functionality as [BindComponent] (see [Bind Components](bind_components.md) for further details).

### isRecursive (default `true`)

If set to `true`, the search will include all descendants (or ascendants) in the hierarchy; otherwise, the search will only include the direct descendants.

### tag (default `null`)

The Entities will be filtered by their tag value.