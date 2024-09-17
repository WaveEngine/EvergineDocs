# Ruler Module

This module allows users to measure elements in virtual space. It creates a basic ruler element with manipulators at both ends. When the user grabs any of these manipulators, the distance from one side to the other is automatically calculated.

![snapshot](images/snapshot.png)

## Installation

This module is packaged as an [Evergine add-on](../../../index.md). To use it in your project, install it from the _Project Settings > Add-Ons_ window.

![Module installation](images/installation.png)

Then, register the module programmatically within your XRV service instance.

```csharp
var xrv = new XrvService()
    .AddModule(new RulerModule());
```

## Usage

- The ![snapshot](images/measure.png) button is added to the hand menu. Tapping this button will toggle the ruler's visibility.
- Dragging the line ends will update the distance measurement.
- Access [Settings](../../settings_system.md) to change the current measurement units. You can choose between meters and feet.