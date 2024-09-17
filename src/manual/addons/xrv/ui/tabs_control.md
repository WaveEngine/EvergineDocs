# Tabs Control

The Tabs control gives basic infrastructure and functionality to add tabbed panels to your application.

It provides a container and a tab navigation system.

![tab container base](images/tabs_control_base.png)

It offers the following properties to customize the control:

| Properties     | Description                                     |
| -------------- | ----------------------------------------------- |
| `Size`         | Sets the size for the container.                     |
| `SelectedItem` | Sets the selected tab and shows the associated content. |
| `Builder`      | Returns `TabControlBuilder`.                     |

## Create a tab control programmatically

The easiest way to create a tab instance is to use `TabControlBuilder`, which provides features related to adding content to the tab control.

| Methods                     | Description                                 |
| --------------------------- | ------------------------------------------- |
| `AddItem`                   | Adds a single item.                         |
| `AddItems`                  | Adds a set of items.                        |
| `WithSize`                  | Specifies a size for the tab control.       |
| `WithActiveItemTextColor`   | Specifies the active text color for the tab item.   |
| `WithInactiveItemTextColor` | Specifies the inactive text color for the tab item. |

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

In _XRV_, we use this tab control builder in configuration and help windows. If you want a window where the only content entity is a tab control, you can make use of the _TabbedWindow_ class.

## Tab items definition

`TabItem` provides tabs and content for the tab control.

| Properties | Description                       |
| ---------- | --------------------------------- |
| `Name`     | Tab Name.                         |
| `Data`     | General purpose data.             |
| `Order`    | Order to be displayed.            |
| `Contents` | Content for the tab item.         |