# Demo project
---
There is a demo scene in the project's repository which showcases all currently implemented features.

![MRTK Demo scene](images/MRTK_Examples.png)

## Press interaction
This area contains some examples using the *PressableButton* class. This includes:
- Standard buttons
- Toggle buttons
- Some piano keys

## Touch interaction
This area contains some simple examples using the *HandInteractionTouch* which implements a simple touch behavior. These work only with *near interaction*.

## Slider interaction
This area includes some sliders which use the *PinchSlider* class. They are connected to another object and allow the user to change its color.

## Manipulation interaction
These examples showcase the *SimpleManipulationHandler* component. Some of the examples are configured in such a way that manipulation is restricted in some ways. In addition, some objects interact with the physics engine, so they can be thrown around. If they get too far away, they will be placed back on their starting position.

## Bounding box
The examples in this group use the *BoundingBox* component, which adds some handles to an object to aid with rotation and uniform and non-uniform scaling. These handles can be hidden if that kind of manipulation is not needed.

This component can be combined with the *SimpleManipulationHandler* component for more flexible manipulation options.


## Axis manipulation handler
There's an example of the *AxisManipulationHandler* component. With it, the user will see a 3-axis handle which can be moved in any axis or combination of axes independently, without affecting the rest.

## Pan and zoom control
The *HandInteractionPanZoom* example shows this component in action. The user can pan and zoom its contents using both *near* and *far interaction*.