# Collision filtering

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