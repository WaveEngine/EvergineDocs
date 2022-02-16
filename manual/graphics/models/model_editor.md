# Model Editor
![Model Editor](images/ModelEditor.jpg)

**Model Editor** allows the editing of model assets. Double click over a **Model** asset shown in [Assets Details](../../evergine_studio/interface.md) will open this editor. The editor is composed of 5 main parts:

## Viewport
Shows the **Model** with the current configuration. If the model is animated, it will show the current animation state of the *animation toolbar*.

## Toolbar

![Toolbar controls](Images/modelToolbar.png)

Helps with the model visualization. Has the following options:

| Item | Description |
| ---- | ----------- |
| ![toggle grid](Images/toggleGrid.png) | Toggles the **Grid** visualization. |
| ![solid](Images/solidIcon.png) /  ![wireframe](Images/wireframeIcon.png)| <p>Toggles the visualization from **Solid** (default) to **Wireframe**. </p> ![Wireframe](Images/wireframe.png) |
| ![bounding box](Images/boundingBoxIcon.png) | <p>Toggles the **Bounding box** visualization of the model.</p> ![bounding box](Images/boundingBox.png)|
| ![hierarchy](Images/hierarchyIcon.png) | <p>Toggles the **Hierarchy** visualization of the model.</p> ![bounding box](Images/hierarchy.png)|
| ![normals](Images/normalIcon.png) | <p>Toggles the **normals** visualization of the vertices.</p> ![bounding box](Images/normals.png)|
| ![uv](Images/uvCheckerIcon.png) | <p>Toggles the **UV checker** visualization of the model.</p> ![bounding box](Images/checker.png)|
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