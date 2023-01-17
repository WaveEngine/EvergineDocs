# Description

Draw lines with different colors and thickness in your scene, is useful to draw attention to something in your scene.

![snapshot](images/snapshot2.png)

You can use both hands, even simultaneously.

# Installation // TODO

# Instantiate from code

```csharp
// Find XrvService instantiation...

var xrv = new XrvService()
.AddModule(new PainterModule());
```

# Usage

Open from hand menu ![hand icon](images/paint.png)

> [!NOTE]
> Draw/Remove lines, only available if paint dialog is open

From menu you can select color, thickness and tools.

![snapshot](images/snapshot.png)

## Actions:

- ![paint](images/paint.png) : Pinch fingers and drag to draw line.
- ![eraser](images/eraser.png) : Pinch fingers and drag to remove line.
- ![hand](images/hand.png) : Do nothing.
- ![undo ](images/undo.png) : Undo last action.
- ![clear all](images/clearall.png) : Clean all lines.

## Color

Select color for line.

![color wheel](images/ColorWheel.png)

Current color is marked by dot.

![current color](images/currentColor.png)

## Thickness

Choose between available thickness

![thin](images/linethin.png) ![medium](images/linemedium.png) ![thick](images/linethick.png)
