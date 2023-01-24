# Tabs Control

Tabs control gives basic infrastructure and functionality to add tabbed panels to your application.

It provides a container and a tab navigation system.

![tab container base](images/tabs_control_base.png)

It provides following properties to customize the control.

| Properties     | Description                                     |
| -------------- | ----------------------------------------------- |
| `Size`         | Set size for the container.                     |
| `SelectedItem` | Sets selected tab, and show associated content. |
| `Builder`      | returns `TabControlBuilder`                     |

## Create a tab control programmatically

Easiest way to create a tab instance is to use `TabControlBuilder` provides features related to add content in the tab control.

| Methods                     | Description                                 |
| --------------------------- | ------------------------------------------- |
| `AddItem`                   | Adds a single item.            |
| `AddItems`                   | Adds a set of items.            |
| `WithSize`                  | Specifies a size for tab control            |
| `WithActiveItemTextColor`   | Specifies active text color for tab item.   |
| `WithInactiveItemTextColor` | Specifies inactive text color for tab item. |

```csharp
var tabEntity = TabControl.Builder
    .Create()
    .WithSize(new Vector2(0.3f, 0.2f))
    .AddItem(new TabItem
    {
        Name = () => "Tab Name",
        Contents = () => this.CreateContent(), // Function to set content entity
    })
    .Build();  
```

In _XRV_ we make use of this tab control builder in configuration and help windows. If you want a window which only content entity is a tab control, you can
make use of _TabbedWindow_ class.

## Tab items definition

`TabItem` provides tab and content for the tab control.

| Properties | Description                       |
| ---------- | --------------------------------- |
| `Name`     | Tab Name.                         |
| `Data`     | General purpose data.             |
| `Order`    | Order to be displayed.            |
| `Contents` | Content for the tab item. |
