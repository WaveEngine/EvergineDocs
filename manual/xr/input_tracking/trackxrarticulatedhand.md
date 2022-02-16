# TrackXRArticulatedHand

![TrackXRArticulatedHand](images/trackxrarticulatedhand.jpg)

This component is used to track and obtain the state of an articulated hand. It inherit from **[TrackXRDevice](trackxrdevice.md)**, so all the previous described functionality is maintained in this component.

## Supported Hand Joints

Evergine supports a list of hand joints to be tracked, it is described using the `XRHandJointKind` enumeration, and its values can be visually perceived in the following image:

![Hand Joints](images/hand-skeleton.png)


## Additional properties

The following properties has been added to this component in order to acces hand joint information:

| Property | Description |
| --- | --- |
| **SupportedHandJointKind** |  | Returns a `XRHandJointKind[]` array of supported hand joints. Hand tracking in some devices can be limited and only support some joints |
| **TryGetArticulatedHandJoint()** | Obtains the articulated hand joint state specified using a `XRHandJointKind` value. Return true if the joint is susscessfully obtained. |

## Using TrackXRArticulatedHand

### Create a TrackXRArticulatedHand from code
In the following code you will find how to create an entity that track a controller from code:

```csharp
    protected override void CreateScene()
    {
        base.CreateScene();

        var material = Application.Current.Container
            .Resolve<AssetsService>()
            .Load<Material>(DefaultResourcesIDs.DefaultMaterialID);


        // Hand entity
        var hand = new Entity()
            .AddComponent(new Transform3D())
            .AddComponent(new MaterialComponent() { Material = material })
            .AddComponent(new TeapotMesh() { Size = 0.15f })
            .AddComponent(new MeshRenderer())
            .AddComponent(new TrackXRDevice()
            {
                SelectionStrategy = TrackXRDevice.SelectionDeviceStrategy.ByDeviceType,
                DeviceType = Evergine.Framework.XR.TrackedDevices.XRTrackedDeviceType.Hand,
                DeviceTypeCount = 0 // First hand...
            });

        this.Managers.EntityManager.Add(hand);
    }
```

### Read the Hand Joints

Small sample to read the hand joint state:

```csharp
    public class DebugArticulatedhand : Behavior
    {
        [BindComponent]
        private TrackXRArticulatedHand trackXRHand;

        protected override void Update(TimeSpan gameTime)
        {
            var lineBatch = this.Managers.RenderManager.LineBatch3D;
            if (trackXRHand.IsConnected)
            {
                // Iterate over all supported joints
                foreach (var supportedJoint in this.trackXRHand.SupportedHandJointKind)
                {
                    // Obtain the joint pose and draw it...
                    if (this.trackXRHand.TryGetArticulatedHandJoint(supportedJoint, out var handJoint))
                    {
                        Matrix4x4.CreateFromTR(ref handJoint.Pose.Position, ref handJoint.Pose.Orientation, out var jointTransform);
                        lineBatch.DrawAxis(jointTransform, 0.01f); // Draw 1cm axis with the joint transform
                    }
                }
            }
        }
    }
```