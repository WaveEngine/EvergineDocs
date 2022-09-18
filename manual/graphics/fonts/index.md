# Materials
---
![Fonts and Texts](../images/fonts.jpg)

Fonts is a asset that represents a TrueType font that could be using to draw Text in your project. The available font file formats supported are .ttf and .otf .

## Font atlas
Evergine uses the **Multi-channel signed distance field** technique to generate a prerender sprite font atlas from the original font file. A font atlas is typically stored in texture memory and used to draw text in real-time rendering contexts, the main issue with the traditional sprite-atlas is that the glyphs are prerender in an expecified resolution, so if you use this sprite-atlas to render a big text or the camera is closed to the text, is possible detect loss of resolution and aliasing on the text. Multi-channel signed distance field allows to render font glyphs minimizing loss of resolution with diferent font size and even when the camera is closed to the text. Follow this [link](https://github.com/Chlumsky/msdfgen) to read more details about this technique.

## Default Font
Default Evergine project template imports the [ **Evergine.Core** package](../../evergine_studio/packages.md) and this package includes the [Arial Font](font_editor.md). Text3D component uses Arial font as default you can create your own font asset and change it in the Text3D component. Fonts are a type of [asset](../../evergine_studio/assets/index.md) and have a dedicated Editor [**Font Editor**](font_editor.md).

## In this section
* [Import Fonts](import_fonts.md)
* [Font Editor](font_editor.md)
* [Create Text3D](create_text3D.md)
* [Using Text3D](using_text3D.md)
