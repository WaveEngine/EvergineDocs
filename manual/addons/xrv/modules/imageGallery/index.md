# Description

Easyly Load images onto your application.

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

Next: ![next](images/next.png)

Previous: ![previous](images/previous.png).

# Confifuration
