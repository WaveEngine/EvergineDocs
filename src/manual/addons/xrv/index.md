# Extended Reality Viewer (XRV)

---

XRV is a library we use internally while developing custom XR experiences for our customers. It aims to gather in one place various functionalities and features commonly required by the applications we build, such as floating windows, hand menus, voice commands, and more.

![XRV main image](images/main.jpg)

It is based on our own [MRTK add-on](../mrtk/index.md), which means it uses the same input pointers, user controls like buttons or sliders, configuration components, etc. Leveraging this foundation, we have built the entire XRV infrastructure.

Most of the features are supported on many platforms, but some features may not be available on all platforms. You can run XRV on devices like:
- Meta Quest and Meta Quest 2
- Meta Quest Pro
- Pico XR headsets
- Microsoft HoloLens 2

## In this section

- [Getting started](getting_started.md)
- [Hand menu](hand_menu.md)
- [UI](ui/index.md)
  - [Windows System](ui/windows_system.md)
  - [Tabs control](ui/tabs_control.md)
- [Settings System](settings_system.md)
- [Help System](help_system.md)
- [Voice commands](voice_commands.md)
- [Messaging](messaging.md)
- [Storage](storage.md)
- [Themes System](themes.md)
- [Localization](localization.md)
- [Modules](modules/index.md)
  - [Image Gallery](modules/imageGallery/index.md)
  - [Models Viewer](modules/modelViewer/index.md)
  - [Painter](modules/painter/index.md)
  - [Ruler](modules/ruler/index.md)
  - [Streaming Viewer](modules/streamingviewer/index.md)
  - [Custom Modules](modules/customModule/index.md)