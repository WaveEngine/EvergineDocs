# Sphere Collider

![Sphere Collider](images/sphere_collider.png)

A Sphere shaped collider.

## SphereCollider3D component

To use a Sphere Collider in Evergine, you only need to add a `SphereCollider3D` component to your entity:

![BoxCollider3D](images/boxcollider3d_component.png)

### Properties

| Property | Default | Description | 
| --- | --- | --- |
| **Radius** | 0.5 | This property define the radius of the Sphere collider. <br/><video width="600" height="220" autoplay loop><source src="images/sphere_collider_radius.mp4" type="video/mp4"></video><br/>The **Radius** value can be used in two ways:<ul><li>If the Entity has a mesh (with `MeshComponent` for example), the Radius value is relative to the mesh extents, to be more specific. *In that case, a value of 0.5 let the SphereCollider3D to fit the entity mesh.*</li><li>If the entity hasn't any meshes, the Radius value is used as scene units. *In that case, a value of 2 will create a Sphere collider of a radius of 2 units, and a diameter of 4 units.*</li></ul>| 
| **Offset** | 0,0,0 | Offset the collider respect the owner entity. <br/><video width="600" height="220" autoplay loop><source src="images/sphere_collider_offset.mp4" type="video/mp4"></video><br/>The **Offset** value can be used in two ways:<ul><li>If the Entity has a mesh (with `MeshComponent` for example), the Offset value is relative to the mesh extents.</li><li>If the entity hasn't any meshes, the Offset value is used as scene units.</li></ul> | 
| **Margin** | 0.04 | Physic Engine uses a small collision margin for collision shapes, to improve performance and reliability of the collision detection. | 