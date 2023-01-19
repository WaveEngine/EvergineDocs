# Settings System

Settings system relies on tabs control to add custom settings for modules.
You can access to setting system thrown hand menu icon

![settings hand menu](images/settings_system_hand_menu.png)

All you have to do is create a `TabItem` and add it to `Settings` property in your `Module`.

```csharp
// In the module class
this.Settings = new TabItem()
{
    Name = () => "Module Name",
    Contents = this.Content, // Entity containing settings control.
};
```

Now a new tab will appear below general in settings section with your custom settings on it.

![settings hand menu](images/settings_system_panel.png)
