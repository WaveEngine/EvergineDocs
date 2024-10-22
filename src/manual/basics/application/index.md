# Application

---

![Application Overview](images/evergine_overall.png)

In Evergine, the **Application** class serves as the entry point for your application. It contains all services and exposes the application loop with `DrawFrame()` and `UpdateFrame()` cycles.

Additionally, it offers the [**Container**](container.md) instance, which allows developers to register all services and global functionality to be accessed and bound throughout the entire application (from components, scenes, managers, etc.).

There can be only one instance of the Application class in your Evergine project, and we treat it as a Singleton instance.

| Static Property | Description |
| --- | --- |
| `Application.Current` | A **static property** to access the current Application. It is the most common way to access your application instance from any part of your Evergine classes. |

## In this section
* [Application Container](container.md)
* [Using Application](using_application.md)
* [ScreenContext Manager](screen_context_manager.md)