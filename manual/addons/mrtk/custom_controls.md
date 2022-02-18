# Creating custom controls
---
All MRTK controls use custom interfaces in order to receive user interaction events. In order to receive these events, most components need to be added to an entity that has a *BoxCollider* component and a *StaticBody* component, so that they are properly managed in the physics engine.

## Focus events
Components that implement the *IMixedRealityFocusHandler* interface will receive focus events. A control gets focus in the following scenarios:
- When a *near pointer* is close to the entity.
- When a *far pointer* is pointing to the entity using the ray.
- When the user is looking at the entity (using the GazeProvider).

The default button style makes use of the focus event by raising the icon and text when acquiring focus.

## Touch events
Components that implement the *IMixedRealityTouchHandler* interface will receive events when the *near pointer* is making contact with the entity's collider.

These events are used in the *PressableButton* component (which is part of the standard button). It enables the main feature of the button.

## Pointer events
Components that implement the *IMixedRealityPointerHandler* interface will receive pointer events:
- Pointer down: when the user grabs an object, either by near interaction or far interaction, using the air-tap gesture.
- Pointer dragged: when the user has already grabbed the object and is still interacting with it, so the object can receive position updates.
- Pointer up: when the user has stopped interacting with the object.

These are used for example in the manipulation handlers, which allow the user to grab an object and move, rotate or scale it arbitrarily.

## Speech events
Components that implement the *IMixedRealitySpeechHandler* interface will receive an event whenever the user performs voice commands. These can be used to remotely activate buttons or to perform global actions in the application.

These components do not need to be attached to an entity with a collider, since they don't rely on the physics engine.