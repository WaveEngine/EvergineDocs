# Meshes

## Introduction

A mesh is a single drawable element, a fundamental structure used to represent 3D objects in a scene. It is composed of vertices (points in 3D space) that are connected to form polygons, typically triangles.

Each vertex in a mesh can hold additional information, such as normals (which define the direction a surface is facing), UV coordinates (which map textures to the object), and color or other custom data. This allows the mesh to have detailed surface characteristics, like how it reflects light or how a texture is applied to it. 

### Parameters
The *Evergine* mesh class contains the following parameters.

| Property | Description |
|----------|-------------|
| VertexBuffers | Array containing  the vertex buffers of the mesh (explained in the next chapter) |
| IndexBuffer | The mesh index buffer. Can be null (explained in the next chapter. )|
| Buffers | Array containing all the **Buffer** instances of every vertex buffer. |
| Offsets | Array containing all the vertex offsets of every vertex buffer. |
| PrimitiveTopology | Enumeration containing the type of geometric topology used for the  mesh.  Its values are: <li>Undefined</li><li>PointList</li><li>LineList</li><li>LineStrip</li><li>TriangleList</li><li>TriangleStrip</li><li>LineListWithAdjacency</li><li>TriangleListWithAdjacency</li><li>PatchList</li> |

## Vertex Buffers

## Index Buffers

## Create Mesh from Code

## Mesh Hierarchy