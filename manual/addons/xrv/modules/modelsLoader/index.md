# Description

Easy load 3D models onto space from local repository.

![Dragon](images/snapshot2.png)

# Installation

```csharp
 public MyApplication()
        {
            ....
             var xrv = new XrvService()
                ...
                .AddModule(new LoadModelModule()
                {
                    Repositories = new Repository[]
                                    {
                                        new Repository()
                                        {
                                            Name = "Remote Sample Models",
                                            FileAccess = loadModelFileAccess,
                                        }
                                    },
                    NormalizedModelEnabled = true,
                    NormalizedModelSize = 0.2f,
                })
            ...
        }
```

# Usage

Open from hand menu ![hand menu icon](images/addModel.png)

From List select model and click on load button.

![Model list](images/snapshot.png).

You can drag edges for scaling model.

Click on Menu icon to show options ![Menu icon](images/hamburger.png)

- ![lock](images/locked.png) : No further modifications allowed on model.
- ![reset](images/reset.png) : Reset model to original scale.
- ![remove](images/delete.png) : Remove model from scene.
