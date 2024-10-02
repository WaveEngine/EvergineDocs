# Screen Space Reflection (SSR)

**Screen Space Reflections (SSR)** adds real-time local reflections to object surfaces. This effect is in *screen space*, which means it can only reflect objects that are already on the screen. The effect uses the depth buffer to cast rays from object surfaces to calculate the reflection.

![SSR](images/SSR.jpg)

| Parameter                | Description                                                   |
| -----------------------  | ------------------------------------------------------------- |
| **Num. Rays**            | Number of rays per pixel.                                     |
| **Max. Reflection Distance** | Maximum ray reflection distance.                              |
| **Refinement Steps**     | Number of refinement steps after the ray hit detection.      |
| **Pixel Thickness**      | Helps to avoid depth shadow areas.                            |
| **Max. Roughness**       | Maximum roughness value at which the reflection will be calculated. |
| **Intensity**            | Blend with the original render.                               |
| **Debug Mode Enable**    | Allows checking only the reflection output.                   |