# Description

Load a video stream.

![snapshot](images/snapshot.png)

# Installation

```csharp
 public MyApplication()
        {
            ....
             var xrv = new XrvService()
                ...
                .AddModule(new StreamingViewerModule()
	            {
	                SourceURL = "http://host/video.mjpg"
	            })
            ...
        }
```

# Usage

Open from hand menu ![snapshot](images/VideoStreaming.png)
