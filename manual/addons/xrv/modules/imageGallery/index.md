# Image Gallery Module

With this module, you can display a gallery of images that can be stored remotely. A new element will be added to the hand menu to provide direct access to the gallery window. This window includes UI elements like a slider and buttons that let the user load an image, among other features.

![Snapshot](images/snapshot.png)

If the data source contains only one image, no navigation buttons will be displayed. A single-image data source is supported in the current module version.

> [!NOTE]
> In the current version, there is a restriction: all images should be of the same size.

| Properties          | Description                              |
| ------------------- | ---------------------------------------- |
| `ImagePixelsWidth`  | Image width for the viewer in pixels.    |
| `ImagePixelsHeight` | Image height for the viewer in pixels.   |
| `FileAccess`        | Images data source. Please refer to the [Storage](../../storage.md) section for more information. |

## Installation

This module is packaged as an [Evergine add-on](../../../index.md). To use it in your project, simply install it from the _Project Settings > Add-Ons_ window.

![Module installation](images/installation.png)

Then, register the module programmatically within your XRV service instance.

```csharp
FileAccess imagesDataSource = <Create FileAccess instance>;
var xrv = new XrvService()
    .AddModule(new ImageGalleryModule
    {
        ImagePixelsWidth = 640,
        ImagePixelsHeight = 640,
        FileAccess = imagesDataSource,
    });
```

## Usage

- To open the gallery window, tap on the ![hand menu icon](images/imagegallery.png) hand menu button.
- You can navigate between images by clicking on the next ![next](images/next.png) or previous ![previous](images/previous.png) buttons. You can also change the current image using the attached slider.