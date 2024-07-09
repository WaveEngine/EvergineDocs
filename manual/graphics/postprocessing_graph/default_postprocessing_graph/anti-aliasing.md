# Fast Approximate Anti-Aliasing (FXAA)

**Fast approximate anti-aliasing** is a screen-space anti-aliasing algorithm created by Timothy Lottes at Nvidia.

The main advantage of this technique over conventional spatial anti-aliasing is that it does not require large amounts of computing power. It achieves this by smoothing undesirable jagged edges ("jaggies") as pixels, according to how they appear on-screen, rather than analyzing the 3D model itself, as in conventional spatial anti-aliasing. Since it is not based on the actual geometry, it will smooth not only edges between triangles but also edges inside alpha-blended textures or those resulting from pixel shader effects, which are immune to the effects of multisample anti-aliasing (MSAA).

The downsides are that high contrast texture maps are blurred, FXAA must be applied before rendering the HUD elements of a game lest it affect them too, and polygonal details smaller than one pixel that would have been captured and rendered by MSAA and SSAA will not be captured and rendered by FXAA alone.