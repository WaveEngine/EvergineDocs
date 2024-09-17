# Creating Custom Controls
---
All MRTK controls use custom interfaces to receive user interaction events. Most components need to be added to an entity that has a *BoxCollider* component and a *StaticBody* component to properly manage them within the physics engine.

## Focus Events
Components that implement the *IMixedRealityFocusHandler* interface will receive focus events. A control gains focus in the following scenarios:
- When a *near pointer* is close to the entity.
- When a *far pointer* is pointing to the entity using a ray.
- When the user is looking at the entity (using the GazeProvider).

The default button style leverages the focus event by raising the icon and text when acquiring focus.

## Touch Events
Components that implement the *IMixedRealityTouchHandler* interface will receive events when the *near pointer* makes contact with the entity's collider.

These events are used in the *PressableButton* component, which is part of the standard button and enables the button's main feature.

## Pointer Events
Components that implement the *IMixedRealityPointerHandler* interface will receive pointer events:
- Pointer Down: when the user grabs an object, either through near interaction or far interaction using the air-tap gesture.
- Pointer Dragged: when the user has already grabbed the object and is still interacting with it, allowing the object to receive position updates.
- Pointer Up: when the user stops interacting with the object.

These events are used, for example, in the manipulation handlers, which allow the user to grab an object and move, rotate, or scale it arbitrarily.

## Speech Events
Components that implement the *IMixedRealitySpeechHandler* interface will receive events whenever the user performs voice commands. These can be used to remotely activate buttons or perform global actions within the application.

These components do not need to be attached to an entity with a collider, as they do not rely on the physics engine.