# Description

Easyly Load images onto your application.

![Snapshot](images/snapshot.png).

# Installation

```csharp
 public MyApplication()
        {
            ....
             var xrv = new XrvService()
                ...
                .AddModule(new ImageGalleryModule()
                {
                    ImagePixelsWidth = 640,
                    ImagePixelsHeight = 640,
                    FileAccess = imageGalleryFileAccess,
                })
            ...
        }
```

# Usage

Open from hand menu

![hand menu icon](images/imagegallery.png).

You can navigate between images by clickiing on

![next](images/next.png) ![previous](images/previous.png).
