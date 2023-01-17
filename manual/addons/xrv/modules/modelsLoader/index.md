# Description

Easy load 3D models onto space from local repository.

![Dragon](images/snapshot2.png)

You can add several repositories from different places.

| Properties               | Description                                                                        |
| ------------------------ | ---------------------------------------------------------------------------------- |
| `NormalizedModelEnabled` | If true will override original scale of the model and set the same for all models. |
| `NormalizedModelSize`    | Size in meters for models when loaded                                              |

Repository:

| Properties   | Description                                     |
| ------------ | ----------------------------------------------- |
| `Name`       | This name will be displayed on model load list. |
| `FileAccess` | Access policy for folders                       |

# Installation // TODO

# Instantiate from code

```csharp
// Find XrvService instantiation...

var xrv = new XrvService()
.AddModule(new LoadModelModule()
{
    Repositories = new Repository[]
                    {
                        new Repository() // Define repository
                        {
                            Name = "Remote Sample Models",
                            FileAccess = loadModelFileAccess,
                        }
                    },
    NormalizedModelEnabled = true,
    NormalizedModelSize = 0.2f,
})
```

# Usage

Open from hand menu ![hand menu icon](images/addModel.png)

## Open

From List select model and click on load button.

![Model list](images/snapshot.png).

## Menu

Click on Menu icon to show options ![Menu icon](images/hamburger.png)

![Menu open](images/menuOpen.png)

- ![lock](images/locked.png) : No further modifications allowed on model.
- ![reset](images/reset.png) : Reset model to original scale.
- ![remove](images/delete.png) : Remove model from scene.

## Manipulation

By using manipulators can move, scale and rotate models.
Manipulators are shown over bounding box.

![Manipulators](images/manipulators.png)

- Red : Scale, pinch on corners and drag for scale model.
- Green : Roll, pinch on upper middle manipulator and drag for roll rotation.
- Blue : Pitch, pinch on side middle manipulator and drag for pitch rotation.
- Pink : stretch, pinch on center manipulator and drag for stretch scale.
