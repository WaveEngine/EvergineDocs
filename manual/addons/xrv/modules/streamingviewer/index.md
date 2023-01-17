# Description

Load a video stream from a media [mjpg](https://es.wikipedia.org/wiki/MJPEG) server.

![snapshot](images/snapshot.png)

# Installation // TODO

# Instantiate from code

```csharp
// Find XrvService instantiation...

var xrv = new XrvService()
.AddModule(new StreamingViewerModule()
{
    SourceURL = "http://host/video.mjpg"
})
```

# Usage

Open from hand menu ![snapshot](images/VideoStreaming.png)

Loads video stream from media feed.
Video size will match media server.

## Media server

It is important that each header of each jpeg inside the mjpg streaming has "Content-Length".

```
Content-Length: 44244
```
