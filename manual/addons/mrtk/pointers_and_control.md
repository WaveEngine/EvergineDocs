# Pointers and control
---
The MRTK changes the way to interact with controls. Instead of using a mouse pointer to click on buttons, the hand tracking feature available in some devices can be used to interact with controls.
There are two main ways of interaction:
1. **Near interaction**: when near a control, the user can touch it with their index finger to interact with it. The mechanism that enables this is called a *near pointer*.
2. **Far interaction**: if the user is far away but they want to interact with a control, they can use the *far pointer*. Using hand tracking, this appears as a light ray coming out of their hand, which can be used to point and click. The click gesture is know as *air-tap*.

|<img alt="Near pointer" src="images/near_pointer.png" height="200">|<img alt="Far pointer" src="images/far_pointer.png" height="200">|
|:--:|:--:|
| **Example of *near pointer* usage** | **Example of *far pointer* usage** |

The default pointers for hand tracking enabled devices are created automatically in the *XRScene*.

## Desktop development
These mechanisms can also be used in the desktop solution in an Evergine project. The pointers can be controlled using the keyboard.
- Press and hold either the *left shift* or *space* key to enable either pointer (right and left hand respectively). This enables moving the pointer using the mouse.
- Use the *mouse wheel* to move the enabled pointer closer or further away from the camera.
- Use the *left mouse button* to perform the *air-tap* gesture and interact with controls placed far from the cursor.
- Press and hold the *left control* key to rotate the enabled pointer using the mouse.