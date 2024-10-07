# OpenXR

**OpenXR** is an open, royalty-free API standard from [Khronos](https://www.khronos.org/openxr/) designed to unify development across multiple VR/MR/AR (XR) devices.

This initiative is supported by companies like Meta, Microsoft, HTC, Steam, Varjo, and Magic Leap, enabling compatibility across all their devices.

![OpenXR](images/openxr_overall.png)

Official support for OpenXR will allow Evergine developers to create new applications that will support upcoming XR devices.

In this version of Evergine, OpenXR integration covers the main aspects of this standard. We will provide new functionality and specific extensions in future versions, such as eye tracking and spatial mapping, which are particularly useful for HoloLens devices.

Currently, Evergine allows you to create PC desktop applications that cover almost the entire spectrum of wired VR devices and portable Android devices (such as Meta Quest).

## OpenXRPlatform

The OpenXR implementation is provided by the `OpenXRPlatform` service, a class that offers the implementation of [XRPlatform](../xrplatform.md). When you create an `OpenXRPlatform` instance, you have the option to specify which extensions you want to enable.

## In This Section

- [Meta Quest](metaquest.md)
- [Pico VR](pico.md)
