# Create your own XRV modules

You can create your own module, you just need to extend Module abstract class. Depending on elements you instantiate here, XRV will automatically add a new hand menu button, a section in Settings window or a section in Help window. Also, you can define your own voice commands.

As we comment below, you'll get notified through Run method when module's associated hand menu button is tapped. There, you can show or hide 3D elements that you have previously added to the scene in Initialize method.

## Module implementation

```csharp
public class MyCustomModule : Module
{
    public override string Name => MyModuleName;

    public override MenuButtonDescription HandMenuButton => MyHandMenuButton;

    public override TabItem Help => MyHelp;

    public override TabItem Settings => MySettings;

    public override IEnumerable<string> VoiceCommands => MyVoiceCommands;

    public override void Initialize(Scene scene)
    {
        // Do initialize stuff.
    }

    public override void Run(bool turnOn)
    {
        // Code.
    }
}
```

| Methods                   | Description                                                                                                                     |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `Initialize(Scene scene)` | If we need some initialization for our code, we can set it here. For example, adding 3D entities or creating module specific windows.                                                            |
| `Run(bool turnOn)`        | This method will be called when we press hand menu button, `turnOn` represents button toggle state, or always true if it's not a toggle button |

| Properties       | Required | Description                                                              |
| ---------------- | -------- | ------------------------------------------------------------------------ |
| `Name`           | Yes      | Module Name. |
| `HandMenuButton` | No       | If provided will add a button in hand menu.                              |
| `Help`           | No       | If provided will add a tab in the help section.                          |
| `Settings`       | No       | If provided will add a tab in the settings section.                      |
| `VoiceCommands`  | No       | If provided will add a this strings to the voice command service.        |

## Installation

```csharp
var xrv = new XrvService()
    .AddModule(new MyCustomModule());
```