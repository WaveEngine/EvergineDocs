# PhysicManager and Bullet

![Physics](images/physics.png)

In Evergine, Physics are implemented with the **PhysicManager3D** class, a [SceneManager](../basics/scenes/scenemanagers.md). This manager is responsible for creating and maintaining the Physic World. This is an abstract class that only offers the functionality that a Physic Manager should implement:
- Create the Physic World
- Allow the creation of Physic elements (Bodies, Colliders, etc.)
- Offer the possibility to perform physic queries (ray casting, sweep test, etc.).

Because **PhysicManager3D** is a SceneManager, every scene has its own Physic World.

## PhysicManager3D properties

To properly set up your Physic World, the following properties are useful:

| Property | Default | Description | 
| --- | --- | --- |
| **Gravity** | 0, -9.8, 0 | This is the global gravity vector, in m/s². The default value is 1G (-9.8m/s²) |
| **PerformPhysicSteps** | true | Indicates if the physic simulation will be updated every frame. If your scene has dynamic objects (rigidbodies), and this property is set to false, these objects won't be simulated. If your applications only use static bodies, it is recommended to set this property to false. |
| **MaxSubSteps** | 1 | In how many subdivisions the physic world updates are divided. Greater values produce better simulations, but the performance is degraded.  |
| **PhysicWorldResolution** | 1 | The general physic world scale. By default, 1 unit in Evergine is equal to 1 unit in Physic World. Changing this value affects this behavior. For example, a value of 10 indicates that a sphere with a radius of 1 will produce a physic object of 10. Changing this value is useful when the objects are too small or too large. |
| **FixedTimeStep** | 1.0/60 | The physic steps will perform at a fixed timestep indicated in this property (in seconds). By default, it is 60Hz. |
| **DrawFlags** | `All`,<br/>-`DrawAabb`,<br/>-`DrawContactPoints` | These flags allow you to select which elements you want to be rendered when `RenderManager.DebugLines` is set to `true`. By default, all elements are included except Aabb and contact points: <ul><li>**DrawWireframe:** Debug draw mesh collider wireframe.</li><li>**DrawAabb:** Debug draw bodies AABB. </li><li>**DrawContactPoints:** Debug draw the contact points between bodies.</li><li>**DrawConstraints:** Debug draw physic joints.</li><li>**DrawConstraintLimits:** Debug draw the physic joints limits.</li><li>**DrawFastWireframe:** Debug draw wireframes in a fast way.</li><li>**DrawNormals:** Debug draw normals.</li></ul>  |

## Bullet and BulletPhysicManager3D

Evergine provides an implementation for PhysicManager3D using the open-source **[Bullet Physics](https://pybullet.org/wordpress/)** engine. For detailed information, see the [Bullet User Manual](https://github.com/bulletphysics/bullet3/blob/master/docs/Bullet_User_Manual.pdf).

In Evergine, the Bullet implementation can be used with the `BulletPhysicManager3D`.

![Bullet Logo](images/bullet_logo.png)

### Using BulletPhysicManager3D

To start using Physics in your scene, you need to create an instance of `BulletPhysicManager3D` and register it into your Scene. This implementation is provided in the **Evergine.Bullet** NuGet package.

> [!NOTE]
> Evergine project templates will register the Bullet Physic Manager by default.

```csharp
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