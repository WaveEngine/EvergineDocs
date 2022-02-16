# Add-ons
---
**Evergine** has an add-ons packages management useful to add specific functionality for several task in different areas without increase the size of the core version used by all users.

This add-ons may contain assets, prefabs, behavior and nuget packages that will be incorporate to your project after install it and

To open add-ons manager, you count with 3 possibilities:

* Use File menu, where you will find a new “Manage dependencies” menu item.
* Under Assets explorer, there is a node with name “Dependencies”. Right click on that will show a context menu with a menu entry with the same name in the point above.
* Access to “Project settings”, there are two tabs now, one for project profiles, and other for project add-ons.

![Graphics](images/ui.png)

You can find two tabs: Browse, where you can find all available add-ons; and Installed, where you can check all add-ons that are currently in use in your project. Both tabs contain a similar user interface. In fact, they use the same controls, but with a different filtering criteria.
Above those tabs, you will find a searching area:

* Free text search, to filter results by name and tags.
* Source combobox, to limit results to an specific packages source.

Depending on search criteria, number of displayed add-ons may vary. Each add-on item within the list displays following information:

* Name, icon and description.
* Under the icon, in bottom left corner, it will display a tick inside a green circle if you are already using last available version, or an arrow inside a blue circle if you are using that add-on, but there is a newer version available.
* On top right corner, you will find latest available version vs installed version (if any). For those add-ons which last version is already in use, a single version label is displayed.
* Also, if you move your mouse over list items, some buttons to install last add-on version or remove an add-on should appear.

![Graphics](images/packageinfo.png)

When selecting an item in the list, a detail view is loaded with all the information related to an add-on. There, you can also install or uninstall the add-on, and you are even able to install a specific version. A point of interest here is the NuGet dependencies section, that will indicate minimal versions of engine and/or third-party NuGet packages. As it is mandatory to have aligned versions of the engine packages, if you try to install an add-on with an engine dependency higher than the one you are using, a project restart will be required and automatically scheduled.

For add-ons which NuGet dependencies are not expressed as explicit version number, you should install those packages manually. In other hand, for third-party NuGet dependencies with explicit version number, they will be added or updated automatically once package is added.

All this add-ons are expected to resolve some key issues that companies face when they create industrial 3D application using their common resources.
The ability to include new add-ons to external companies will be available coming soon, for now only add-ons create by **Evergine Team** could be installed by **Evergine Studio**.

## In this section

* [MRTK](mrtk.md)
* [ARR](arr.md)