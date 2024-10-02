# Colliders
---

![Colliders](imges/../images/colliders.png)

**Colliders** are used to define the physical shape of a [Physics Body](../physics_bodies/index.md). Colliders are invisible and don't need to be the exact same shape as the object's mesh. In fact, a rough approximation is often more efficient and indistinguishable in your application.

Evergine provides various collider types, such as Box, Sphere, or Capsule. Using simple collider shapes helps with application performance optimizations. However, if you need more detailed and exact collision for your object, use the Mesh collider.

## Physics Bodies and Colliders

As mentioned in the [Physics Bodies](../physics_bodies/index.md) section, a Collider needs a Physics Body to be attached, and a Physics Body itself needs Colliders to define its shape.

**A Physics Body searches for its attached colliders in its child hierarchy**, including the owner's entity of the physics body. This also implies that a **Physics Body could have multiple colliders attached** to it.

### Simple shapes

![Simple Body](images/body_collider_simple.png)

This is the most common scenario. Your entity has a Physics Body component (`RigidBody3D` in this case), and one or more colliders attached to the same entity (`BoxCollider3D` in this case).

### Compound shapes

![Complex Body](images/body_collider_hierarchy.png)

This is another possible scenario. In this case, we have an entity hierarchy. The parent entity has a `StaticBody3D` component, and we have added several entities containing several colliders (a `BoxCollider3D` and a `SphereCollider3D`).

This causes the final shape of the body to be composed of all attached colliders.

> [!TIP]
> As a rule of thumb, create a physical body when you want to interact with it independently of other bodies, for example, to capture collision events.

## In this section
* [Box Collider](box_collider.md)
* [Sphere Collider](sphere_collider.md)
* [Capsule Collider](capsule_collider.md)
* [Cylinder Collider](cylinder_collider.md)
* [Cone Collider](cone_collider.md)
* [Mesh Collider](mesh_collider.md)