# AdvancedTrackXRDevice

This component allows you to track **all kinds of XR Devices**, not only controllers or hands but also base stations, generic trackers, etc.

![TrackXRDevice](images/advancedtrackxrdevice.png)

## Selection Strategy

This component can select the device to track in different ways, which is defined by the `SelectionStrategy` property. The available values are:
* **ByHandedness:** Specify the device using handedness (left or right device). This is the most common way to select a device.
* **ByDeviceType:** Select the device by specifying the type of the device and the number of occurrences.
* **ByDeviceTypeAndHandedness:** Select the device by specifying the type of the device and the handedness.
* **ByDeviceIndex:** The InputTracking maintains an ordered list of tracked devices. Using this strategy, the device will be selected by specifying an index on that list.

### Selection by Handedness
If your selection strategy is `ByHandedness`, you will select your device by using its handedness. In this case, you need to set these properties:

| Property | Description |
| --- | --- |
| **Handedness** | This property indicates the handedness of the device that you want to track: <ul><li>`LeftHand` to specify the left hand.</li><li>`RightHand` to specify the right hand.</li><li>`Undefined` if the device has no specific handedness.</li></ul> |
| **DeviceIndex** | If there are multiple devices using the same handedness, this property specifies which occurrence is selected. |

### Selection by Device Type
If your selection strategy is `ByDeviceType`, you will select your device by using its type. In this case, you need to set these properties:

| Property | Description |
| --- | --- |
| **DeviceType** | Specify the type of device you want to select: <ul><li>`Controller` if you want to select a typical controller device.</li><li>`HMD` if you want to track the headset device.</li><li>`GenericTracker` to select typical tracker devices (such as Vive Tracker).</li><li>`TrackingReference` refers to devices used as a tracking reference (such as Vive Base Stations or old Oculus Rift Camera Sensors).</li><li>`Hand` if the system can detect the user's hands.</li></ul> |
| **DeviceIndex** | If there are multiple devices of the same type, this property specifies which occurrence is selected. |

### Selection by Device Type and Handedness
If your selection strategy is `ByDeviceTypeAndHandedness`, you will select your device by using its type and handedness. In this case, you need to set these properties:

| Property | Description |
| --- | --- |
| **DeviceType** | Specify the type of device you want to select: <ul><li>`Controller` if you want to select a typical controller device.</li><li>`HMD` if you want to track the headset device.</li><li>`GenericTracker` to select typical tracker devices (such as Vive Tracker).</li><li>`TrackingReference` refers to devices used as a tracking reference (such as Vive Base Stations or old Oculus Rift Camera Sensors).</li><li>`Hand` if the system can detect the user's hands.</li></ul> |
| **Handedness** | This property indicates the handedness of the device that you want to track: <ul><li>`LeftHand` to specify the left hand.</li><li>`RightHand` to specify the right hand.</li><li>`Undefined` if the device has no specific handedness.</li></ul> |
| **DeviceIndex** | If there are multiple devices with the same properties described above, this property specifies which occurrence is selected. |

### Selection by Device Index
If your selection strategy is `ByDeviceIndex`, you will select your device by its index as registered in your system.

| Property | Description |
| --- | --- |
| **DeviceIndex** | Integer specifying the index of the device. |

## Tracking Lost Mode

This component will update the entity's Transform to follow the selected device. However, if an issue occurs during the tracking process, you can specify how the entity behaves using the following property:

| Property | Description |
| --- | --- |
| **TrackingLostMode** | Specify the strategy to follow if the device is not well tracked: <ul><li>`DisableEntityOnPoseInvalid` disables the entity if the tracked pose is not valid. If the device is well tracked again, the entity will be enabled again. *This is the default value.*</li><li>`KeepLastPose` stops tracking the entity if the pose is not valid, maintaining the entity with the last pose received.</li><li>`DisableEntityOnDisconnection` disables the entity only if the selected device is no longer connected.</li></ul> |

## Using AdvancedTrackXRDevice

In the following code, you will find how to create entities to track left and right controllers, and two generic trackers:

```csharp
    protected override void CreateScene()
    {
        base.CreateScene();

        // Left entity
        var leftDevice = new Entity()
            .AddComponent(new Transform3D())
            .AddComponent(new AdvancedTrackXRDevice()
            {
                SelectionStrategy = TrackXRDevice.SelectionDeviceStrategy.ByDeviceTypeAndHandedness,
                DeviceType = XRTrackedDeviceType.Controller,
                Handedness = XRHandedness.LeftHand // select the left device
            });

        // Right entity
        var rightDevice = new Entity()
            .AddComponent(new Transform3D())
            .AddComponent(new AdvancedTrackXRDevice()
            {
                SelectionStrategy = TrackXRDevice.SelectionDeviceStrategy.ByDeviceTypeAndHandedness,
                DeviceType = XRTrackedDeviceType.Controller,
                Handedness = XR.XRHandedness.RightHand // select the right device
            });

        this.Managers.EntityManager.Add(leftDevice);
        this.Managers.EntityManager.Add(rightDevice);

        // First Tracker 
        var firstTracker = new Entity()
            .AddComponent(new Transform3D())
            .AddComponent(new AdvancedTrackXRDevice()
            {
                SelectionStrategy = TrackXRDevice.SelectionDeviceStrategy.ByDeviceType,
                DeviceType = XRTrackedDeviceType.GenericTracker,
                DeviceIndex = 0 // First
            });

        // Second Tracker 
        var secondTracker = new Entity()
            .AddComponent(new Transform3D())
            .AddComponent(new AdvancedTrackXRDevice()
            {
                SelectionStrategy = TrackXRDevice.SelectionDeviceStrategy.ByDeviceType,
                DeviceType = XRTrackedDeviceType.GenericTracker,
                DeviceIndex = 1 // Second
            });

        this.Managers.EntityManager.Add(firstTracker);
        this.Managers.EntityManager.Add(secondTracker);
    }
```