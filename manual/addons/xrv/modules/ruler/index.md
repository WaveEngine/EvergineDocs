# Ruler module

This module lets users to measure elements in virtual space. It creates a basic ruler element with manipulators in both ends. When user grabs any of these manipulators, distance from one side to the other will be automatically calculated.

![snapshot](images/snapshot.png)

## Installation

This module is packaged as [Evergine add-on](../../../index.md). To use it in your project, just install it from _Project Settings > Add-Ons_ window.

![Module installation](images/installation.png)

Then, just register the module programmatically within your XRV service instance.

```csharp
var xrv = new XrvService()
    .AddModule(new RulerModule());
```

## Usage

- ![snapshot](images/measure.png) button is added to hand menu. Tapping on this button will toggle ruler visibility.
- Drag line ends will update distance measurement.
- Access to [Settings](../../settings_system.md) to change current measure units. You can choose between meters and feet.
