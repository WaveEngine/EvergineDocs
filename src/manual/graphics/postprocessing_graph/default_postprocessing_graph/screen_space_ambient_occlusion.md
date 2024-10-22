# Screen Space Ambient Occlusion (SSAO)

The **Screen Space Ambient Occlusion (SSAO)** effect approximates Ambient Occlusion in real-time, as an image post-processing effect. It darkens creases, holes, and surfaces that are close to each other. In real life, such areas tend to block out or occlude ambient light, hence they appear darker.

This effect uses the depth framebuffer data and casts several rays in different directions from each pixel within a specified range. If a ray intersects with any geometry, the pixel will become darker. The darkest pixel will be the one where all rays intersect with something; conversely, the lightest pixel occurs where none of its rays intersect with anything.

![SSAO](images/SSAO.jpg)

In the above picture, you can see the scene without the effect applied first, then the scene with the SSAO output, and finally the blend combination between the original render and the SSAO output.

## SSAO Parameters

| Parameter    | Description                                          |
|--------------|------------------------------------------------------|
| **SPP**      | Samples per pixel.                                   |
| **Range**    | Range around the point used to calculate close geometries. |
| **Power**    | Amount of darkness.                                  |
| **Scale Bias** | --                                                 |
| **Intensity**| Intensity of the blend with the render image.        |