# Description

Draw lines with different colors and thickness in your scene.

![snapshot](images/snapshot2.png)

# Installation

```csharp
 public MyApplication()
        {
            ....
             var xrv = new XrvService()
                ...
                .AddModule(new PainterModule());
            ...
        }
```

# Usage

Open from hand menu ![hand icon](images/paint.png)

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

## Thickness

Choose beetwen available thickness

![thin](images/linethin.png) ![medium](images/linemedium.png) ![thick](images/linethick.png)
