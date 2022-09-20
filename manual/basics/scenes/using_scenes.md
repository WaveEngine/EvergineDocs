# Using Scenes

For loading and launching a **Scene** from code we have to use **ScreenContextManager** and understand the concept of **ScreenContexts**.

### ScreenContext

A **ScreenContext** represents a list of **Scenes** that can be simultanously loaded in the application at the same time. 

![ScreenContext](images/ScreenContext.png)

>[!NOTE]
> For example, this the diagram above depicts a **ScreenContext** containing two scenes: _MainScene_ for the application logic, and _UIScene_ another one just the **UI**.

### ScreenContextManager
**ScreenContextManager** is a [Service](../services.md) that manages the **Scene navigation** between scenes or, more accurately, **ScreenContext**.
Its main methods are:

| Method | Description | 
| ------ | ----------- |
| To   |  Navigating to a new **ScreenContext**  (passed by parameter), replacing the previous **ScreenContext.** |
| Push |  Navigtes to a new **ScreenContext** but keeps the previous one in a stack so we can restore later.
| Pop  |  Removes the current **ScreenContext** and restores the previous stacked one. 
| FindContextByName | For searching among the **ScreenContext** list.

So loading and navigating to a **Scene** by code would be like this (this code is placed in the **Application** class):

```csharp

// Loads the scenes. will create MyScene and UIScene objects which should be existing classes that intherit Scene class.
// These scenes are populated with all entities defined in its respectives assets (MainScene.wescene and UIScene.wescene)

var baseScene = assetsService.Load<MyScene>(EvergineContent.Scenes.MainScene_wescene);
var uiScene = assetsService.Load<UIScene>(EvergineContent.Scenes.UIScene_wescene);

// Creates a context and navigate to it.
ScreenContext screenContext = new ScreenContext(scene, uiScene);
screenContextManager.To(screenContext);

```
For more details read the [ScreenContextManager](../application/screen_context_manager.md) section.