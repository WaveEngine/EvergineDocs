# Description

Easily Load images onto your scene.

![Snapshot](images/snapshot.png).

You can load more than one image, navigate buttons will be added, but all images should have same width/height.

| Properties          | Description                              |
| ------------------- | ---------------------------------------- |
| `ImagePixelsWidth`  | Image width for the viewer in pixels.    |
| `ImagePixelsHeight` | Image height for the viewer in pixels.   |
| `FileAccess`        | Access policy, could be local, azure ... |

FileAccess: see FileAccess // TODO

# Installation // TODO

# Instantiate from code

```csharp
// Define image container ...
var imageGalleryFileAccess = AzureFileShareFileAccess.CreateFromUri(new Uri("https://url.com"));
imageGalleryFileAccess.Cache = new DiskCache("images");

// Find XrvService instantiation...
var xrv = new XrvService()
.AddModule(new ImageGalleryModule()
{
    ImagePixelsWidth = 640,
    ImagePixelsHeight = 640,
    FileAccess = imageGalleryFileAccess,
})
```

# Usage

Open from hand menu ![hand menu icon](images/imagegallery.png).

You can navigate between images by clicking on ![next](images/next.png) ![previous](images/previous.png) or slider.
