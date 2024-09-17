# QueryHeap

A query heap contains an array of GPU queries. A query heap allows batching a set of GPU queries to achieve better performance.

## Creation

To create a `QueryHeap`, you first need to construct a `QueryHeapDescription`:

```csharp
QueryHeap queryHeap;
uint maxQueries = 4;

QueryHeapDescription desc = new QueryHeapDescription()
{
    Type = QueryType.Timestamp,
    QueryCount = maxQueries,
};

this.queryHeap = this.graphicsContext.Factory.CreateQueryHeap(ref desc);
```

### QueryType

| Value | Description |
|-------|-------------|
| **Timestamp** | Indicates the query is for high-definition GPU and CPU timestamps. |
| **Occlusion** | Indicates the query is for depth/stencil occlusion counts. |
| **BinaryOcclusion** | Indicates the query is for binary depth/stencil occlusion statistics. |

## Timestamp Queries

You can obtain timestamps as part of a command list (rather than via a CPU-side call on a command queue) using timestamp queries.

### How to Use Timestamp Queries

```csharp
ulong[] results;

var commandBuffer = this.commandQueue.CommandBuffer();

commandBuffer.Begin();
commandBuffer.WriteTimestamp(this.queryHeap, 0);
commandBuffer.UpdateBufferData(this.constantBuffer, ref worldViewProj);

commandBuffer.SetViewports(this.viewports);
commandBuffer.SetScissorRectangles(this.scissors);

var renderPassDescription = new RenderPassDescription(this.frameBuffer, ClearValue.Default);
commandBuffer.BeginRenderPass(ref renderPassDescription);

commandBuffer.SetGraphicsPipelineState(this.pipelineState);
commandBuffer.SetResourceSet(this.resourceSet);
commandBuffer.SetVertexBuffers(this.vertexBuffers);
commandBuffer.Draw((uint)this.vertexData.Length / 2);

commandBuffer.EndRenderPass();
commandBuffer.WriteTimestamp(this.queryHeap, 1);

commandBuffer.End();
commandBuffer.Commit();

this.commandQueue.Submit();
this.commandQueue.WaitIdle();

this.queryHeap.ReadData(0, 4, this.results);
```

### How to Show Timestamp Results

```csharp
this.surface.MouseDispatcher.DispatchEvents();
this.surface.KeyboardDispatcher.DispatchEvents();

commandBuffer.SetViewports(this.viewports);

this.uiRenderer.NewFrame(gameTime);

double gpuFrequency = this.graphicsContext.TimestampFrequency;

double time1 = ((this.results[1] - this.results[0]) / gpuFrequency) * 1000.0;
double time2 = ((this.results[3] - this.results[2]) / gpuFrequency) * 1000.0;

ImGui.SetNextWindowSize(new System.Numerics.Vector2(300, 100));
ImGui.Begin("Timings");
ImGui.Text($"Draw: {time1.ToString("0.0000")} ms");
ImGui.Text($"ImGui: {time2.ToString("0.0000")} ms");
ImGui.End();

this.uiRenderer.Render(commandBuffer);
```

## Occlusion Queries

Hardware occlusion queries have been one of the most eagerly awaited graphics hardware features for a long time. This feature allows an application to ask the 3D API whether any pixels would be drawn if a particular object were rendered. With this feature, applications can check whether the bounding boxes of complex objects are visible; if the bounds are occluded, the application can skip drawing those objects.

### QueryHeap Creation

```csharp
uint maxQueries = 4;
QueryHeapDescription desc = new QueryHeapDescription()
{
    Type = QueryType.Occlusion,
    QueryCount = maxQueries,
};

var queryHeap = this.graphicsContext.Factory.CreateQueryHeap(ref desc);
```

### How to Use Occlusion Queries

```csharp
// Draw
var commandBuffer = this.commandQueue.CommandBuffer();

commandBuffer.Begin();
commandBuffer.UpdateBufferData(this.constantBuffer0, ref viewProj);
commandBuffer.UpdateBufferData(this.constantBuffer1, ref worldViewProj);

commandBuffer.SetViewports(this.viewports);
commandBuffer.SetScissorRectangles(this.scissors);

var renderPassDescription = new RenderPassDescription(this.frameBuffer, ClearValue.Default);
commandBuffer.BeginRenderPass(ref renderPassDescription);

commandBuffer.SetGraphicsPipelineState(this.pipelineState);
commandBuffer.SetResourceSet(this.resourceSet0);
commandBuffer.SetVertexBuffers(this.vertexBuffers);

commandBuffer.BeginQuery(this.queryHeap, 0);
commandBuffer.Draw((uint)this.vertexData.Length / 2);
commandBuffer.EndQuery(this.queryHeap, 0);

commandBuffer.EndRenderPass();
commandBuffer.End();
commandBuffer.Commit();

this.commandQueue.Submit();
this.commandQueue.WaitIdle();

this.queryHeap.ReadData(0, 1, this.results);
```

### How to Show Occlusion Results

```csharp
this.surface.MouseDispatcher.DispatchEvents();
this.surface.KeyboardDispatcher.DispatchEvents();

commandBuffer.SetViewports(this.viewports);

this.uiRenderer.NewFrame(gameTime);

ImGui.SetNextWindowSize(new System.Numerics.Vector2(300, 100));
ImGui.Begin("Occlusion Test");
ImGui.Text($"Samples: {this.results[0]}");
ImGui.End();

this.uiRenderer.Render(commandBuffer);
```