# Particle System Editor
![Particles Editor](images/particles_editor.png)

**Particle system Editor** allows the editing of particle system assets. Double click over a **Particle System** asset shown in [Assets Details](../../evergine_studio/interface.md) will open this editor. The editor is composed of 4 main parts:


## Viewport
Shows the **Particle System** with the current configuration. The user can orbit, zoom and pan the camera.
![Particles Viewport](images/particles_viewport.png)



| Actions | Description |
|---------| ----------- |
| Left mouse button | To rotate the camera around the particle system. |
| Right mouse button | To rotate two lights around the particle system. |
| Mouse wheel | To make zoom in/out camera. |

## Toolbar

![Toolbar controls](images/particles_toolbar.png)

Helps with the model visualization. Has the following options:

| Item | Description |
| ---- | ----------- |
| ![toggle grid](images/toggleGrid.png) | Toggles the **Grid** visualization. |
| ![toggle_gizmo](Images/toggle_gizmo.png) | Toggles the **Emitter shape gizmo** visualization.  |
| ![bounding box](Images/toggle_force_cpu.png) | Forces particles simulation to be made using **CPU** instead of **GPU** when this option is activated, even when GPU particles are available.|
| ![reset camera](Images/resetCameraIcon.png) | Resets the camera position.|
| ![change background](Images/changeBackground.png) | Changes the background color.|

##Playback controls

![Simulation controls](images/particle_simulation_controls.png)

This bar controls some aspect of the particle simulation life.

| Control | Description |
| ---- | ----------- |
| ![reset](images/reset_icon.png)| Resets the particle system. |
| ![play](images/play_icon.png) / ![stop](images/stop_icon.png)  | The timeline slider. The handle will mark the current time in the animation, and its position can be modified. |
| ![Time factor](Images/time_factor.png) | Controls the **Time Factor** of the particle system. The same behavior of the **Particles Component** property.|

## Particles Properties
Panel with all the **Particle System** properties. They don't depend on the profile.

![Particles Properties](images/particles_properties.png)