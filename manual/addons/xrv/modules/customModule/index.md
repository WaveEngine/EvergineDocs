# Description

You can create your own module, you just need to implement Module interface.

# Implementation

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
| `Initialize(Scene scene)` | If we need some initialization for our code, we can set it here.                                                                |
| `Run(bool turnOn)`        | This method will be called when we press hand menu button, `turnOn` represents button toggle state, true if not a toggle button |

| Properties       | Required | Description                                                              |
| ---------------- | -------- | ------------------------------------------------------------------------ |
| `Name`           | Yes      | Module Name, will be shown in alt text in hand button menu, if provided. |
| `HandMenuButton` | No       | If provided will add a button in hand menu.                              |
| `Help`           | No       | If provided will add a tab in the help section.                          |
| `Settings`       | No       | If provided will add a tab in the settings section.                      |
| `VoiceCommands`  | No       | If provided will add a this strings to the voice command service.        |

# Installation

```csharp
 public MyApplication()
        {
            ....
             var xrv = new XrvService()
                ...
                .AddModule(new MyCustomModule())
            ...
        }
```

# Usage

Open from hand menu
