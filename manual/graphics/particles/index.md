# Particle System
---

<video autoplay loop muted width="1100">
  <source src="images/fire_low.mp4" type="video/mp4">
</video>

**Evergine** supports complex particle system simulations,  taking advantage of the **Compute Shaders** whenever it's possible. 

## Basics
Particles are elements that are used in a large number to create a wide range of visual effects like sparks, clouds, fire, etc. 
**Evergine** has a *Particle System* asset so developers can reuse create, adjust and reuse it in your scene.

## GPU vs CPU
**Evergine** supports **GPU particles** simulation when the platform is supported. These simulations are based in *compute shaders*, allowing a fast and efficient representation of large amount of particles compared to the classical **CPU particles**.

## In this section
* [Create Particle Systems](create_particles.md)
* [Using Particles](using_particles.md)
* [Particles Editor](particles_editor.md)
* [Particle properties](particle_properties.md)
* [Particle shapes](particle_shapes.md)
* [Particle spawn](particle_spawn.md)
* [Particle System Forces](particle_forces.md)