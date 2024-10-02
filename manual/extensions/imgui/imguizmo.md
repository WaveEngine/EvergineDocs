# ImGuizmo
---

![ImGuizmo](images/ImGuizmo.png)

This extension also allows you to use the ImGuizmo library, which is a collection of 3D widgets built on top of the ImGUI library. The project and source code are available on GitHub at: https://github.com/CedricGuillemet/ImGuizmo.

> [!NOTE]
> The C# wrapper is generated on top of a C-API wrapper version of this library. As a result, some samples may not work directly, but all features are supported.

## Features

This library comes with many widgets in 3D that are useful for creating editor tools. Here you have more information about them:

## ImViewGizmo Widget

This widget displays a 3D cube in a corner of the screen that represents the view transformation. It is used to select between different camera view presets like top, left, right, and bottom.

![ImGuizmo](images/ImGuizmo_ImViewGizmo.gif)

## ImGuizmo Widget

This widget allows you to draw 3D helpers that are useful for moving, scaling, and transforming 3D geometry. These widgets compute the resulting 4x4 Matrix, making it easy to apply it to the geometry.

![ImGuizmo](images/ImGuizmo_1.gif)
![ImGuizmo](images/ImGuizmo_2.gif)
![ImGuizmo](images/ImGuizmo_3.gif)

## ImSequencer Widget

A work-in-progress little sequencer used to edit frame start/end for different events in a timeline.

![ImGuizmo](images/ImGuizmo_ImSequencer.png)

## Graph Editor Widget

This widget is useful for creating a custom graph editor based on nodes and links between them. It is possible to change how nodes are rendered to customize them.

![ImGuizmo](images/ImGuizmo_GraphEditor.jpg)