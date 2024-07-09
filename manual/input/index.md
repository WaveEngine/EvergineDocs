# Input
---

Reading the application input is the most essential part of providing user interaction in graphic applications. Every application should support at least one input device.

Evergine captures [keyboard](keyboard.md), [mouse](mouse.md), and [touch](touch.md) inputs from different surfaces and maps the results into a unified API with the same key definitions and expected behavior.

## Input and Surfaces

In Evergine, each application surface exposes different input dispatchers. For example, an Evergine application could launch two separate windows, and each surface may be interacted with only when that window is focused.

## In this section
* [Button states](button_states.md)
* [Keyboard](keyboard.md)
* [Mouse](mouse.md)
* [Touch](touch.md)