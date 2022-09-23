# Using Audio from Evergine Studio

![Spatial sounds](images/3dAudioHeader.jpg)

The 3D spatialized audio allows simulate sounds in a 3D environmnet. The goal is to reproduce audio in a way that replicates the way we hear sound in the real world.

Spatial sounds are very useful to simulate environments in _Virtual Reality / Augmented reality_ because this feature added more realism to the experience.

In Evergine there are two components to simulate audio/spatial audio:

| Component  | Description  |
| ----       | ----         |
| **SoundListener3D** | Represents a listener. Usually, this component is used with the camera entity. |
| **SoundEmitter3D** | Represents an emitter. This component can be added to any Entity of your scene to emit a 3D sound. |

## Sound Listener
To add a sound listener component to the main camera, select the camera and click the button on ![plus icon](images/plusIcon.jpg) from **Entity Details** panel and search the component.

![Add listerner component](images/AddSoundListener.jpg)

| Properties | Description |
| ----       | ----        |
| **DopplerFactor** | Changes in frequency of a wave in relation to a listener who is moving relative to the sound emitter. The value is a positive float and the default value is 1.0. |

## Sound Emitter
To add a sound emitter component to any scene entity, select the entity and click the button on![plus icon](images/plusIcon.jpg) from **Entity Details** panel and search the component.

![Add emitter component](images/AddSoundEmitter.jpg)

| Properties | Description |
| ----       | ----        |
| **Audio**      | The audio asset. **_Note. The audio must be mono to work as spatial sound._**|
| **Volume**     | The audio volume. The value is between [0.0-1.0] and the default value is 1.0. |
| **Pitch**      | The quality makes it possible to judge sounds as _higher_ and _lower_ in the sense associated with musical melodies. The value is between [0.0-1.0] and the default value is 1.0.  |
| **IsMuted**    | Indicates whether the emitter is muted or not.  |
| **Distance Scale Factor** | This is only used to calculate the doppler effect on the sound effect. |
| **Play Automatically**    | The emitter starts playing the sound automatically. |
| **Loop**                  | The emitter is playing in loop mode. |
| **Apply3D**               | Indicates whether the position of the emitter with respect to the listener will be used to simulate spatial sound or not. |