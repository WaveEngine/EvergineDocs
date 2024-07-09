# Billboard
---
![Billboards header](images/billboards.jpg)

**Billboard** is a quad oriented to face the camera. While the active camera in your scene is moving, the billboard is oriented to face the camera. Billboards are useful for creating indicators or making an impostor of your distant mesh to reduce the geometry that needs to be rendered. A common use is to simulate far-off bushes or trees.

## Types of Billboards

### Point Orientation
The billboard is oriented around its origin to always face the camera. With this type of billboarding, the object will always appear the same to the camera; however, it will be affected by perspective.

<video autoplay loop muted width="500">
  <source src="images/PointBillboard.mp4" type="video/mp4">
</video>

### Axial Orientation
The billboard is rotated about an axis to face towards the camera.

<video autoplay loop muted width="500">
  <source src="images/AxisBillboard.mp4" type="video/mp4">
</video>

## In This Section

The following sections show how to create and use billboards in your scene.

* [Create Billboard](create_billboard.md)