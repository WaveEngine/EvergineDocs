# Logging

We provide logging service that implements `Microsoft.Extensions.Logging.ILogger` and uses `Serilog`.

We use `LoggingConfiguration` class to configure logging.

| Properties          | Description                |
| ------------------- | -------------------------- |
| `LogLevel`          | Sets log level verbosity.  |
| `EnableFileLogging` | If true save logs to file. |
| `FileOptions`       | Log file name and max size |

## Registration

Use `WithLogging` method from `XrvService`.

```csharp
var xrvService = Application.Current.Container.Resolve<XrvService>();

var config = new LoggingConfiguration()
{
    LogLevel = LogLevel.Debug
}

xrvService.WithLogging(config);

```

## Uses

Obtain the service and use it.

### Get Logging anywhere

```csharp
// Get logger
var log = Application.Current.Container.Resolve<ILogger>();
```

### Get Logging in component

```csharp
[BindService]
private ILogger log = null;
```

### Log

```csharp
// log debug
log.Log(LogLevel.Debug, "debug msg");
```

### Warning

```csharp
// log warning
log.LogWarning("warning msg");
```

### Error

```csharp
// log error
log.LogError("error");
```
