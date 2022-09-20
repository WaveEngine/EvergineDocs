# Component Based Architecture
---
![Component Based Architecture](images/component_based_arch.jpg)


Evergine is based on entity-oriented programming. An [**Entity**](entities/index.md) is built of Components, where each component does just an specific piece of work, and are reusable on other entities.

## Overview
When you are making applications in Evergine, you need to create objects to represent the entities in your scene, like a car, a player, a sunlight, and so on.

### Traditional deep class hierarchies
When you first get started ,you might think the most logical thing is to create a base class called `AppObject` or similar, that contains the common code. Then you can create subclasses like `Vehicle` with all common functionality between all vehicles, and maybe subclases for specific types (`Car`, `Motorbike`, `Train`...).

For simple scenarios, this works quite well and is quite easy to program. However, has your application get larger and more complex, this architecture begins to cause some problems in practice:
* Root classes tend to be heavier and is difficult to split the functionality in separate subsystems.
* Class inheritance may introduce weird scenarios. For instance, if we have created a `GroundVehicle` and `WaterVehicle` base classes, Which class a `AmphibianVehicle` should be derived from? If it is derived from GroundVehicle, all water functionality would be missing, and the same if it is derived from WaterVehicle.

![Class Inheritance Issue](images/class_inheritance_issue.png)

### Entities as an aggregation of Components

To solve this issues, we have chosen the **aggregation of components** approach.
In ths approach, the functionality is separated into individual components that are mostly independent of one another. The old object hierarchy is replaced by an object (`Entity`) with a collection of independent components (derived from `Component`).

Each object now only has the functionality that it needs. Any distinct new functionality is implemented by adding a new component.

## Entity-Component relationship

**Entities** are the fundamental objects in Evergine that represent characters, lights, models and so on. 
An Entity without any Component has no functionality (nothing will be rendered or interacted).

To give an Entity the properties it needs to become a Light, a Model, or a Camera, you need to add **Components** to it. Depending on what kind of objects do you want to create.

### SceneManagers and Components

In Evergine, a **Scene** has several subsystems (called **SceneManagers**). Every SceneManager control different aspects of the scene (A few examples: `RenderManager` to render and draw the scene, `BehaviorManager` to udpate all Behaviors, `PhysicManager3D` to perform Physics simulations, and so on)

With the Component architecture, every component is responsible to registers itself into the associated SceneManager, allowing in these SceneManagers to have the scope of Components which they are interested in and ignore the rest of them.

> [!NOTE]
> For instance: Every physics related components (RigidBody3D, BoxCollider3D, etc...) are internally registered into the PhysicManager3D when an Entity is spawned into the scene. This allows PhysicManager3D to gather and control all the physic information in the scene.

### Summary Diagram

A **Scene** is composed for several [**Entities**](entities/index.md). Each one has a collection of Components that give it the required functionality or data. Every component may be registered into the different **SceneManagers** of the Scene.

The following diagram gives an overview concerning this

![Component Based Architecture](images/component_arch.png)



## In this section
* [Entities](entities/index.md)
* [Components](components/index.md)
* [Prefabs](prefabs/index.md)