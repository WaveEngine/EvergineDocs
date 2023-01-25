# Particle emission shapes

![Shapes header](images/shapes_header.png)

The particle system emission shape controls the **position** and **direction** of the particles when they are spawned. 

### Common parameters
All the emission shapes shares the next properties:

| Property | Default value | Description |
|----------|--------------|-------------|
| Randomize Direction | _0_ | <div><p>Randomness factor of the particle direction. A value of  **0** mean no random directions, **1** is total chaos, while intermediate values sort of adds a little bit of randomness while keeping the overall particle direction of the emission shape.</p> </div><video autoplay loop muted width="512" height="auto"><source src="images/randomize.mp4" type="video/mp4"></video></div>|
| Velocity Offset | _(0, 0, 0)_ | Velocity that it's added on top of initial particle velocity. |

## Point Shape

**Point Shape** emits the particles from the same position, and using the **Up** vector of the particles entity as direction.
![Point Shape](images/point_shape.png)

## Sphere Shape

<video autoplay loop muted width="auto" height="auto">
    <source src="images/sphere.mp4" type="video/mp4">
</video>

**Sphere Shape** uses a sphere for the emission. Its parameters controls the size of the emission sphere, whether the particles are emitted from sphere volume  or only from its surface, and the direction of the new particles (from the sphere center or following the up vector).

| Property | Default value | Description |
|----------| --------------|-------------|
| Radius | _1_| The radius of the emission sphere  |
| From Surface | _false | <dic><p>**True** if the particles are spawned from the sphere carcass, **false** if they are placed from inside the sphere volume. </p><img src="images/from_surface_sphere.png"/></div>|
| From Center | _true_ | <div><p>If the particles are moving from the sphere center or all to the same direction _(Up vector)_. </p><img src="images/from_center_sphere.png"/></div>|

## Box Shape

<video autoplay loop muted width="auto" height="auto">
    <source src="images/box_shape.mp4" type="video/mp4">
</video>

**Box Shape** uses a box for the emission. Its parameters controls the size of the emission box.

| Property | Default value | Description |
|----------| --------------|-------------|
| Size | _(1, 1, 1)_| The size of the emission cube |
| From Center | _true_ | <div><p>If the particles are moving from the box center or all to the same direction _(Up vector)_.</p><img src="images/from_center_box.png"/></div>|

## Circle Shape

<video autoplay loop muted width="auto" height="auto">
    <source src="images/circle.mp4" type="video/mp4">
</video>
**Circle Shape** uses a circle for the emission. Its parameters controls the size of the emission circle and whether the particles are emitted from the circle area or its circumference, and the direction of the new particles (from the circle center or following the up vector).

| Property | Default value | Description |
|----------| --------------|-------------|
| Radius | _1_| The radius of the emission circle  |
| From Circumference | _false_ | <div><p>**True** if the particles are spawned from the circle circumference, **false** if they are placed from inside the circle area.</p><img src="images/from_circumference.png"></img></div> |
| From Center | _true_ | <div><p>If the particles are moving from the center or all to the same direction _(Up vector)_.</p><img src="images/from_center.png"></img></div> |

## Edge Shape

<video autoplay loop muted width="auto" height="auto">
    <source src="images/edge_shape.mp4" type="video/mp4">
</video>

**Edge Shape** uses a line for the emission. Its parameters controls the length of the edge or line and the direction of the new particles (from the line or following the up vector).

| Property | Default value | Description |
|----------| --------------|-------------|
| Length | _1_| The length of the emission line  |
| From Center | _true_ | <div><p>If the particles are moving from the center or all to the same direction _(Up vector)_.</p><img src="images/from_center_edge.png"/></div>

## Entity Shape

<video autoplay loop muted width="auto" height="auto">
    <source src="images/entity_shape.mp4" type="video/mp4">
</video>

**Entity Shape** is an emission shape where particles are emitted from a specific **Entity** of the scene. More specifically, the particle system uses the meshes of the entity and its children.

> [!Note]
> The target entity is not defined in the **Entity Shape Emitter** because it's part of the **Particle System** asset hence is not bound to any specific scene. It's defined in the **ParticlesComponent** component, which can have access to the scene entities.

| Property | Default value | Description |
|----------| --------------|-------------|
| EmissionSource | _Vertex_| The part of the mesh topology where the particles are emitted. Its values can be _Vertex_ or _Triangle_.  |