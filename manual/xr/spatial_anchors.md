# XR Spatial Anchors

A **spatial anchor** represents an important point in the real world that the system tracks over time. Each anchor has an adjustable coordinate system, based on other anchors or frames of reference, to ensure anchored holograms stay precisely in place.

Rendering a hologram in an anchor's coordinate system gives you the most precise positioning for that hologram at any given time. This comes at the cost of small adjustments over time to the hologram's position as the system continually moves it back into place based on the real world.

By **saving local spatial anchors** to disk and loading them back later, your application **can calculate the same location in the real world** across multiple application sessions on a single HoloLens.

While spatial anchors are great for holograms that should remain fixed in the world, once an anchor is placed, it can't be moved.

## Supported Devices

Currently in Evergine, the following devices has **Spatial Anchors** support:

| Device | XR Platform |
| --- | --- |
| **HoloLens 2** | Windows Mixed Reality. You can find useful information [here](https://learn.microsoft.com/en-us/windows/mixed-reality/design/spatial-anchors). |


## TrackSpatialAnchor Component

![Spatial Anchors](images/spatialanchor_componment.png)

In Evergine, you can create Spatial Anchors in your device using the `TrackSpatialAnchor` component. This component allows you to do:
* Detect a Spatial Anchor and place the owner entity in the tracked pose (position and orientation).
* Create a Spatial Anchor to a desired position and orientation.

> [!Note]
> During the application running, the position is usually updated to adapt the anchor position to the best predicted pose.


### Properties and Methods

The following properties provides you the way to setup a Spatial Anchor

| Property | Description |
| --- | --- |
| **AnchorId** | The Anchor Identifier. This is the Id used to find the anchor in the XR Platform. If the XR Platform find a stored anchor with the given ID, it will track and update the position of the owner entity. |
| **StoreAnchor()**  |  Store the current entity position and orientation as an spatial anchor with the current AnchorId. After this method |

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
            AnchorId = "AwesomeAnchor" // The anchor Id.
        });

    this.Managers.EntityManager.Add(anchor);
}
```

## Low-Level Spatial Anchors

While the most usual way to access to Spatia Anchors is using the `TrackSpatialAnchor`component, you can access to a low-level way that provides more functionality.

The `XRPlatform.SpatialAnchorStore` gives access to all low-level functionality implemented by the XR Platform. If this property is `null` the XR device doesn't support Spatial Anchor.

Another useful class is `SpatialAnchor`. This class is represent a Spatial Anchor in your XR System. With `XRPlatform.SpatialAnchorStore` class you can create/delete/update instances of `SpatialAnchor`.


### SpatialAnchor properties

This class represent a spatial anchor that can be persisted or updated in your XR Platform

| Property | Description |
| --- | --- |
| **Transform** (only get) | Gets the detected transform (Matrix4x4?) of the Spatial Anchor. |


### XRPlatform.SpatialAnchorStore properties and methods

| Property | Description |
| --- | --- |
| **SavedAnchors** | Read only dictionary <string, SpatialAnchor> that returns all stored anchors in this device. |
| **CreateSpatialAnchor()** | Create a SpatialAnchor instance in the specified position and orientation. This method only create the SpatialAnchor instance, **but not persist this anchor in the device** |
| **StoreAnchor(id, anchor)** | Store the specified SpatialAnchor instance with the given identifier. After this method, this anchor will be persisted and can be accessed everytime the application runs. |
| **RemoveAnchor(id)** | Remove a stored anchor with the given identifier. |
| **RemoveAllAnchors()** | Remove all persisted anchors in this device. |

> [!Note]
> There can only be one SpatialAnchor for each identifier

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
        throw new InvalidOperationException("XRPlatform doesn't support Spatial Anchor");
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
        throw new InvalidOperationException("XRPlatform doesn't support Spatial Anchor");
    }

    var material = this.Managers.AssetSceneManager
        .Load<Material>(EvergineContneet.DefaultMaterialID);

    foreach (var anchorId in this.spatialAnchorStore.SavedAnchors.Keys)
    {
        Entity anchorEntity = new Entity()
            .AddComponent(new Transform3D())
            .AddComponent(new MaterialComponent() { Material = material })
            .AddComponent(new CubeMesh() { Size = 0.1f } )
            .AddComponent(new MeshRenderer())
            .AddComponent(new TrackSpatialAnchor(){
                AnchorId = anchorId // The anchor Id.
            });

        this.Managers.EntityManager.Add(anchorEntity);
    }
}
```
