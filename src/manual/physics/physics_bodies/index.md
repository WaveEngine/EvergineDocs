# Physics Bodies
---

A Physics Body is an object that can interact with the physical world. In some cases, it is affected by dynamic forces such as gravity or collides with other bodies.

Physics Bodies use their attached [Colliders](../colliders/index.md) to define their physical shape.

## Types of Physics Bodies

### Rigid Bodies

Rigid bodies are moved around by forces such as collision and gravity. In general, rigid bodies are a good choice for objects that can be moved or pushed, like boxes, furniture, and obstacles. In Evergine, we use the `RigidBody3D` component.

[![Rigid Bodies](images/rigid_bodies.gif)](rigid_bodies.md)

### Static Bodies 

Static bodies are not affected by any physical force and, as a result, do not move. Rigid bodies can collide with static bodies. In general, static bodies can be used for objects that are immovable, like walls, floors, etc. In Evergine, we use the `StaticBody3D` component.

[![Static Bodies](images/static_bodies.gif)(static_bodies)

### Character Controller

This is a special type of body used for player-controlled characters. It is usually controlled by user inputs. In Evergine, we use the `CharacterController3D` component.

[![Character Controller](images/character_controller.png)](character_controller.md)

### Vehicles

It is possible to simulate physical vehicles by using a standard [Rigid Body](rigid_bodies.md) and applying several components to set the vehicle's behavior. In Evergine, add a `PhysicVehicle3D` to a RigidBody entity, and add several `PhysicWheel3D` for each desired wheel.

[![Vehicle Physics](images/physic_vehicle.gif)](vehicle_physics.md)

## Physics Bodies and Colliders

As mentioned before, a physic body itself doesn't define its shape. The entity that owns the Physic Body needs at least one **[Collider](../colliders/index.md)** component to interact with other bodies. For example, a rigid body without colliders will pass through a floor because it doesn't have any shape to cause collisions.

## In this section

* [Rigid Bodies](rigid_bodies.md)
* [Static Bodies](static_bodies.md)
* [Character Controller](character_controller.md)
* [Vehicle Physics](vehicle_physics.md)
* [Collisions](collisions.md)
* [Sensors](sensors.md)
* [Using Physics Bodies](using_physics_bodies.md)