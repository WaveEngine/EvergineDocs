# Slider Joint

<video autoplay loop muted width="100%" height="auto">
  <source src="images/SliderJointVideo.mp4" type="video/mp4">
</video>

The **Slider Joint** allows rigid bodies to rotate around one axis and translate along the same axis.

## SliderJoint3D

In Evergine, a Slider Joint is implemented using the `SliderJoint3D` component.

![Hinge Joint](images/sliderJointComponent.png)


### Common Properties

| Property | Default | Description |
| --- | --- | --- |
| **ConnectedEntityPath** | null | The [entity path](../../basics/component_arch/entities/entity_hierarchy.md#entity-paths) of the connected body. Only when the path is valid is a joint properly established. |
| **Axis** | 1, 0, 0 | The direction of the axis around which the body slides. The direction is defined in local space. |
| **Anchor** | 0, 0, 0 | The position of the axis around which the body slides. The position is defined in local space. |
| **AutoConfigureConnected** | true | Enable this setting to automatically calculate the *ConnectedAnchor* position and *ConnectedAxis* to match the global position of the anchor property. This is the default setting. Disable it to configure the position of the connected anchor and connected axis manually. |
| **ConnectedAxis** | *auto-calculated* | The joint axis relative to the connected body. |
| **ConnectedAnchor** | *auto-calculated* | Manually configure the connected anchor position in the connected body's local space. |
| **BreakPoint** | 0 | If the value is greater than 0, it indicates the force that needs to be applied for this joint to break. |
| **CollideConnected** | false | Determines whether a collision between the two bodies managed by the joint is enabled. |

### Limit Properties

The following properties set the limits of the rotational movement.

| Property | Default | Description |
| --- | --- | --- |
| **UseLinearLimit** | false | If enabled, the position of the sliding object will be restricted within the *LowerLinearLimit* & *UpperLinearLimit* values. |
| **LowerLinearLimit** | 0 | The lower distance of the limit. |
| **UpperLinearLimit** | 0 | The upper distance of the limit. |
| **UseAngularLimit** | false | If enabled, the angle of the slider will be restricted within the *LowerAngularLimit* & *UpperAngularLimit* values. |
| **LowerAngularLimit** | 0 | The lowest angle of the rotation. |
| **UpperAngularLimit** | 0 | The highest angle of the rotation. |

### Motor Properties

The following properties set the motor properties of the joint.

| Property | Default | Description |
| --- | --- | --- |
| **UseLinearMotor** | false | If enabled, the motor makes the object slide linearly. |
| **TargetLinearMotorVelocity** | 0 | The linear speed the object tries to attain. |
| **MaxLinearMotorForce** | 0 | The linear force applied in order to attain the speed. |
| **UseAngularMotor** | false | If enabled, the motor makes the object spin. |
| **TargetAngularMotorVelocity** | 0 | The angular speed the object tries to attain. |
| **MaxAngularMotorForce** | 0 | The angular impulse applied in order to attain the speed. |


## Using Slider Joint

This snippet creates a small bridge of a series of connected bodies.

<video autoplay loop muted width="400px" height="auto">
  <source src="images/SliderJointSample.mp4" type="video/mp4">
</video>

```csharp
protected override void CreateScene()
{
    this.Managers.RenderManager.DebugLines = true;

    // Load your material
    var material = this.Managers.AssetSceneManager.Load<Material>(DefaultResourcesIDs.DefaultMaterialID);
    var cubeMaterial = this.Managers.AssetSceneManager.Load<Material>(EvergineContent.CrateMat);

    float sliderLength = 3;

    // Create the slider holder...
    Entity slider = new Entity()
        .AddComponent(new Transform3D()
        {
            Scale = new Vector3(sliderLength, 0.1f, 0.1f),
            Rotation = new Vector3(0, 0, MathHelper.ToRadians(-10)) // Rotate 10º the slider axis
        })
        .AddComponent(new MaterialComponent() { Material = material })
        .AddComponent(new CubeMesh())
        .AddComponent(new MeshRenderer())
        .AddComponent(new RigidBody3D()
        {
            PhysicBodyType = RigidBodyType3D.Kinematic
        });

    // Create the sliding object...
    Entity cube = new Entity()
        .AddComponent(new Transform3D())
        .AddComponent(new MaterialComponent() { Material = cubeMaterial })
        .AddComponent(new CubeMesh() { Size = 0.5f })
        .AddComponent(new MeshRenderer())
        .AddComponent(new RigidBody3D()
        {
            PhysicBodyType = RigidBodyType3D.Dynamic,
        });

    // Create the Joint
    slider.AddComponent(new SliderJoint3D()
    {
        ConnectedEntityPath = cube.EntityPath,
        UseLinearLimit = true, // Limit the slider
        LowerLinearLimit = -sliderLength / 2,
        UpperLinearLimit = sliderLength / 2
    });

    this.Managers.EntityManager.Add(slider);
    this.Managers.EntityManager.Add(cube);
}
```