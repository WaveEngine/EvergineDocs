# Getting Started
---

![Graphics](images/imgui_features.png)

## Install Evergine.ImGUI extension

To start using this extension, just add Evergine.ImGui package to your project using NuGet package manager from Visual Studio.

```xml
<PackageReference Include="Evergine.ImGui" Version="2021.11.17.2-preview" />
```

Register the ImGuiManager on your scene:

```csharp
public class ImGuiSceneTest : Scene
{
    public override void RegisterManagers()
    {
        this.Managers.AddManager(new ImGuiManager());
        base.RegisterManagers();
    }
...
}
```

And add the namespace ImGuiNET:

```csharp
using ImGuiNET;
```

Now you can start calling the ImGui API from everywhere using the static reference:

```csharp
ImGui.ShowDemoWindow();
```

## Usage

The UI is generated every frame and all the controls between Begin and End will be drawn.

Here you have a simple example:

```csharp
ImGui.Begin("Debug");

ImGui.Text("Hello, world 123");
if (ImGui.Button("Save"))
{
    // MySaveFunction();
}
ImGui.SliderFloat("float", ref f, 0.0f, 1.0f);

ImGui.End();
```

And this is the result:

![Graphics](images/imgui_simple.png)

<br><br>

And now will see a more advanced example:

```csharp
ImGui.Begin("Path Tracing");

float x = this.worldInfo.LightPosition.X;
float y = this.worldInfo.LightPosition.Y;
float z = this.worldInfo.LightPosition.Z;

ImGui.SliderFloat("Camera Pos X", ref x, -10, 10);
ImGui.SliderFloat("Camera Pos Y", ref y, -10, 10);
ImGui.SliderFloat("Camera Pos Z", ref z, -10, 10);

this.worldInfo.LightPosition.X = x;
this.worldInfo.LightPosition.Y = y;
this.worldInfo.LightPosition.Z = z;
ImGui.SliderFloat("Light Radius", ref this.worldInfo.LightRadius, 0.0f, 2.0f);

ImGui.SliderInt("AO Num Rays", ref this.worldInfo.NumRays, 0, 32);
ImGui.SliderFloat("AO Radius", ref this.worldInfo.AORadius, 0.0f, 2.0f);

ImGui.SliderInt("GI Num Bounces", ref this.worldInfo.NumBounces, 0, 2);

ImGui.Spacing();
ImGui.Separator();
ImGui.Spacing();

ImGui.SliderInt("Num Samples", ref this.pathTracerNumSamples, 0, 1024);
ImGui.ProgressBar((float)this.pathTracerSampleIndex / (float)this.pathTracerNumSamples);

ImGui.End();
```

This is the result:

![Graphics](images/imgui_pathtracerui.png)

Take a look this in our [path tracer demo](https://github.com/EvergineTeam/Raytracing).

Note: This project need to create a ImGuiRenderer because is using the **Evergine** low level api, but this is not necessary in a default project created from the **Evergine Studio**.
