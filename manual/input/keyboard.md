# Keyboard

The keyboard is the most common input device on desktop platforms. You can access the keyboard state by using `KeyboardDispatcher`.

## KeyboardDispatcher

The `KeyboardDispatcher` is a class used to track keyboard key events.

```csharp
public abstract class KeyboardDispatcher
{
    public event EventHandler<KeyCharEventArgs> KeyChar;
    public event EventHandler<KeyEventArgs> KeyDown;
    public event EventHandler<KeyEventArgs> KeyUp;

    public bool IsKeyDown(Keys key);
    public ButtonState ReadKeyState(Keys key);
}
```

### Events

| Event | Description | 
| --- | --- |
| **KeyChar** | Occurs when a key is pressed and a character is generated. The `KeyChar` event is useful for text input. |
| **KeyDown** and **KeyUp** | These events are available to track pressed keyboard keys, but it is recommended to use the `IsKeyDown` and `ReadKeyState` methods. <ul><li>**IsKeyDown**: Gets a value indicating whether the current state of a keyboard key is [Pressing](button_states.md) or [Pressed](button_states.md).</li><li>**ReadKeyState**: Gets the current [state](button_states.md) of a keyboard key.</li></ul> | 

### Using KeyboardDispatcher

The `KeyboardDispatcher` can be found within the `Display` or `Surface` objects. The following sample code demonstrates how to access the keyboard dispatcher from a `Component` or `Service`.

```csharp
[BindService]
protected GraphicsPresenter graphicsPresenter;

protected override void Update(TimeSpan time)
{
    KeyboardDispatcher keyboardDispatcher = this.graphicsPresenter.FocusedDisplay?.KeyboardDispatcher;

    if (keyboardDispatcher?.ReadKeyState(Keys.A) == ButtonState.Pressing)
    {
        // Do something
    }
}
```