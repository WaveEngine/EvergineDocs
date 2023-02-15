# Voice Commands

Provides a service where we can register key words, that the speech recognition service will detect and we can take actions when this happens. It is based on [MRTK](../mrtk/index.md), so you should work with _SpeechHandler_ if you want to create handlers for your custom controls. If you are only interested in buttons and toggle buttons, you can make use of _PressableButtonSpeechHandler_ defined in _MRTK_, or _ToggleButtonSpeechHandler_ defined in _XRV_, to activate a button if associated voice command is recognized.

> [!NOTE]
> Current implementation supports voice commands for _HoloLens 2 (UWP)_ only. Speech recognition service must be enabled or command recognition will never be fired.

User can also activate or deactivate voice command recognition in _Configuration -> General_ section.

## Associate voice commands programmatically

You have two options to add custom voice commands:
- Specify voice commands in [menu button description](hand_menu.md) for module definition.

```csharp
public MyModule : Module 
{
    private const string VoiceCommandShow = "Show feature";
    private const string VoiceCommandHide = "Hide feature";

    public override IEnumerable<string> VoiceCommands => new[] { VoiceCommandShow, VoiceCommandHide };

    public override void Initialize(Scene scene)
    {
        this.HandMenuButton = new MenuButtonDescription()
        {
            VoiceCommandOff = VoiceCommandShow,
            VoiceCommandOn = VoiceCommandHide,
        };
    }
}
```
- Using _Voice System_ API to programmatically register voice commands. Please, note that this should only be invoked on application startup.

```csharp
var voiceSystem = this.xrvService.VoiceSystem;
voiceSystem.RegisterCommands(new [] { "one command", "other command" });
```

## Create custom speech handler

```csharp
public MySpeechRecognizer : SpeechHandler 
{
    protected override void InternalOnSpeechKeywordRecognized(string keyword)
    {
        base.InternalOnSpeechKeywordRecognized(keyword);
        // Do something depending on matching command
    }
}
```
