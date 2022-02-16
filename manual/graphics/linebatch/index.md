# Line Batch
---
![Billboards header](images/linebatchHeader.jpg)

**Linebatch** is very useful when you need to create a huge amount of line in your scene. For example for dummy objects or helpers in your scene. The more interesting thing of this feature is that all lines that you created are batch in a single drawcall so you archieve a good performance.

This feature is _only available from code_. You can find the LineBatch3D and LineBatch2D in the scene RenderManager.

The lines are compounds by two vertex and an edge so you cannot control the thickness of the lines. If you want to draw thickness lines see the [Line3D](../lines_3d.md).

## In this section

* [Using Linebatch](using_linebatch.md)