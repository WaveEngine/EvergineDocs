# Meshes

## Introduction

A mesh is a single drawable element, a fundamental structure used to represent 3D objects in a scene. It is composed of vertices (points in 3D space) that are connected to form polygons, typically triangles.

Each vertex in a mesh can hold additional information, such as normals (which define the direction a surface is facing), UV coordinates (which map textures to the object), and color or other custom data. This allows the mesh to have detailed surface characteristics, like how it reflects light or how a texture is applied to it. 

#### Parameters
The *Evergine* mesh class contains the following parameters.

| Property | Type | Description |
|----------| ---- |-------------|
| **VertexBuffers** | `VertexBuffer[]` | Array containing  the vertex buffers of the mesh (explained [here](#vertex-buffers)) |
| **IndexBuffer** | `IndexBuffer` | The mesh index buffer. Can be null (explained [here](#index-buffers))|
| **Buffers** | `Buffer[]` | Array containing all the **Buffer** instances of every vertex buffer. |
| **Offsets** | `int[]` |Array containing all the vertex offsets of every vertex buffer. |
| **PrimitiveTopology** | `PrimitiveTopology` | Enumeration containing the type of geometric topology used for the  mesh.  Its values are: <li>Undefined</li><li>PointList</li><li>LineList</li><li>LineStrip</li><li>TriangleList</li><li>TriangleStrip</li><li>LineListWithAdjacency</li><li>TriangleListWithAdjacency</li><li>Patch_List</li> |
| **InputLayouts** | `InputLayouts` | Object containing the LayoutDescription of every vertex buffer.|
| **Primitive Count** | `int` | The number of primitives of the mesh. |
| **ElementCount** | `int` | The number of elements in the mesh. It's affected by the topology (For example, 1 triangle contains 3 elements, but 1 line is made of 2).|
| **VertexSize** | `ushort` | The memory size (in bytes) of a single vertex.
| **AllowBatching** | `bool` | If the mesh can be used in dynamic and static batching.|

## Vertex Buffers

The *VertexBuffer* class in Evergine represents a buffer that holds the vertex data required for rendering 3D objects. 
It mainly contains the **Buffer** that contains the raw data and the **LayoutDescription** declaring what kind of vertex information it has.
The Vertex Buffer plays a crucial role in managing the vertex layouts and size, ensuring that this data can be processed efficiently by the GPU. The VertexBuffer class handles data organization and allows developers to define how vertex attributes like positions, normals, and textures are stored.

#### Parameters
| Property | Type | Description |
|----------|------|-------------|
| **Buffer** | `Buffer` | Buffer containing the vertex data. |
| **Size** | `int` | Size of the buffer in bytes. |
| **Offset** | `int` | The offset in  bytes of the buffer data. |
| **Data** | `IntPtr` | Pointer of the raw memory data of the buffer. | 
| **LayoutDescription** | `LayoutDescription` | Description of the different **ElementDescription** instances, explaining the type of information, semantics, stride and offsets the vertex contains, allowing to properly extract the data. |
| **VertexCount** | `int` | The number of vertices to be fetched from the buffer. |

## Index Buffers

3D meshes you'll be rendering often have vertices that are shared across multiple triangles. This occurs even with simple shapes, like a rectangle:

Rendering a rectangle requires two triangles, which would normally mean a vertex buffer containing 6 vertices. However, two of these vertices would need to be duplicated, resulting in a 50% redundancy. This issue becomes more pronounced with complex meshes, where a single vertex is typically shared among 3 triangles. To solve this inefficiency, we use an index buffer.

An index buffer is essentially a list of references to the vertices in the vertex buffer. This allows for rearranging the vertex data and reusing vertices across multiple triangles without duplicating data. In the example of a rectangle, if the vertex buffer contains four unique vertices, the index buffer would reference these vertices, with the first three indices forming the top-right triangle, and the last three creating the bottom-left triangle.

#### Parameters
| Property | Type | Description |
|----------|------|-------------|
| **Buffer** | `Buffer` | Buffer containing the indices data. |
| **Size** | `int` | Size of the buffer in bytes. |
| **Offset** | `int` | The offset in  bytes of the buffer data. |
| **Data** | `IntPtr` | Pointer of the raw memory data of the buffer. | 
| **IndexFormat** | `IndexFormat` | The type of index. Can be **Uint16** (_unsigned short_) or **UInt32** (_unsigned int_). |
| **FlipWinding** | `bool` | If true, the triangle side is defined in counter clock-wise order. |
| **IndexCount** | `int` | Number of indices. |


## Create Mesh from Code

## Mesh Hierarchy