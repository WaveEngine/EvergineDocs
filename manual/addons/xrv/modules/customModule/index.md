# Create Your Own XRV Modules

You can create your own module; you just need to extend the `Module` abstract class. Depending on the elements you instantiate, XRV will automatically add a new hand menu button, a section in the Settings window, or a section in the Help window. Additionally, you can define your own voice commands.

As we mention below, you'll be notified through the `Run` method when the module's associated hand menu button is tapped. There, you can show or hide the 3D elements that you have previously added to the scene in the `Initialize` method.

## Module Implementation

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
        // Initialization code.
    }

    public override void Run(bool turnOn)
    {
        // Code to execute when the hand menu button is pressed.
    }
}
```

| Methods                   | Description                                                                                                                     |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `Initialize(Scene scene)` | If initialization is needed for our code, we can set it here. For example, adding 3D entities or creating module-specific windows.                                                            |
| `Run(bool turnOn)`        | This method will be called when we press the hand menu button. `turnOn` represents the button's toggle state, or always true if it's not a toggle button. |

| Properties       | Required | Description                                                              |
| ---------------- | -------- | ------------------------------------------------------------------------ |
| `Name`           | Yes      | Module Name. |
| `HandMenuButton` | No       | If provided, will add a button in the hand menu.                              |
| `Help`           | No       | If provided, will add a tab in the help section.                          |
| `Settings`       | No       | If provided, will add a tab in the settings section.                      |
| `VoiceCommands`  | No       | If provided, will add these strings to the voice command service.        |

## Installation

```csharp
var xrv = new XrvService()
    .AddModule(new MyCustomModule());
```