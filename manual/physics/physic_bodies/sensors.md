# Sensors

If you set a physic body to be a sensor, other bodies no longer bump into it. Instead, they pass through.

The sensor detects when other bodies enter it, which you can use in your application. For example, you can detect when a the user finger touch a button, and use it to launch an action.

![Sensor Bodies](images/sensors.gif)


## Sensor properties

Every physic body (static, rigid or character) can be set to sensor with the **IsSensor** property:

| Property | Default | Description |
| --- | --- | --- |
| **IsSensor** | false | If you set a physic body to be a sensor, other colliders no longer bump into it. Instead, they pass through. Sensors detects when bodies enter it, which you can use in your application. |