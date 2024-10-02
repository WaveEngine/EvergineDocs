# Collisions

A **Collision** occurs when two bodies come into contact.

## Collision events

To listen for all collisions involving a body, a [Physic Body](index.md) component offers three events to which you can subscribe.

| Event | Description |
| --- | --- | 
| **BeginCollision(sender, collisionInfo)** | This event is triggered when two objects begin colliding. It is fired every time the owner body collides with a new object. This event sends a [CollisionInfo3D](#collisioninfo3d) to provide collision information. |
| **UpdateCollision(sender, collisionInfo)** | This event is triggered every frame for each colliding object. It sends a [CollisionInfo3D](#collisioninfo3d) to provide collision information. |
| **EndCollision(sender, collisionInfo)** | This event is triggered when a body no longer collides with the owner body. It sends a [CollisionInfo3D](#collisioninfo3d) to provide collision information. |

### CollisionInfo3D

This class provides all collision information between two physics bodies (in physics engines, this is usually called a manifold).

| Property | Description |
| --- | --- |
| **Id** | Manifold identification. |
| **State** | Indicates the state of this collision info: `New`, `Updated`, `Deleted`. |
| **ThisBody** | The owner body that is involved in the collision. |
| **OtherBody** | The other body involved in the collision. |
| **NumContacts** | The number of contact points. |

| Methods | Description |
| --- | --- |
| **GetContact(contacts)** | Returns all contact points ([ContactPoint3D](#contactpoint3d)) between the two bodies in the specified collection. |
| **GetContact(index, out contact)** | Returns a contact point ([ContactPoint3D](#contactpoint3d)) specified by its index. |

### ContactPoint3D

This structure contains all contact information produced between two objects:

| Property | Description |
| --- | --- |
| **Distance** | Distance of the contact point to the body surface. Sometimes contact occurs before a real contact happens. In that case, it is useful to check the distance value. |
| **Normal** | The normal vector at the contact point. |
| **PositionOnThis** | The contact position on the owner body. |
| **PositionOnOther** | The contact position on the other body. This can differ due to collider differences, margin properties, among other things. |
| **ThisCollider** | The contacted collider on the owner body. |
| **OtherCollider** | The contacted collider on the other body. |

### Using contact events 

Here is a simple example that shows how to use collision events (BeginCollision):

```csharp
protected override void OnActivated()
{
    base.OnActivated();

    // Subscribe to the begin collision event...
    this.rigidBody.BeginCollision += this.BeginCollision;
}

protected override void OnDeactivated()
{
    base.OnDeactivated();

    // Unsubscribe from the begin collision event...
    this.rigidBody.BeginCollision -= this.BeginCollision;
}

private void BeginCollision(object sender, CollisionInfo3D collisionInfo)
{
    var lineBatch = this.Managers.RenderManager.LineBatch3D;

    ContactPoint3D contactPoint;

    // Iterate over all contact points...
    for (int contactIndex = 0; contactIndex < collisionInfo.NumContacts; contactIndex++)
    {
        if (collisionInfo.GetContact(contactIndex, out contactPoint))
        {
            // Draw the contact position
            lineBatch.DrawPoint(contactPoint.PositionOnThis, 0.2f, Color.Red);

            // Draw the contact normal
            lineBatch.DrawLine(contactPoint.PositionOnThis, contactPoint.PositionOnThis + (contactPoint.Normal * 0.5f), Color.Yellow);
        }
    }
}
```

## Collision filtering
So far, in every scene we have created, all physics bodies were able to collide with all other bodies. That is the default behavior, but it's also possible to set up 'collision filters' to provide finer control over which bodies can collide with each other. Collision filtering is implemented by setting certain properties. These flags are:

* CollisionCategory
* MaskBits

Both flags are 32-bit integers, so you can have up to 32 different categories for collision (`Cat1`, `Cat2`, `Cat3`, ... `Cat32`). There is more to it than that, because the combination of these values determines whether two bodies will collide.
It is possible to combine some categories, and for that case, there is a special value `All`, which is the aggregation of all categories.

The **CollisionCategory** flag can be thought of as the physics body saying *'I am a ...'*, and the **MaskBits** is like saying *'I will collide with a ...'*. The important point is that **these conditions must be satisfied for both bodies in order for a collision to be allowed.**

## Collision filtering properties

Every physics body (static, rigid, or character) has the following properties:

| Property | Default | Description |
| --- | --- | --- |
| **CollisionCategory**| `Cat1` | The CollisionCategory flag specifies the category of this body. | 
| **MaskBits**| `All` | The MaskBits indicate with which categories this body will collide. |