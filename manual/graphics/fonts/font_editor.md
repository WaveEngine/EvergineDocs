# Font Editor
---
![Font Editor Interface](images/FontEditor.jpg)

**Font Editor** allows editing the font assets. Double click over a font asset shown in [Assets Details](../../evergine_studio/interface.md) will open this editor. The editor is composed of 3 main parts:

## **Viewport**

Shows the result of the current font configuration. The viewport has a toolbox on the top side that allows change the font color and background color.

## **Input Text**

In this area you can input different texts to test the font configuration in the viewport. By default appear the paragrah _"The quick brown fox jumps over the lazy dog. 1234567890.:,;'"(!?)+-*/="_ that test all letters, numbers and punctuation marks. But if you modify the charset to include additional characters you can test including them in this input text.

## **Properties**

The font properties that you can configure are:

| Property      | Default value | Description   |
| ---- | ---- | ---- | 
| **MinGlyphSize**  | 32            | The minimum glyph size used to render a font glyph in the atlas. When a font is so thin or has thin parts as ligatures, it will be necessary to increase this size for a correct render. Increasing the size produces more large atlas and a more weight font asset. |
| **Charset**       | ['','~']      | Sets the character set. <p> The charset is a text with UTF-8 or ASCII encondig. The following syntax are correct: </p> <ul><li> Single character: _'A'_ (UTF-8 enconded), _65_ (decimal Unicode), _0x41_ (hexadecimal Unicode)</li><li>Range of characters: _['A', 'Z']_,_[65, 90]_, _[0x41, 0x5a]_</li> <li>String of characters: _"ABCDEFGHIJKLMNOPQRSTUVWXYZ"_ (UTF-8 enconded)</li> </ul> <p>The entries should be separated by commas or whitespace. In between quotation marks, backslash is used as the escape character (e.g. '\'', '\\', "!\"#"). The order in which characters appear is not taken into consideration.</p>|

