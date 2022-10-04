# Environment Manager

![Environment Manager](images/environment.png)

The **EnvironmentManager** is a [SceneManager](../../basics/scenes/scenemanagers.md) responsible to control and provide the Environmental lighting of the scene.


## EnvironmentManager

![EnvironmentManager](images/environmentmanager.png)

| Properties | Default | Description |
| --- | --- | --- |
| **IntensityMultiplier** | 1.0 | This value modify the overall intensity of the environmental lighting. Useful to increase or reduce the IBL intensity. *This property doesn't affect regular Lights (DirectionalLights, PointLights, etc...).* |
| **IBLReflectionProbe** | scene probe | This is the `ReflectionProbe` instance used in the EnvironmentManager. This class contains the IBL textures and information. |
| **Strategy** | `Automatically` | This property indicate to Evergine Studio how often the Environment will be generated. <ul><li>**Automatically:** Evergine Studio updates automatically the scene IBL every time that detects that it need to be updated (Sun direction changes, skybox material changes, etc...)</li><li>**OnDemand:** Only updates the scene IBL on demand, when the user want it. When this option is selected, a `Generate` button appears. Clicking this button force Evergine Studio to recreate the scene IBL.</li></ul>|

## "Skybox" entity tag

By default, Evergine Studio creates automatically a environmental light for each scene. To do this, they create a cubemap from the (0,0,0) position, and will include all [entities](../../basics/component_arch/entities/index.md) with the "Skybox" as Tag property.

When you creates a new scene in Evergine Studio, it will create by default a Sphere Dome entity called "SkyAtmosphere", which render a sky environment controlled by a DirectionalLight marked as Sun.


