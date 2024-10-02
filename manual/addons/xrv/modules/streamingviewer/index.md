# Streaming Viewer Module

This module allows you to load a video stream from an _MJPEG_ source. This is the only streaming protocol supported in the current version. The video size cannot be configured, which means that the window size may vary depending on the image size provided by the server.

![snapshot](images/snapshot.png)

> [!NOTE]
> The provided JPEG responses must include the _Content-Length_ header to function properly.

## Installation

This module is packaged as an [Evergine add-on](../../../index.md). To use it in your project, install it from the _Project Settings > Add-Ons_ window.

![Module installation](images/installation.png)

Next, register the module programmatically within your XRV service instance.

```csharp
var xrv = new XrvService()
    .AddModule(new StreamingViewerModule 
    {
        SourceURL = "http://<HOST>/video.mjpg"
    });
```

## Android-Based Systems

In Android-based systems, such as Meta Quest, there are constraints regarding clear text traffic. By default, it is not allowed. If your source is not served over HTTPS, you must whitelist the camera's domain or IP address using the appropriate native mechanism. Please see the [Android documentation](https://developer.android.com/training/articles/security-config#CleartextTrafficPermitted) for more information.

1. Add an XML file under the Android resources folder. We will name it _network_security_config.xml_.

```xml
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
  <domain-config cleartextTrafficPermitted="true">
    <!-- Sample IP cameras for Streaming Viewer module -->
    <domain includeSubdomains="true">IP address or domain name</domain>
  </domain-config>
</network-security-config>
```

2. Register the security configuration within your application definition under the Android manifest file.

```xml
<application android:allowBackup="true" android:icon="@mipmap/ic_launcher" android:label="@string/app_name" android:roundIcon="@mipmap/ic_launcher_round" android:supportsRtl="true" android:networkSecurityConfig="@xml/network_security_config">
  <!-- ... -->
</application>  
```

## Usage

- Use the ![snapshot](images/VideoStreaming.png) hand menu button to open the streaming window.