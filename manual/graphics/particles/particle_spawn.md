# Particle Spawn

<video autoplay loop muted width="100%" height="auto">
  <source src="images/particle_forces_header.mp4" type="video/mp4">
</video>

This module controls **when** the particles are spawned in our particle system. We mainly have three types:
- Rate Spawn
- Burst Spawn
- Distance Spawn

## Rate Spawn

The **rate spawn** emits particles uniformly according to a **rate**. It can emit for a specific amount of time or indefinitely.

<video autoplay loop muted width="auto" height="auto">
    <source src="images/rate.mp4" type="video/mp4">
</video>

It has the following properties:

| Property | Default Value | Description |
|----------|---------------|-------------|
| Rate | 10 | **Particles per second** that will be emitted by the particle system. |
| Duration | 0 | **Duration in seconds** of the particle system emission. A value of **0** will emit _indefinitely_ until we manually stop the emission. |

## Burst Spawn

The **burst spawn** emits all the particles available in the system (the **Max Particles** property) at the same time. It doesn't have additional properties.

<video autoplay loop muted width="auto" height="auto">
    <source src="images/burst_spawn.mp4" type="video/mp4">
</video>

## Distance Spawn

The **distance spawn** emits particles at a rate **proportional to the particle system speed**. A static particle system won't emit particles, but a moving one will emit according to its speed and a specifically defined factor.

<video autoplay loop muted width="auto" height="auto">
    <source src="images/distance_rate.mp4" type="video/mp4">
</video>

It has the following properties:

| Property | Default Value | Description |
|----------|---------------|-------------|
| Distance Rate | 0 | The amount of particles that are spawned per unit of distance translated by the emitter since the last frame. |
| Duration | 0 | **Duration in seconds** of the particle system emission. A value of **0** will emit _indefinitely_ until we manually stop the emission. |