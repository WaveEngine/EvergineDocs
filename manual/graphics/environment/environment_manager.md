# Environment Manager

![Environment Manager](images/environment.png)

The **EnvironmentManager** is a [SceneManager](../../basics/scenes/scenemanagers.md) responsible for controlling and providing the environmental lighting of the scene.

## EnvironmentManager

![EnvironmentManager](images/environmentmanager.png)

| Properties            | Default           | Description                                                                                                                                                                                                                                                                                    |
|-----------------------|-------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **IntensityMultiplier** | 1.0               | This value modifies the overall intensity of the environmental lighting. It is useful for increasing or reducing the IBL intensity. *This property doesn't affect regular Lights (DirectionalLights, PointLights, etc...).*                                                                 |
| **IBLReflectionProbe**  | scene probe       | This is the `ReflectionProbe` instance used in the EnvironmentManager. This class contains the IBL textures and information.                                                                                                                                                                   |
| **Strategy**            | `Automatically`   | This property indicates to Evergine Studio how often the Environment will be generated. <ul><li>**Automatically:** Evergine Studio updates the scene IBL automatically every time it detects that an update is needed (Sun direction changes, skybox material changes, etc...)</li><li>**OnDemand:** Only updates the scene IBL on demand, when the user wants it. When this option is selected, a `Generate` button appears. Clicking this button forces Evergine Studio to recreate the scene IBL.</li></ul> |

## "Skybox" entity tag

By default, Evergine Studio automatically creates environmental lighting for each scene. To do this, it creates a cubemap from the (0,0,0) position and includes all [entities](../../basics/component_arch/entities/index.md) with the "Skybox" tag property.

When you create a new scene in Evergine Studio, it will by default create a Sphere Dome entity called "SkyAtmosphere," which renders a sky environment controlled by a DirectionalLight marked as Sun.