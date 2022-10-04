# Particle System properties

![Particles properties](images/particles-properties.png)

A particle system has the next properties.

## Particles Material
Group that manages the properties relative to the particle  material.

|  Property      | Default value | Description   |
| ---- | ---- | ---- | 
| **Texture**  | _particle.png_            | The texture that will appear in each particle quad. |
| **Sampler State**  | _LinearClampSampler_            | The texture sampler state. |
| **RenderLayer**  | _Additive_            | The texture render layer. |

## General properties
Properties that controls the basic aspects of the particle system.

|  Property      | Default value | Description   |
| ---- | ---- | ---- | 
| **Max Particles**  | _1000_ | The maximum amount of particles the emitter can handle. The emission will be paused if it reaches this number. |
| **Gravity**  | _0_ | Sets the gravity of the particle system. |
| **Drag**  | _0_ | The amount of resistance the particle will find. |

## Shapes
The *Shape* property defines the volume or surface where the particles can be emitted.

|  Property      | Default value | Description   |
| ---- | ---- | ---- | 
| **Shape**  | _(PointShapeEmitter object)_ | The maximum amount of particles the emitter can handle. The emission will be paused if it reaches this number. |

More information in [this article](particle_shapes.md).

## Spawn 
The spawn informacio
## Color over life
## Size over life
## Noise
## Forces
