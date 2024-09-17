# Capsule Collider

![Capsule Collider](images/capsule_collider.png)

A capsule-shaped collider.

A capsule is a special shape defined by two properties:
* **Radius:** The radius of the collider's local width.
* **Height:** The total height of the collider.

![Capsule shape](images/capsule_shape.png)

## SphereCollider3D Component

To use a Sphere Collider in Evergine, you only need to add a `SphereCollider3D` component to your entity:

![CapsuleCollider3D](images/capsulecollider3d_component.png)

### Properties

| Property | Default | Description | 
| --- | --- | --- |
| **Radius** | 0.5 | This property defines the radius of the Capsule collider. <br/><video width="600" height="220" autoplay loop><source src="images/capsule_collider_radius.mp4" type="video/mp4"></video><br/>The **Radius** value can be used in two ways:<ul><li>If the entity has a mesh (with `MeshComponent` for example), the Radius value is relative to the mesh extents.</li><li>If the entity has no meshes, the Radius value is used as scene units.</li></ul>|
| **Height** | 1 | This property defines the total height of the Capsule collider. <br/><video width="600" height="220" autoplay loop><source src="images/capsule_collider_height.mp4" type="video/mp4"></video><br/>The **Height** value can be used in two ways:<ul><li>If the entity has a mesh (with `MeshComponent` for example), the Height value is relative to the mesh height.</li><li>If the entity has no meshes, the Height value is used as scene units.</li></ul>|
| **Offset** | 0,0,0 | Offsets the collider with respect to the owner entity. <br/><video width="600" height="220" autoplay loop><source src="images/capsule_collider_offset.mp4" type="video/mp4"></video><br/>The **Offset** value can be used in two ways:<ul><li>If the entity has a mesh (with `MeshComponent` for example), the Offset value is relative to the mesh extents.</li><li>If the entity has no meshes, the Offset value is used as scene units.</li></ul> | 
| **Margin** | 0.04 | The physics engine uses a small collision margin for collision shapes to improve performance and reliability of the collision detection. | 