# Touch

Touch is the most common input system on mobile devices. **Pointers** are points on the device screen corresponding to **finger touches**. Devices with multi-touch functionality support multiple simultaneous pointers.

## PointerDispatcher

The `PointerDispatcher` is a class used to track pointer events. 

```csharp
public abstract class PointerDispatcher
{
    public IList<PointerPoint> Points { get; }

    public event EventHandler<PointerEventArgs> PointerDown;
    public event EventHandler<PointerEventArgs> PointerUp;
    public event EventHandler<PointerEventArgs> PointerMove;
}
```

The `Points` property gets a list of points detected on the surface in the current frame.

The `PointerDown`, `PointerUp`, and `PointerMove` events are available to track touch and pointer points.

### PointerPoint

The PointerPoint class provides the following information:

| Property | Description |
| --- | --- |
| **Id** | A number that is uniquely associated with this touch. It is usually provided by the underlying platform. |
| **Position** | The pointer position in screen coordinates. |
| **State** | Gets the current pointer state. See [Button States](button_states.md) for more information. |

### Using PointerDispatcher

The `PointerDispatcher` can be found within the `Display` or `Surface` objects. The following sample code shows how to access the pointer dispatcher from a `Component` or `Service`.

```csharp
[BindService]
protected GraphicsPresenter graphicsPresenter;

protected override void Update(TimeSpan time)
{
    PointerDispatcher pointerDispatcher = this.graphicsPresenter.FocusedDisplay?.PointerDispatcher;

    if (pointerDispatcher == null)
    {
        return;
    }

    foreach (PointerPoint p in pointerDispatcher.Points)
    {
        if (p.State == ButtonState.Pressing)
        {
            // Do something
        }
    }
}
```