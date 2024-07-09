# Configurators
---
The configurator components were created to ease the customization process and, in some cases, to extend the functionality of certain controls. To use them, add them to the prefab root after instancing a prefab.

There are examples for all configurators in the *test scenes* in the *MRTK Demo* project.

## Standard Button Configurator
This configurator can manage the configuration of certain aspects of a basic button, such as the icon, button text, and material plate. If the color should also be changed, the *CreatesNewIconMaterialInstance* and *CreatesNewBackPlateMaterialInstance* checkboxes will ensure that the change does not affect other instances.

![Standard button configurator](images/standard_button_configurator.png)

## ToggleButton
When added to a button, the *ToggleButton* component extends its base functionality so that the button will have two different styles depending on whether it is in the *ON* or *OFF* state. This component adds two *ToggleButtonConfigurator* components, which can be used to configure each state in a very similar way to the *StandardButtonConfigurator*.

![Toggle button configurator](images/toggle_button_configurator.png)

## Multi-State Buttons
The *ToggleButton* component adds the *ToggleStateManager* and two *ToggleButtonConfigurators* to the button. There is also an implementation for tri-state buttons by way of adding a *MultiStateStateManager* and three *MultiStateButtonConfigurator* components to a button.

All these *StateManager* classes extend the *BaseStateManager* class using an enum with all the states a button can have. If more than three states are needed, a new class can be created using this base class and a custom enum. The configurator components also need to be implemented using this enum, so each one is associated with a single state.

## Slider Configurator
This configurator contains specific settings to change the track and thumb materials, and the label text in a slider.

![Slider configurator](images/slider_configurator.png)