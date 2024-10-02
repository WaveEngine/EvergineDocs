# Depth of Field (DoF)

The **Depth of Field (DoF)** effect simulates the blur or *bokeh* observed in out-of-focus areas in the camera's field of vision. The depth of field can be calculated based on focal length, distance to the subject, the acceptable circle of confusion size, and aperture. A specific depth of field may be chosen for technical or artistic purposes.

![Depth of Field](images/DoF.jpg)

| Parameter  | Description |
| ---------- | ----------- |
| **Debug Mode** | When enabled, debug mode highlights the nearest areas in red, the focus areas in green, and the farthest areas in blue. For debugging purposes only. | 
| **Focal Region** | Size of the focus area. |
| **Bokeh Shape** | Shape used to simulate the bokeh effect: _Circle_, _Pentagon_, _Hexagon_, _Heptagon_. |
| **Bokeh Size** | Size of the bokeh shapes. | 
| **Bokeh Rotation** | Angle of the bokeh shapes. |
| **Near Fade Power** | Blur border size around the nearest areas.|

> [!Tip]
> The Focal Distance is a [Camera](../../cameras.md) parameter.