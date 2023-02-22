# Painter module

If you need to draw 3D lines in virtual space, this module is a good option. It lets you draw lines with different colors and thickness, so it could be useful to draw attention to certain elements like, for example, 3D models.

![snapshot](images/snapshot2.png)

A remarkable capability of this drawing tool is that you can use both hands at the same time. Also, you can undo any drawing/deletion action, or even remove all drawn lines at any moment.

## Installation

This module is packaged as [Evergine add-on](../../../index.md). To use it in your project, just install it from _Project Settings > Add-Ons_ window.

![Module installation](images/installation.png)

Then, just register the module programmatically within your XRV service instance.

```csharp
var xrv = new XrvService()
    .AddModule(new PainterModule());
```
## Usage

- To open painter window, tap on ![hand icon](images/paint.png) hand menu button.

![snapshot](images/snapshot.png)

> [!NOTE]
> Drawing or removing lines is only available while painter window is open.

- Color selection wheel lets user to change current color. Active color is marked with a selection indicator.

![current color](images/currentColor.png)

- You can choose between a set of thickness that will be applied when a new line is drawn.
    - ![thin](images/linethin.png) Thin.
    - ![medium](images/linemedium.png) Medium.
    - ![thick](images/linethick.png) Thick.

- There are buttons to undo previous actions or remove all lines. Full set of actions is listed below.
    - ![paint](images/paint.png) : Pinch fingers and drag to draw line.
    - ![eraser](images/eraser.png) : Pinch fingers and drag to remove line.
    - ![hand](images/hand.png) : Do nothing.
    - ![undo ](images/undo.png) : Undo last action.
    - ![clear all](images/clearall.png) : Clean all lines.