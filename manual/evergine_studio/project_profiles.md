# Project settings & Manage profiles
As cross-platform engine, _Evergine_ provides a way to create different launcher projects for supported platforms. For each platform, a _C#_ project will be added to your filesystem. You can create more than a project for a given platform, but each one of those projects will be considered as a different profile.

If you didn't add all platforms you want in project creation window, you can do it from 
_Evergine Studio_ once your project is loaded. Just go to _Settings > Project Settings_ menu to open a dialog to manage your project profiles. By default, an Evergine project includes _Windows_ as platform. This platform is required for _Evergine Studio_ to work, so you can't remove it.

![Scene update for managers](images/profile_add-profile.jpg)

To add a new platform profile, use the _Add_ button. A new window will be open, where you can look for platform you want to add. By default, a profile name will be proposed, but you can change it if you want. As described above, you can even have more than one profile for the same platform. This will create separated C# projects for each one of those platforms.

![Scene update for managers](images/profile_search-profile.jpg)

In the same way as launcher creation form, we have added here some filters to make it easier to find a template. Just make use of free text input and platform dropdown selector to limit template results.

## Profile management

For each profile, a different set of settings is applied. Once you add a new platform profile, a default set of values will be added for that platform. For example, in platforms like _Windows_ shaders are compiled on runtime by default, but other platforms like _Web_ or _Android_ require shaders to be precompiled due to performance and platform limitations.

![Scene update for managers](images/profile_edit-profile.jpg)

Profile settings whenever can be customized at any time you want. Changes will be saved once you press _Update_ button. List of options that you can configure are described below.

### Textures

Controls texture compression to be used in a given profile. This is important to optimize textures to be loaded in graphics hardware, that may be limited in platforms like mobile devices.

You can specify both alpha and non-alpha compression format. List of available formats are provided by [PixelFormat](xref:Evergine.Common.Graphics.PixelFormat) enum.

### Shaders

You can enable shaders to be precompiled and included in platform package. This may increase build time, but reduce loading time while running the application.

Also, you can configure your own directive specifications that fits better to your project. For each directive you can choose on enabling or disabling it. Once enabled, you can also add each directive to a directive combination. At the bottom, there is a read-only text area that presents configured directive combinations.

## Open platform projects
For each profile registered within your project, you will find a new entry in _File > Open C# editor_ menu. When clicking on one of provided options, platform specific _Visual Studio_ solution.

![Scene update for managers](images/profile_open-project.jpg)