# Cone Twist Joint

For ragdolls, the **Cone-Twist Joint** is useful for limbs like the upper arm. It is a special point-to-point joint that adds cone and twist axis limits.

A Cone-Twist Joint is similar to a Point-to-Point Joint relationship but specifies an elliptical cone within which rotation may take place. The cone is described by specifying a maximum rotation on each axis.

## ConeTwistJoint3D

In Evergine, a Cone-Twist Joint is implemented using the `ConeTwistJoint3D` component.

![Point-to-Point Joint](images/conetwistJointComponent.png)

## Properties

### Common Properties

| Property | Default | Description |
| --- | --- | --- |
| **ConnectedEntityPath** | null |  The [entity path](../../basics/component_arch/entities/entity_hierarchy.md#entity-paths) of the connected body. Only when the path is valid is a joint properly established. |
| **Anchor** | 0, 0, 0 | The point which defines the center of the joint in source entity local space. All physics-based simulations use this point as the center in calculations. |
| **AutoConfigureConnected** | true | Enable this setting to automatically calculate the *ConnectedAnchor* position to match the global position of the anchor property. This is the default setting. Disable it to configure the position of the connected anchor manually. |
| **ConnectedAnchor** | *auto-calculated* | Manually configure the connected anchor position in the connected body local space. |
| **BreakPoint** | 0 | If the value is greater than 0, it indicates the force that needs to be applied for this joint to break. |
| **CollideConnected** | false | Determines whether a collision between the two bodies managed by the joint is enabled. |

### Limit Properties

| Property | Default | Description |
| --- | --- | --- |
| **ConeTwistSettings** | 30º, 30º, 30º | Defines the limitation angle on each axis. |
| **LimitSoftness** | 0.9 | Once an angle is greater than softness * the maximum angle, the constraint begins to take effect. Lowering the value of softness softens the constraint boundaries. |
| **LimitBiasFactor** | 0.3 | The rate at which the constraint corrects errors in orientation. A value of 1 will ensure that the constraint is always obeyed. It is recommended to keep bias between 0.2 and 0.5. |
| **LimitRelaxationFactor** | 1 | The rate at which the angular velocity is changed by the constraint. A low value means the constraint will modify the velocities slowly, leaving the boundaries appearing softer. |

### Motor Properties

The following properties set the motor properties of the joint.

| Property | Default | Description |
| --- | --- | --- |
| **UseMotor** | false | If enabled, the motor makes the object spin around. |
| **MotorTargetRotation** | 0, 0, 0 | The target angular speed on each axis. |
| **MotorTargetImpulse** | 0 | The impulse applied to attain the speed. |

## Using Cone-Twist Joint

This snippet creates a series of bodies attached using Cone-Twist joints.

<video autoplay loop muted width="400px" height="auto">
  <source src="images/ConeTwistSample.mp4" type="video/mp4">
</video>

```csharp
protected override void CreateScene()
{
    this.Managers.RenderManager.DebugLines = true;

    // Load your material
    var cubeMaterial = this.Managers.AssetSceneManager.Load<Material>(EvergineContent.CrateMat);

    int chainLength = 4;
    Entity previousLink = null;

    // Create the chain...
    for (int i = 0; i < chainLength; i++)
    {
        // The first object is kinematic (we don't want a falling chain :D)
        var rigidObjectType = (i == 0) ? RigidBodyType3D.Kinematic : RigidBodyType3D.Dynamic;

        // Create the link entities...
        var link = this.CreateCube(cubeMaterial, new Vector3(i, 0, 0), 0.75f, rigidObjectType);

        if (previousLink != null)
        {
            // Limit Joint to 40º or 10º...
            var angle = MathHelper.ToRadians(i % 2 == 0 ? 40 : 10);

            // Add a PointToPoint joint to the previous link connected to the current link...
            previousLink.AddComponent(new ConeTwistJoint3D()
            {
                ConnectedEntityPath = link.EntityPath,
                Anchor = new Vector3(0.5f, 0, 0),           // Sets the anchor between the two objects
                ConeTwistSettings = Vector3.One * angle,    // Sets the limit angle...
            });
        }

        previousLink = link;

        this.Managers.EntityManager.Add(link);
    }
}

private Entity CreateCube(Material material, Vector3 position, float size, RigidBodyType3D rigidBodyType)
{
    Entity cube = new Entity()
        .AddComponent(new Transform3D()
        {
            Position = position
        })
        .AddComponent(new MaterialComponent() { Material = material })
        .AddComponent(new CubeMesh() { Size = size })
        .AddComponent(new MeshRenderer())

        .AddComponent(new RigidBody3D()         // Add a RigidBody3D component...
        {
            PhysicBodyType = rigidBodyType,
        })
        .AddComponent(new BoxCollider3D());     // Add a BoxCollider3D to the physic body...

    return cube;
}
```