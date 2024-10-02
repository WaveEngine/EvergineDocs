# Logging

We provide a logging service that implements `Microsoft.Extensions.Logging.ILogger` and uses `Serilog`.

We use the `LoggingConfiguration` class to configure logging.

| Properties          | Description                |
| ------------------- | -------------------------- |
| `LogLevel`          | Sets log level verbosity.  |
| `EnableFileLogging` | If true, saves logs to a file. |
| `FileOptions`       | Log file name and max size |

## Registration

Use the `WithLogging` method from `XrvService`.

```csharp
var xrvService = Application.Current.Container.Resolve<XrvService>();

var config = new LoggingConfiguration()
{
    LogLevel = LogLevel.Debug
};

xrvService.WithLogging(config);
```

## Usage

Obtain the service and use it as needed.

### Get logging anywhere

```csharp
// Get logger
var log = Application.Current.Container.Resolve<ILogger>();
```

### Get logging in a component

```csharp
[BindService]
private ILogger log = null;
```

### Log

```csharp
// Log debug
log.Log(LogLevel.Debug, "debug msg");
```

### Warning

```csharp
// Log warning
log.LogWarning("warning msg");
```

### Error

```csharp
// Log error
log.LogError("error");
```