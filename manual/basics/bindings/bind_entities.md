# Bind Entities

Using **[BindEntity]** attribute allows your components to stablish dependencies with [Entities](../component_arch/entities/index.md) in your scene.

The search is made using the Entity.Tag propert:

```csharp
// Binding with the first Entity in the Scene tagged with "Player"
[BindEntity(tag: "Player")]
private Entity player;

// Search all Entities with "Item" tag...
[BindComponent(tag: "Item")]
private List<Entity> itemList;
```

> [!NOTE]
> [BindEntity] can only be used inside Components. In other case the binding cannot be resolved

## [BindEntity] Properties
This attribute offers several ways to customize:

### source (default `BindEntitySource.Scene`)

This property indicates where the component or components will be searched. There are several values:

| Source | Description |
| --- | --- |
| `Scene` (default)| The Entity is searched in the entire Scene. It iterates over all entities in the scene. |
| `Children` | Search the Entity in its descendant entities, **excluding the owner entity** |
| `ChildrenSkipOwner` | Search the Entity in its descendant entities, **not including the owner entity** |
| `Parents` | Search the Entity in the ascendant entities, **including the owner entity** |
| `ParentsSkipOwner` | Search the Entity in its ascendant entities, **not including the owner entity** |


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

If the value is `true` the dependency is required to be resolved, in other case, the current Component won't be attached.

The IsRequired value has the same functionality than [BindComponent] (see [Bind Components](bind_components.md for further details)).

### isRecursive (default `true`)

If set to `true` the search will include all descendants (or ascendants) in the hierarchy; otherwise, the search will only include the direct descendants.

### tag (default `null`)

The Entities will be filtered by its tag value.