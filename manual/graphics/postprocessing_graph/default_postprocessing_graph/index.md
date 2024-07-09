# Default Postprocessing Graph
---
![Default Postprocessing graph](images/defaultPostprocessingGraph.jpg)

The default Evergine project template imports the [**Evergine.Core** package](../../../addons/index.md), which includes the Default Post-Processing graph with the most essential post-processing visual effects commonly used in a project.

## Default Postprocessing Effects
The complete list of postprocessing effects covered by the default postprocessing graph includes:

* [Screen Space Ambient Occlusion (SSAO)](screen_space_ambient_occlusion.md)
* [Screen Space Reflection (SSR)](screen_space_reflection.md)
* [Fog](fog.md)
* [Temporal Anti-Aliasing (TAA)](temporal_anti_aliasing.md)
* [Motion Blur](motion_blur.md)
* [Depth of Field (DoF)](depth_of_field.md)
* [Bloom, Dirt, Lens Flare, Light Shaft](bloom.md)
* [Fidelity Super Resolution (FSR)](fidelity_super_resolution.md)
* [Sharpen](sharpen.md)
* [Tonemapping, Chromatic Aberration, Vignette, Grain, Distortion](tonemapping.md)
* [Fast Approximate Anti-Aliasing (FXAA)](anti-aliasing.md)

## Using the Default Postprocessing Graph from Evergine Studio
These effects can be configured from the `PostprocessingGraphRenderer` component inside a postprocessing volume entity.

![Default Postprocessing graph effects](images/defaultPostprocessingGraphEffects.jpg)