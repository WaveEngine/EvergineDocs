# Collisions

A **Collision** is produced when two bodies enter in contact.

## Collision events

To listen to all collision produced in a body, a [Pysic Body](index.md) component offers 3 events to be subscribed.

| Event | Description |
| --- | --- | 
| **BeginCollision(sender, collisionInfo)** | Event fired when two objects begin a collision. This event is fired everytime that the owner body collides with a new object. This event send a [CollisionInfo3D](#collisioninfo3d) to provide collision information. |
| **UpdateCollision(sender, collisionInfo)** | This event is fired every frame per colliding object. This event send a [CollisionInfo3D](#collisioninfo3d) to provide collision information. |
| **EndCollision(sender, collisionInfo)** | This event is fired when a body is not yet colliding with the owner body. This event send a [CollisionInfo3D](#collisioninfo3d) to provide collision information. |

### CollisionInfo3D

This class provides all collision information between two physic bodies (in physic engines, this is usually called a manifold).

| Property | Description |
| --- | --- |
| **Id** | Manifold identification. |
| **State** | Indicates the state of this collision info: `New`, `Updated`, `Deleted`. |
| **ThisBody** | The owner body that produces the collision. |
| **OtherBody** | The other body that produces the collision. |
| **NumContacts** | The number of contact points. |

| Methods | Description |
| --- | --- |
| **GetContact(contacts)** | Return all contact points ([ContactPoint3D](#contactpoint3d)) between this two bodies in the specified collection. |
| **GetContact(index, out contact)** | Return a contact point ([ContactPoint3D](#contactpoint3d)) specified by its index. |

### ContactPoint3D

This structure contains all contact information produced between two objects:

| Property | Description |
| --- | --- |
| **Distance** | Distance of the contact point to the body surface. Some times the contact can be produced before a real contact happens. In that case is useful to check the distance value. |
| **Normal** | The normal value in the contact. |
| **PositionOnThis** | The contact position in the owner body. |
| **PositionOnOther** | The contact position in the other contacted body. This can be different, due to collider differences, margin properties among other things. |
| **ThisCollider** | The contacted collider in the owner body. |
| **OtherCollider** | The contacted collider in the other body. |


### Using contact events 

Little example that shows how to use collision events (BeginCollision):

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

    // Unsubscribe to the begin collision event...
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
So far in every scene we have made, all the physic bodies were able to collide with all the other bodies. That is the default behavior, but it's also possible to set up 'collision filters' to provide finer control over which bodies can collide with each other. Collision filtering is implemented by setting some properties. These flags are:

* CollisonCategory
* MaskBits

Both flags are a 32 bit integer so you can have up to 32 different categories for collision (`Cat1`, `Cat2`, `Cat3`, .... `Cat32`). There is a little more to it than that though, because it is the combination of these values that determines whether two bodies will collide.
Is it possible to combine some categories, and for that case there is a special value `All`, that is the aggregation of all categories.

The **CollisionCategory** flag can be thought of as the physic body saying *'I am a ...'*, and the **MaskBits** is like saying *'I will collide with a ...'*. The important point is that **these conditions must be satisfied for both bodies in order for collision to be allowed.**

## Collision filtering properties

Every physic body (static, rigid or character) has the following properties:

| Property | Default | Description |
| --- | --- | --- |
| **CollisionCategory**| `Cat1` | The CollisionCategory flag specify the category of this body. | 
| **MaskBit**| `All` | The MaskBits indicates with which categories this body will collide. |