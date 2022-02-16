# XR (Extended-Reality)
---

![Evergine XR](images/xr.png)

## What is XR?

**XR** (Extended Reality) is an umbrella terms that covers the following types of applications:

### **Virtual Reality (VR)**

The application simulates a completely different environment around the user.

![VR](images/vr.jpg)

### **Mixed Reality (MR)** 

The application combines its own environment with the user's real-world environment and allows them to interact with each other.

![VR](images/mr.jpg)

### **Augmented Reality (AR)**
The application ayers content over a digital view of the real world.

![AR](images/ar.jpg)


## Evergine XR

In Evergine, you can develop with different XR platforms and solutions, and Evergine XR helps users to deal with multiples XR technologies.

**Evergine XR** is an abstraction layer that allows multiple XR implementations (OpenXR, Mixed Reality, etc...) to be used in a standarized way in your interactive applications.

**Evergine XR** is included by default in the **Evergine.Framework** and **Evergine.Components** NuGet packages, and exposes an abstract Service (XRPlatform) which is the entry point to start creating XR applications. Different XR technologies integrations gives an implementation of the XRPlatform service, and it is provided using Evergine extensions or add-ons. 

This functionality will be covered in the following documents of this section.

## In this section

* [XRPlatform](xrplatform.md)
* [Input Devices](input_tracking/index.md)