# Streaming Viewer module

This module lets you load a video stream from a _MJPEG_ source. This is the unique streaming protocol that we support in current version. Video size can't be configured: this means that window size may vary depending on returned size of images provided by the server.

![snapshot](images/snapshot.png)

> [!NOTE]
> It's required provided JPEG responses counts with _Content-Length_ header to make it work properly.


## Installation

This module is packaged as [Evergine add-on](../../../index.md). To use it in your project, just install it from _Project Settings > Add-Ons_ window.

![Module installation](images/installation.png)

Then, just register the module programmatically within your XRV service instance.

```csharp
var xrv = new XrvService()
    .AddModule(new StreamingViewerModule 
    {
        SourceURL = "http://<HOST>/video.mjpg"
    });
```

## Usage

- Use ![snapshot](images/VideoStreaming.png) hand menu button to open streaming window.