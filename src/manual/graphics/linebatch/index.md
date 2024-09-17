# Line Batch
---
![Billboards header](images/linebatchHeader.jpg)

**Linebatch** is very useful when you need to create a huge number of lines in your scene, for example, for dummy objects or helpers. The most interesting thing about this feature is that all the lines you create are batched into a single draw call, allowing you to achieve good performance.

This feature is _only available from code_. You can find LineBatch3D and LineBatch2D in the scene RenderManager.

The lines are composed of two vertices and an edge, so you cannot control the thickness of the lines. If you want to draw thicker lines, see the [Line3D](../lines_3d.md).

## In this section

* [Using Linebatch](using_linebatch.md)
* [Create custom Linebatch](custom_linebatch.md)