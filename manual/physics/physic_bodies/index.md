# Physic Bodies
---

A Physic Body is an object that can interact with the physic world. In some cases is being affected by dynamic forces such as gravity, or collides with other bodies.

Physic Bodies use their attached [Colliders](../colliders/index.md) to define their physical shape.

## Type of Physic Bodies

### Rigid Bodies

Rigid bodies are moved around by forces such as collision and gravity. In general, rigidbodies are good choice for objects that can be moved or pushed like boxes, furniture, and obstacles. In Evergine we use `RigidBody3D` component.

![Rigid Bodies](images/rigid_bodies.gif)

### Static Bodies 

Static bodies are not affected by any physic force, and as a result it don't move. Rigid bodies can collide with static bodies. In general, static bodies can be used for objects that are immovable, like walls, floors, etc...
In Evergine we use `StaticBody3D` component.

![Static Bodies](images/static_bodies.gif)

### Character Controller

Is a special type of body used for player controlled characters. It is usually controlled by the user inputs.
In Evergine we use `CharacterController3D` component.

![Character Controller](images/character_controller.png)

## Physic Bodies and Colliders

As we mentioned before, a physic body itself doesn't define its shape. The entity that owns the Physic Body need at leas one **[Collider](../colliders/index.md)** component to interact with other bodies. For example, a rigid body without colliders will pass through a floor, because it doesn't have any shape to cause collisions.

## In this section

* [Rigid Bodies](rigid_bodies.md)
* [Static Bodies](static_bodies.md)
* [Character Controller](character_controller.md)
* [Collisions](collisions.md)
* [Sensors](sensors.md)
* [Using Physic Bodies](using_physic_bodies.md)