# Prefabs
Sometimes you need to reuse entities including their components and their descendants. Instead of use copy and paste or entity duplication for doing this, that will create maintenance problems, you can use the concept of _prefab_. A _prefab_ is a type of asset which helps developers with this basic function: reusing.

## Creating a prefab
To create a prefab, first you need to build your entities hierarchy and assign components. For example, we can create an entity with a teapot and a plane, and a [Spinner](xref:Evergine.Components.Graphics3D.Spinner) component to the top of this hierarchy.

![Prefab structure](images/prefabs-init.jpg)

To create a prefab, right click on the top-most entity that you wan to include in it, and select _Create prefab_ option.

![Prefab creation](images/prefabs-create.jpg)

This will create a new asset with _weprefab_ extension the same folder that you have selected in _Project Explorer_ panel. If you created prefab in the wrong folder, don't worry as they are like any other Evergine asset, you can move it wherever you want.

![Prefab creation](images/prefabs-folder.jpg)

If you save changes and reload the scene, you will realize that entities that were part of created prefab, are marked now with a "(Prefab)" suffix. Using prefab creation option **is not reversible once you save the scene**. You can also drag and drop asset element from _Asset Details_ panel to your scene, to create new prefab instances. 

### Prefabs edition

If you change values on those entities, this will no affect to new and existing prefab instances. In future releases, we plan to provide an specific prefabs editor. For now, a good option is to create your prefab in a separated scene. At the time of using _Create prefab_ option, a new prefab file will be created, but _**do not**_ save the scene. Doing this, you could modify your entities in the future. Just replace previous prefab file version with the new one.

We don't officially support prefab nesting. This is, create a separated scene for your prefab, and use another prefab in that scene.

### Prefab instantiation

To create a prefab instance programmatically, you can use following code snippet:
```csharp
var prefab = this.assetsService.Load<Prefab>(EvergineContent.Scenes.Entity_weprefab);
var entity = prefab.Instantiate();
```
