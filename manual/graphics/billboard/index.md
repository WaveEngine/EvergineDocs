# Billboard
---
![Billboards header](images/billboards.jpg)

**Billboard** is a quad orientated to face the camera. While the active camera in your scene is moving the billboard is orientated to face the camera. The billboards are useful to create indicators or making an impostor of your far mesh to reduce the geometry that the render needs to draw. A common use is to simulate far bushes or trees.

## Types of billboards

### Point Orientation
The billboard is oriented about his origin to always face the camera. With this type of billboarding, the object will always appear the same to the camera, however, it will be affected by perspective.

<video autoplay loop muted width="500">
  <source src="images/PointBillboard.mp4" type="video/mp4">
</video>

### Axial orientation
The billboard is rotated about an axis to face towards the camera.

<video autoplay loop muted width="500">
  <source src="images/AxisBillboard.mp4" type="video/mp4">
</video>

## In this section

The following sections show how to create and use billboards in your scene.

* [Create Billboard](create_billboard.md)