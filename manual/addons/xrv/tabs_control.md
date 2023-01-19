# Tabs Control

Tabs control gives basic infrastructure and functionality to add tabbed panels to your application.

It provides a container and a tab navigation system.

![tab container base](images/tabs_control_base.png)

It also provides structured hierarchy for the content.

![tab container hierarchy](images/tabs_control_entity_hierarchy.png)

And properties with basic features to operate the control

| Properties     | Description                                     |
| -------------- | ----------------------------------------------- |
| `Size`         | Set size for the container.                     |
| `SelectedItem` | Sets selected tab, and show associated content. |
| `Builder`      | returns `TabControlBuilder`                     |

## Tab Control Builder

`TabControlBuilder` provides features related to add content in the tab control.

| Methods                     | Description                                 |
| --------------------------- | ------------------------------------------- |
| `AddItem`                   | Add `TabItem` to the controller.            |
| `WithSize`                  | Specifies a size for tab control            |
| `WithActiveItemTextColor`   | Specifies active text color for tab item.   |
| `WithInactiveItemTextColor` | Specifies inactive text color for tab item. |

## Tab Item

`TabItem` provides tab and content for the tab control.

| Properties | Description                       |
| ---------- | --------------------------------- |
| `Name`     | Tab Name.                         |
| `Data`     | General purpose data.             |
| `Order`    | Order to be displayed.            |
| `Contents` | Content for the tabbed container. |

## Tab Control

Is the component used to manage tabs. It has a static builder to create tabs.

Example to Create `TabItem` using `TabControlBuilder`

```csharp
// Get logger
 var tabEntity = TabControl.Builder
                .Create() // Gets builder
                .WithSize(new Vector2(0.3f, 0.2f)) // Set size
                .AddItem(new TabItem // Create tab
                {
                    Name = () => "Tab Name",
                    Contents = () => this.CreateContent(), // Function to create content Func<Entity>
                })
                .Build(); // Initialize
```
