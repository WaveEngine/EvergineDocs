# Box Collider

![Box Collider](images/box_collider.png)

A Box shaped collider.

## BoxCollider3D component

To use a Box Collider in Evergine, you only need to add a `BoxCollider3D` component to your entity:

![BoxCollider3D](images/boxcollider3d_component.png)

### Properties

| Property | Default | Description | 
| --- | --- | --- |
| **Size** | 1,1,1 | This property define the size of the Box collider. <br/><video width="600" height="220" autoplay loop><source src="images/box_collider_size.mp4" type="video/mp4"></video><br/>The **Size** value can be used in two ways:<ul><li>If the Entity has a mesh (with `MeshComponent` for example), the Size value is relative to the mesh extents. *In that case, a value of 1,1,1 let the BoxCollider3D to fit the entity mesh.*</li><li>If the entity hasn't any meshes, the Size value is used as scene units. *In that case, a value of 2,2,2 will create a box collider of 2x2x2 units.*</li></ul>| 
| **Offset** | 0,0,0 | Offset the collider respect the owner entity. <br/><video width="600" height="220" autoplay loop><source src="images/box_collider_offset.mp4" type="video/mp4"></video><br/>The **Offset** value can be used in two ways:<ul><li>If the Entity has a mesh (with `MeshComponent` for example), the Offset value is relative to the mesh extents.</li><li>If the entity hasn't any meshes, the Offset value is used as scene units.</li></ul> | 
| **RotationOffset** | 0,0,0 | Apply to the Collider a rotation offset respect the owner entity. <br/><video width="600" height="220" autoplay loop><source src="images/box_collider_rotationoffset.mp4" type="video/mp4"></video><br/> | 
| **Margin** | 0.04 | Physic Engine uses a small collision margin for collision shapes, to improve performance and reliability of the collision detection. | 