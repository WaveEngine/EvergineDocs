# Demo Project
---
There is a demo scene in the project's repository that showcases all currently implemented features.

![MRTK Demo scene](images/MRTK_Examples.png)

## Press Interaction
This area contains some examples using the *PressableButton* class. This includes:
- Standard buttons
- Toggle buttons
- Some piano keys

## Touch Interaction
This area contains some simple examples using the *HandInteractionTouch*, which implements simple touch behavior. These work only with *near interaction*.

## Slider Interaction
This area includes some sliders that use the *PinchSlider* class. They are connected to another object and allow the user to change its color.

## Manipulation Interaction
These examples showcase the *SimpleManipulationHandler* component. Some of the examples are configured in such a way that manipulation is restricted in certain ways. In addition, some objects interact with the physics engine, so they can be thrown around. If they get too far away, they will be placed back in their starting position.

## Bounding Box
The examples in this group use the *BoundingBox* component, which adds handles to an object to aid with rotation and uniform and non-uniform scaling. These handles can be hidden if that kind of manipulation is not needed.

This component can be combined with the *SimpleManipulationHandler* component for more flexible manipulation options.

## Axis Manipulation Handler
There is an example of the *AxisManipulationHandler* component. With it, the user will see a 3-axis handle that can be moved along any axis or combination of axes independently, without affecting the rest.

## Pan and Zoom Control
The *HandInteractionPanZoom* example shows this component in action. The user can pan and zoom its contents using both *near* and *far interaction*.