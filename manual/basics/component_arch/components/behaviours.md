# Behaviors
---

**Behaviors** are a type of component that allows you to perform an action during each update cycle of the application. A behavior is associated with an entity, and all behaviors in a scene are managed by the **Behavior Manager**.

## Create a Behavior
From Visual Studio, you can create a C# class with the following template:

```csharp
using Evergine.Framework;
using System;

namespace MyProject
{
    public class MyBehavior : Behavior
    {
        protected override void Update(TimeSpan gameTime)
        {
            // Your code
        }
    }
}
```

## Update Order

You can specify the order of execution of each behavior by setting its `UpdateOrder` property.

| Property | Description |
| --- | --- |
| **UpdateOrder** | Value used to order the execution of each behavior in the scene. Lower values indicate that the behavior will be updated first. The default value is 0.5. |

## Behavior Families
There are three behavior families that you can specify in the constructor of your behavior using the base constructor with the `FamilyType` parameter.

 *  **DefaultBehavior**: This is the default family when you don't specify anything in the constructor. The behavior only runs at runtime but not in Evergine Studio.
 *  **PriorityBehavior**: This special family indicates your behavior runs both at runtime and in Evergine Studio.
 *  **PhysicBehavior**: This family is specific to physics components that need to be updated by the PhysicsManager.

## BehaviorManager
The **Behavior Manager** is a SceneManager registered by default in every scene that manages the execution of all behaviors during each update cycle. All behaviors are registered automatically into the BehaviorManager when they are attached and unregistered when the behavior is detached.

## Behavior Example
The following example creates a behavior that allows you to rotate your entity during each update cycle.

```csharp
using Evergine.Framework;
using Evergine.Framework.Graphics;
using Evergine.Mathematics;
using System;

namespace MyProject
{
    public class MyBehavior : Behavior
    {
        [BindComponent]
        private Transform3D transform = null;

        public MyBehavior()
            : base(FamilyType.DefaultBehavior) // This base constructor can be omitted.
        { }

        protected override void Update(TimeSpan gameTime)
        {
            this.transform.LocalOrientation *= Quaternion.CreateFromEuler(new Vector3(0, (float)gameTime.TotalSeconds, 0));
        }
    }
}
```
> **Tip**
> BindComponent allows binding other components. To learn more about that, visit the following [**section**](../../bindings/index.md).

## Add/Remove a Behavior
To add or remove a behavior to or from your entity, both from code or Evergine Studio, is the same as adding or removing a component because a behavior is a type of component. You can see how to add or remove a component [here](index.md).