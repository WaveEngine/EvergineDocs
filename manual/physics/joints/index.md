# Joints
---

<video autoplay loop muted width="100%" height="auto">
  <source src="images/joints.mp4" type="video/mp4">
</video>

A **Joint** constrains the way two RigidBodies move relative to one another. A typical use for a joint would be to model a door hinge or the shoulder of a character.

Evergine has a set of default joint types (point to point, hinge, etc.) that allow developers to create many different types of constraints simply by changing some properties.

## Joints and RigidBodies

![Joints](images/joints.png)

In Evergine, you can create Joints by adding the proper component (`HingeJoint3D`, for example) to an Entity that contains a [RigidBody3D](../physics_bodies/rigid_bodies.md) component. This body is treated as the *Source Rigid Body*. A Joint always needs to be connected to another RigidBody, which is named the *Connected Rigid Body*.

### Joint Anchor

The position offset of the joint with respect to the Source RigidBody is called the **Anchor**. The offset position with respect to the connected RigidBody is the **Connected Anchor**.

### Breaking joints

You can use the BreakPoint properties to set limits for the joint's strength. If these are greater than 0, and a force greater than these limits is applied to the object, the joint will be destroyed and will no longer be confined by its restraints.

## Supported Joint Types

| Joint | Description |
| --- | --- |
| **[Fixed Joint](fixed_joint.md)** | **Fixed Joints** restrict an object’s movement to be dependent upon another object. <br/>This is somewhat similar to a parent entity but is implemented through physics rather than Entity hierarchy. The best scenarios for using them are when you have objects that you want to easily break apart from each other or connect two objects' movement without parenting. |
| **[Point-to-Point Joint](point_to_point_joint.md)** | ![Point to Point](images/point2pointJoint.png)<br/>The **Point-to-Point Joint** limits the translation so that pivot points between the two rigid bodies match in world space. You can use the Point to Point joint to create effects, such as a chain-link, or to pin objects together. |
| **[Hinge Joint](hinge_joint.md)** | ![Hinge](images/HingeJoint.png)<br/>The **Hinge Joint** restricts the translation and two additional angular degrees of freedom, so the body can only rotate around one defined axis. This joint is useful for representing doors or wheels rotating around an axis. The user can specify limits and motor settings for the hinge. |
| **[Slider Joint](slider_joint.md)** | ![Slider](images/SliderJoint.png)<br/>The **Slider Joint** allows rigid bodies to rotate around one axis and translate along the same axis. |
| **[Cone Twist Joint](cone_twist_joint.md)** | For ragdolls, the **Cone-Twist Joint** is useful for limbs like the upper arm. It is a special point-to-point joint that adds cone and twist axis limits. |
| **[Gear Joint](gear_joint.md)** | A **Gear Joint** is a type of constraint that allows you to create a relationship between two rigid bodies that is based on their angular velocities. Specifically, it lets you specify a gear ratio between the angular velocities of the two bodies, which can be used to create realistic mechanical systems like gears, pulleys, and other types of machinery. |
| **[Generic 6DoF Joint](generic_6dof_joint.md)** | ![6DoF](images/6dofJoint.png)<br/>The **Six Degrees-Of-Freedom Joint** can emulate a variety of standard constraints if each of the six Degrees of Freedom (DoF) is configured. The first 3 DoF axes are linear axes, which represent the translation of rigid bodies, while the latter 3 DoF axes represent the angular motion. Each axis can be locked, free, or limited. By default, all axes are unlocked. |
| **[Spring Joint](spring_joint.md)** | ![6DoF](images/SpringJoint.png)<br/>The **Spring Joint** is a variant of the previous Six Degrees-of-Freedom joint that includes the addition of springs for each of the degrees of freedom. Springs and motors cannot be combined on this constraint. |

## In this section
* [Fixed Joint](fixed_joint.md)
* [Point to Point Joint](point_to_point_joint.md)
* [Hinge Joint](hinge_joint.md)
* [Slider Joint](slider_joint.md)
* [Cone Twist Joint](cone_twist_joint.md)
* [Gear Joint](gear_joint.md)
* [Generic 6DoF Joint](generic_6dof_joint.md)
* [Spring Joint](spring_joint.md)