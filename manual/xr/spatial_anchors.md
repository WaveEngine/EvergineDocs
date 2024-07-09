# XR Spatial Anchors

A **spatial anchor** represents an important point in the real world that the system tracks over time. Each anchor has an adjustable coordinate system based on other anchors or frames of reference, ensuring that anchored holograms stay precisely in place.

Rendering a hologram in an anchor's coordinate system gives you the most precise positioning for that hologram at any given time. This comes at the cost of small adjustments over time to the hologram's position as the system continually moves it back into place based on the real world.

By **saving local spatial anchors** to disk and loading them back later, your application **can calculate the same location in the real world** across multiple application sessions on a single HoloLens.

While spatial anchors are great for holograms that should remain fixed in the world, once an anchor is placed, it can't be moved.

## Supported Devices

Currently, in Evergine, the following devices have **Spatial Anchors** support:

| Device | XR Platform |
| --- | --- |
| **HoloLens 2** | Windows Mixed Reality. You can find useful information [here](https://learn.microsoft.com/en-us/windows/mixed-reality/design/spatial-anchors). |


## TrackSpatialAnchor Component

![Spatial Anchors](images/spatialanchor_componment.png)

In Evergine, you can create Spatial Anchors on your device using the `TrackSpatialAnchor` component. This component allows you to:
* Detect a Spatial Anchor and place the owner entity in the tracked pose (position and orientation).
* Create a Spatial Anchor in a desired position and orientation.

> [!Note]
> During the application's runtime, the position is usually updated to adapt the anchor position to the best predicted pose.


### Properties and Methods

The following properties provide you with the means to set up a Spatial Anchor:

| Property | Description |
| --- | --- |
| **AnchorId** | The Anchor Identifier. This is the ID used to find the anchor in the XR Platform. If the XR Platform finds a stored anchor with the given ID, it will track and update the position of the owner entity. |
| **StoreAnchor()**  |  Stores the current entity's position and orientation as a spatial anchor with the current AnchorId. |

#### Using TrackSpatialAnchor from code

```csharp
protected override void CreateScene()
{
    base.CreateScene();

    // Spatial Anchor entity
    var anchor = new Entity()
        .AddComponent(new Transform3D())
        .AddComponent(new TrackSpatialAnchor() 
        { 
            AnchorId = "AwesomeAnchor" // The anchor ID.
        });

    this.Managers.EntityManager.Add(anchor);
}
```

## Low-Level Spatial Anchors

While the most usual way to access Spatial Anchors is by using the `TrackSpatialAnchor` component, you can access a low-level method that provides more functionality.

The `XRPlatform.SpatialAnchorStore` gives access to all low-level functionality implemented by the XR Platform. If this property is `null`, the XR device doesn't support Spatial Anchors.

Another useful class is the `SpatialAnchor`. This class represents a Spatial Anchor in your XR System. With the `XRPlatform.SpatialAnchorStore` class, you can create, delete, and update instances of `SpatialAnchor`.


### SpatialAnchor properties

This class represents a spatial anchor that can be persisted or updated in your XR Platform.

| Property | Description |
| --- | --- |
| **Transform** (only gets) | Gets the detected transform (Matrix4x4?) of the Spatial Anchor. |


### XRPlatform.SpatialAnchorStore properties and methods

| Property | Description |
| --- | --- |
| **SavedAnchors** | Read-only dictionary <string, SpatialAnchor> that returns all stored anchors on this device. |
| **CreateSpatialAnchor()** | Creates a Spatial Anchor instance in the specified position and orientation. This method only creates the Spatial Anchor instance but does not persist this anchor on the device. |
| **StoreAnchor(id, anchor)** | Stores the specified Spatial Anchor instance with the given identifier. After this method, this anchor will be persisted and can be accessed every time the application runs. |
| **RemoveAnchor(id)** | Removes a stored anchor with the given identifier. |
| **RemoveAllAnchors()** | Removes all persisted anchors on this device. |

> [!Note]
> There can only be one Spatial Anchor for each identifier.

#### Store a Spatial Anchor from code

```csharp
[BindService]
private XRPlatform xrPlatform;

[BindComponent]
private Transform3D transform;

public void StoreAnchor(string id)
{
    if (this.xrPlatform.SpatialAnchorStore == null)
    {
        throw new InvalidOperationException("XRPlatform doesn't support Spatial Anchors");
    }

    // Create the spatial anchor...
    var anchor = this.xrPlatform.SpatialAnchorStore.CreateSpatialAnchor(this.transform.Position, this.transform.Orientation);
    if(anchor != null)
    {
        // Store the spatial anchor...
        this.xrPlatform.SpatialAnchorStore.StoreAnchor(id, anchor);
    }    
}
```

#### Debug all stored anchors from code

```csharp
[BindService]
private XRPlatform xrPlatform;

protected override void Start()
{
    if (this.xrPlatform.SpatialAnchorStore == null)
    {
        throw new InvalidOperationException("XRPlatform doesn't support Spatial Anchors");
    }

    var material = this.Managers.AssetSceneManager
        .Load<Material>(EvergineContent.DefaultMaterialID);

    foreach (var anchorId in this.xrPlatform.SpatialAnchorStore.SavedAnchors.Keys)
    {
        Entity anchorEntity = new Entity()
            .AddComponent(new Transform3D())
            .AddComponent(new MaterialComponent() { Material = material })
            .AddComponent(new CubeMesh() { Size = 0.1f } )
            .AddComponent(new MeshRenderer())
            .AddComponent(new TrackSpatialAnchor(){
                AnchorId = anchorId // The anchor ID.
            });

        this.Managers.EntityManager.Add(anchorEntity);
    }
}
```
