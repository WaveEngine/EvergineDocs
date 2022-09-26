# ImGuizmo
---

![ImGuizmo](images/ImGuizmo.png)

This extension also allow you to use the ImGuizmo library, this is a collection of 3D widgets on top o ImGUI library, this project and source code is available on github at: https://github.com/CedricGuillemet/ImGuizmo.

> [!NOTE]
> The C# wrapper is generated on top of a c-api wrapper version of this library, so some samples may not work directly but all the features are supported.

## Features

This library comes with many widget in 3D useful to create an editor tool, here you have more info about the 

## ImViewGizmo widget

This widget display a 3D cube in a corner of the screen that represent the view transformation, it is used to select between different camera views preset like top, left, right and bottom.

![ImGuizmo](images/ImGuizmo_ImViewGizmo.gif)

## ImGuizmo widget

This widget allow you to draw 3D helpers useful to move, scale and transform 3D geometry, this widgets compute the result 4x4 Matrix to make it easy to apply it to the geometry. 

![ImGuizmo](images/ImGuizmo_1.gif)
![ImGuizmo](images/ImGuizmo_2.gif)
![ImGuizmo](images/ImGuizmo_3.gif)

## ImSequencer widget

A WIP little sequencer used to edit frame start/end for different events in a timeline.

![ImGuizmo](images/ImGuizmo_ImSequencer.png)

## Graph editor widget

This widget is useful to create a custom graph editor based on nodes and links between them. It is possible to change how nodes are rendered to customize them.

![ImGuizmo](images/ImGuizmo_GraphEditor.jpg)
