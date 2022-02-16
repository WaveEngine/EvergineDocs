# XR Input Tracking

![Input Tracking](images/motioncontrollers.jpg)

In XR, it's usual that the user interact with different XR input devices such as Motion Controllers, Hands, Trackers, etc..

The InputTracking subsystem of XRPlatform keep control and track all connected devices in the XR session. Using `XRPlatform.InputTracking` you can obtain and list all connected devices of your system, and get access to its information. 

However, it is more straightforward to use Components that help developers to integrate the device tracking status into your Entity and components.


We will provide the following components:
* **TrackXRDevice:** This component change the entity Transform and sets the device position and orientation.
* **TrackXRController:** Represent a tipical motion controller. This component inherit from `TrackXRDevice`, and additionally, it will expose the state of its buttons, triggers and much more.
* **TrackXRArticulatedHand:** In the case that your XR system has support, it will provide access to the articulated hand state. This component inherit from `TrackXRController`, and additionally, it will expose a list of hand joint poses.


## In this section
- [Tracking XR Devices (TrackXRDevice)](trackxrdevice.md)
- [Tracking Controllers (TrackXRController)](trackxrcontroller.md)
- [Tracking Hands (TrackXRArticulatedHand)](trackxrarticulatedhand.md)
