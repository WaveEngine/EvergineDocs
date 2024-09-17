# Custom Postprocessing Graph
---

This section explains how to create your custom postprocessing graph, which can be useful if you want to create and test effects that are not available in the default postprocessing graph.

## Example

For this example, we are going to create a simple filter that renders only the red component of the input render.

First, create a compute effect from the [**Assets Details panel**](../../evergine_studio/interface.md):

![Create a compute effect](images/createComputeEffect.jpg)

Write the code for our custom filter in the [**Effect Editor**](../effects/effect_editor.md):

```csharp
[Begin_ResourceLayout]

    Texture2D input : register(t0);
    RWTexture2D<float4> Output : register(u0);

    SamplerState Sampler : register(s0);

[End_ResourceLayout]

[Begin_Pass:Default]

    [Profile 11_0]
    [Entrypoints CS = CS]

    [numthreads(8, 8, 1)]
    void CS(uint3 threadID : SV_DispatchThreadID)
    {
        float2 outputSize;
        Output.GetDimensions(outputSize.x, outputSize.y);
        float2 uv = (threadID.xy + 0.5) / outputSize;		

        float4 color = input.SampleLevel(Sampler, uv, 0);

        Output[threadID.xy] = float4(color.x, 0, 0, 1);	
    }

[End_Pass]
```

Create a new Postprocessing graph asset from the [**Assets Details panel**](../../evergine_studio/interface.md):

![Create postprocessing graph asset](images/AssetsDetailsMenu.jpg)

After creating the postprocessing graph asset, double-click on the asset to open the Postprocessing Graph Editor. You will see an empty postprocessing graph where the render node connects directly with the Screen node.

![Empty Postprocessing graph](images/EmptyPostprocessingGraph.jpg)

Drag our compute effect from the Available Effects panel to the graph editor to create a new node. Then connect the render node's _Color texture_ port with the Custom node's _Input_ port and the Custom node's _Output_ port with the Screen node's _Color Texture_ port.

![Custom graph](images/customGraph.jpg)

After saving the graph, you can see the result in the viewport panel.

![Custom Graph Result](images/customGraphResult.jpg)

To use your custom postprocessing graph in your scene, read more details in the [using postprocessing graph section](using_postprocessing_graphs.md).

## Special Nodes

There is a special node named _Enable_ that you can use to enable or disable an effect in your graph. The Enable node has two inputs: the input0 port connects with the path without applying the effect, and the input1 port connects with the path with the effect applied. Using its Enabled parameter, you can select which path will be used by the output port. The system analyzes the graph before use and discards the unused paths. For example, we are going to add this special node to our example.

![Enable node](images/EnableNode.jpg)

## Special [Output] Metatags

There are special compute effect metatags used by the Postprocessing graph. The metatags **Output** can be used to define the output texture of any node. By default, the output texture is created using the first input texture information, but you can configure it with Output metatags. With these special metatags, you can define the width, height, and pixel format of the node output texture.

**Output Overloading**

<span style="color:lightgreen">[Output(ReferencedInput)]</span>

<span style="color:lightgreen">[Output(ReferencedInput, ScaleFactor)]</span>

<span style="color:lightgreen">[Output(ReferencedInput, ScaleFactor, PixelFormat)]</span>

<span style="color:lightgreen">[Output(width, height, PixelFormat)]</span>

The metatag parameters are:

| Parameter         | Description                                                                                  |
| ----------------- | -------------------------------------------------------------------------------------------- |
| **ReferencedInput** | Input name used to get width, height, and pixel format of the output texture.                |
| **ScaleFactor**     | Defines the scale factor applied to the width and height of the ReferencedInput to get the output width and height dimensions. |
| **PixelFormat**     | Defines the pixel format of the output texture.                                              |
| **Width**           | Defines the width dimension of the output texture.                                           |
| **Height**          | Defines the height dimension of the output texture.                                          |

### Example
In the following example, the Depth input texture has a _1920x1080_ dimension and _D24_UNorm_S8_UInt_ pixel format.

```csharp
Texture2D<float> Depth : register(t0);

RWTexture2D<float4> PositionOutput : register(u0);   [Output(Depth, 1, R16G16B16A16_Float)]
RWTexture2D<float2> VelocityOutput : register(u1);   [Output(Depth, 0.5, R16G16_Float)]
RWTexture2D<float> LinealDepthOutput : register(u2); [Output(500, 500, R32_Float)]
```

The result of the resolved output tags will be:

| Output Texture     | Dimensions | Pixel Format            |
| ------------------ | ---------- | ----------------------- |
| PositionOutput     | 1920x1080  | R16G16B16A16_Float       |
| VelocityOutput     | 960x540    | R16G16_Float             |
| LinealDepthOutput  | 500x500    | R32_Float                |

## Postprocessing Graph Decorator

You can create a C# class extending from **PostProcessingGraphDecorator** to define how your custom postprocessing graph is displayed on the PostProcessingGraphRenderer component. You only need to implement the GenerateUI method using the Editor extensions. More details can be found [here]().