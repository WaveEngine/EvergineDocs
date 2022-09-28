# Particle System Editor
![Particles Editor](images/particles_editor.png)

**Particle system Editor** allows the editing of particle system assets. Double click over a **Particle System** asset shown in [Assets Details](../../evergine_studio/interface.md) will open this editor. The editor is composed of 4 main parts:


## Viewport
Shows the **Particle System** with the current configuration. The user can orbit, zoom and pan the camera.

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

![Playback controls](Images/playbackToolbar.png)

In case that the model has animations, the *Playback Toolbar* allows to play the selected clip.

| Control | Description |
| ---- | ----------- |
| ![play](Images/playIcon.png) /  ![stop](Images/stopIcon.png)| Plays / Stop the current clip animationS. |
| ![timeline](Images/slider.png) | The timeline slider. The handle will mark the current time in the animation, and its position can be modified. |
| ![speed](Images/velocity.png) | Controls the **Speed Factor** of the reproduction. By default is **1.00**. |

## Properties
Panel with all the **Model** properties. They don't depend on the profile.

| Property | Description |
|----------|-------------|
| **SwapSwindingOrder** | Flips the normals of the model when activated..
| **GenerateTangentSpace** | When checked will generate the tangent coordinates of every vertex. Useful when dealing with normal mapping.
| **ExportAnimations** | For exporting the animation information of the model.
| **ExportAsRaw**| Will export the model as the source file (`.fbx` for example), instead of creating a binary **Evergine** asset..

## Animation clip properties
For every animation contained in the model, it will show the following information.

| Property | Description |
|----------|-------------|
| Index | The animation order. |
| Name | the name of the clip. This string will be used in the **Animation3D** when we want to play the animation.
| Duration | Timestamp of the duration.