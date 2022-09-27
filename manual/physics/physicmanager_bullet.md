# PhysicManager and Bullet

![Physics](images/physics.png)

In Evergine, Physics are implemented with the **PhysicManager3D** class, a [SceneManager](../basics/scenes/scenemanagers.md). This manager is responsible to create and maintain the Physic World. This is an abstract class that only offer the functionality that a Physic Manager should implement:
- Create the Physic World
- Allow to create Physic elements (Bodies, Colliders, etc...)
- OFfer the possibility to perform physic queries (ray casting, sweep test, etc...).

Because **PhysicManager3D** is a SceneManager, every scene has their own Physic World.

## PhysicManager3D properties

To properly setup your Physic World, the following properties are useful:

| Property | Default | Description | 
| --- | --- | --- |
| **Gravity** | 0, -9.8, 0 | This is the global gravity vector, in m/s. The default value is 1G (-9.8m/s) |
| **PerformPhysicSteps** | true | Indicates if the physic simulation will be updated evey frame. If your scene has dynamics objects (rigidbodies), and this property is set to false, this objects won't be simulated. If your applications only use static bodies, it is recommended to set this property to false. |
| **MaxSubSteps** | 1 | In how many subdivisions the physic world updated are divided. Greater values produce better simulations, but the performance is degraded.  |
| **PhysicWorldResolution** | 1 | The general physic world scale. By default, 1 unit in Evergine is equal to 1 unit in Physic World. Changing this value allows to change this behavior. For example, a value of 10 indicates that a sphere with radius 1 will produce a physic object of 10. Changing this value is useful when the objects are too small or too big. |
| **FixedTimeStep** | 1.0/60 | The physic steps will perform at a fixed timestep indicated in this property (in seconds). By default is 60Hz |
| **DrawFlags** | `All`,<br/>-`DrawAabb`,<br/>-`DrawContactPoints` | This flags allows you to select which elements want to be rendered when `RenderManager.DebugLines` is set to `true`. By default all elements are included excepht Aabb and contact points: <ul><li>**DrawWireframe:** Debug draw mesh collider wireframe.</li><li>**DrawAabb:** Debug draw bodies AABB. </li><li>**DrawContactPoints:** Debug draw the contact points between bodies.</li><li>**DrawConstraints:** Debug draw physic joints.</li><li>**DrawConstraintLimits:** Debug draw the physic joints limits.</li><li>**DrawFastWireframe:** Debug draw wireframes in a fast way.</li><li>**DrawNormals:** Debug draws normals.</li></ul>  |

## Bullet and BulletPhysicManager3D

Evergine provides an implementation for PhysicManagr3D using the open-source **[Bullet Physics](https://pybullet.org/wordpress/)** engine. For detailed information, see the [Bullet User](https://github.com/bulletphysics/bullet3/blob/master/docs/Bullet_User_Manual.pdf).

In Evergine, the Bullet implementation can be used with the `BulletPhysicManager3D`.

![Bullet Logo](images/bullet_logo.png)

### Using BulletPhysicManager3D

To start using Physics in your scene, you need to create an instance of `BulletPhysicManager3D` and register into your Scene. This implementation is provided in the **Evergine.Bullet** nuget package.

> [!NOTE]
> Evergine project template will register the Bullet physic manager by default.

```csharp
public

public class MyScene : Scene
{
    public override void RegisterManagers()
    {
        base.RegisterManagers();
        this.Managers.AddManager(new Evergine.Bullet.BulletPhysicManager3D());
    }

    // Other scene methods...

}
```
