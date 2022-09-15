# Bind Services

Using **[BindService]** attribute allows the developer to stablish dependencies with a [Service](../services.md) registered in the [Application Container](../application/container.md). 

```csharp
// Bind the Graphics Context registered in the Application...
[BindService]
private GraphicsContext transform;
```

> [!NOTE]
> [BindService] can be used inside Services, Components and SceneManagers. In other case the binding cannot be resolved

## [BindService] Properties
This attribute offers several ways to customize:

### isRequired (default `true`)

If the value is true the dependency is required to be resolved, in other case, the current Component won't be attached.

The isRequired value has the same functionality than [BindComponent] (see [Bind Components](bind_components.md for further details)).

For example, if this is all Services registered inside the Application Container:

```csharp
// Register services into application container...
this.Container.RegisterType<TimerFactory>();
this.Container.RegisterType<Random>();
this.Container.RegisterType<ErrorHandler>();
this.Container.RegisterType<ScreenContextManager>();
this.Container.RegisterType<GraphicsPresenter>();
this.Container.RegisterType<AssetsDirectory>();
this.Container.RegisterType<AssetsService>();
this.Container.RegisterType<ForegroundTaskSchedulerService>();            
this.Container.RegisterType<WorkActionScheduler>();
```

The following component will be attached because the `AssetsService` has been registered:

```csharp
public class MyComponent : Component
{
    [BindService]
    private AssetsService assetService;

    // ...
}
```

However, in that case, the dependency will fail because the `Clock` service is not registered:

```csharp
public class MyComponent : Component
{
    [BindService]
    private Clock clock;

    // ...
}
```

