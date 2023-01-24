# Settings System

_XRV_ provides a default window where you can include specific settings for your application or modules. It also includes a section for general settings provided by the core library, like turning on or off voice commands. To open _Configuration_ window, just press ![settings hand menu](images/settings.png) button that you can find in hand menu.

![settings hand menu](images/settings_system_panel.png)

This window is a _TabbedWindow_ and you have two ways of adding new elements.
- Adding a configuration section to your custom module

```csharp
public class MyModule : Module
{
    public override TabItem Settings { get; protected set; }

    public override void Initialize(Scene scene)
    {
        this.Settings = new TabItem()
        {
            Name = () => "Module Name",
            Contents = this.CreateContents() // Entity containing settings control.
        };
    }
}
```

- Using _SettingsSystem_ API

```csharp
var settings = this.xrvService.Settings;
var item = new TabItem
{
    Order = 1,
    Name = "My item",
    Contents = () => this.CreateContents(),
};
settings.AddTabItem(this.settingsItem);
```

You can also remove an existing item using _RemoveTabItem_ method.
