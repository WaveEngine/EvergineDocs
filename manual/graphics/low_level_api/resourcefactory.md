# ResourceFactory

**ResourceFactory** is the factory class responsible for creating all low-level objects such as a native Texture, Sampler, GraphicsPipeline, among other things.

Once you have the [GraphicsContext](graphicscontext.md) instance, you can use it to access the ResourceFactory and start creating low-level objects. In this example, to create a VertexBuffer object:

```csharp
var vertexBufferDescription = 
    new BufferDescription((uint)Unsafe.SizeOf<VertexPositionNormalTexture>() * (uint)vertexData.Length, BufferFlags.VertexBuffer, ResourceUsage.Default);

var vertexBuffer = this.graphicsContext.Factory.CreateBuffer(vertexData, ref vertexBufferDescription);
```

All the common low-level objects (textures, buffers, etc.) are represented by abstract classes, and ResourceFactory allows you to create them in the same way for all the supported APIs. For example, a ResourceFactory of `DX11GraphicsContext` will always create DX11 graphics resources (`DX11Texture`, `DX11Buffer`, and so on).

## Objects

The complete list of objects that you can create using the ResourceFactory includes:

* [Buffer](buffer.md)
* [Texture](texture.md)
* [Sampler](sampler.md)
* [Framebuffer](framebuffer.md)
* [Shader](shader.md)
* [QueryHeap](queryheap.md)
* [ResourceLayout](resourcelayout.md)
* [GraphicsPipeline](graphicspipeline.md)
* [ComputePipeline](computepipeline.md)
* [RayTracingPipeline](raytracingpipeline.md)
* [ResourceSet](resourceset.md)
* [CommandQueue](commandqueue.md)
* [CommandBuffer](commandbuffer.md)