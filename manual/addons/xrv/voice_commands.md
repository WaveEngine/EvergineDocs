# Voice Commands

Provides a service where we can register key words, that the speech recognition service will detect and we can take actions when this happens.

| Methods                  | Description                                                             |
| ------------------------ | ----------------------------------------------------------------------- |
| `ConfigureVoiceCommands` | You can set an array of key words that the system will be listening to. |
| `CommandRecognized`      | Event that fires when a key word is recognized                          |

> [!NOTE]
> The device has to support speech recognition. If not speech recognition service is enabled or supported `CommandRecognized` will never be fired.

> [!NOTE]
> For example [MRTK](../mrtk/index.md) provides a `VoiceCommandService` that implements `IVoiceCommandService`.

## Examples

We want to add "close" "open" to voice command recognition

### Get VoiceCommandService anywhere

```csharp
// Get logger
var voiceService = Application.Current.Container.Resolve<IVoiceCommandService>();
```

### Get Logging in component

```csharp
[BindService]
private IVoiceCommandService voiceService = null;
```

### Configure custom words

```csharp
// Add words
voiceService?.ConfigureVoiceCommands(["close", "open"]);

// Get callback from recognized words
voiceService.CommandRecognized += VoiceService_CommandRecognized;
```

Now we can set proper actions on `VoiceService_CommandRecognized method`.

```csharp
private void VoiceService_CommandRecognized(object sender, string e)
{
    if (e == "close"){
        // Do close stuff
    }
    else if (e == "open")
    {
        // Do open stuff
    }
}
```
