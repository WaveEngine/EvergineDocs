# Networking

With networking extension you will be able to establish a client-server communication channel along any processes running Evergine. Those processes could live in the same computer or in different devices connected to a local network.

This extension relies in [a fork of Lidgren.Network](https://github.com/EvergineTeam/lidgren-network-gen3) library, that will be in charge of in-process communication using sockets, with _server-client_ and _client-client_ messages delivering.

## Install Evergine.Networking extension

To start using this extension, just add Evergine.Networking package to your project using NuGet package manager from Visual Studio.

```xml
<PackageReference Include="Evergine.Networking" Version="2021.11.17.2-preview" />
```

## Server configuration
To create a networking server, you should make use of built-in service named _MatchmakingServerService_. This service is part of the extension and manages server rooms, players and provides different events that you can use to be notified when a player (client) connects or disconnects from the server, joins or leaves a room, etc. For a complete list of events, take a look to [_MatchmakingServerService_ API documentation](~/api/Evergine.Networking.Server.MatchmakingServerService.html).

Just register _MatchmakingServerService_ in Evergine dependencies container to start using it.

```csharp
this.Container.RegisterInstance(new MatchmakingServerService());
``` 

_MatchmakingServerService_ has a set of properties that you should use to configure your server settings. Some considerations here:
- It's recommended to not use big values for _PingInterval_ and _ConnectionTimeout_ values. Also, _ConnectionTimeout_ may be a multiple of _PingInterval_. Values of 4 and 8 seconds, respectively, would be fine, depending on your requirements. 
- Set a value for _ApplicationIdentifier_ that you could easily identify. For example, your application name.
- Set a version value for _ClientApplicationVersion_.

```csharp
this.matchmakingServerService.PingInterval = 4;
this.matchmakingServerService.ConnectionTimeout = 8;
this.matchmakingServerService.ApplicationIdentifier = "MyApp";
this.matchmakingServerService.ClientApplicationVersion = "1.0.0";
this.matchmakingServerService.ServerName = "MyServer";
```

> [!Note]
> An exception for setting bigger values for _ConnectionTimeout_ would be debugging. When a break point is hit, time will be still running and you could find clients getting disconnected. To avoid problems while developing, you can set _ConnectionTimeout_ to a temporary value of TimeSpan.FromHours(1), for example, to have enough time while debugging.

### Start a server

Once you have your server configured it's time to start it, to make it able to receive incoming client connections.

```csharp
int port = 12345;
await this.matchmakingServerService.StartAsync(port);
```

Our recommendation is to create a custom [Service](~/api/Evergine.Framework.Services.Service.html) or component to contain all server initialization code, and also make use of _MatchmakingServerService_ to log events, very useful for debugging purposes.

```csharp
this.matchmakingServerService.PlayerConnected += this.MatchmakingServerService_PlayerConnected;
this.matchmakingServerService.PlayerDisconnected += this.MatchmakingServerService_PlayerDisconnected;
this.matchmakingServerService.PlayerJoining += this.MatchmakingServerService_PlayerJoining;
this.matchmakingServerService.PlayerJoined += this.MatchmakingServerService_PlayerJoined;
this.matchmakingServerService.PlayerLeaving += this.MatchmakingServerService_PlayerLeaving;
this.matchmakingServerService.PlayerLeft += this.MatchmakingServerService_PlayerLeft;
this.matchmakingServerService.RoomCreated += this.MatchmakingServerService_RoomCreated;
this.matchmakingServerService.RoomDestroyed += this.MatchmakingServerService_RoomDestroyed;

// ...

private async void MatchmakingServerService_PlayerJoined(object sender, ServerPlayer e)
{
    var numberOfClients = this.matchmakingServerService.AllConnectedPlayers.Count();
    Debug.WriteLine($"A client just joined: {e.Nickname}. There are {numberOfClients} clients");
}
```

## Clients configuration
In case of clients, built-in service is _MatchmakingClientService_. As we did for server side, you should register this service in dependencies container. For client settings, check that you apply same values as those provided for server side.

```csharp
this.Container.RegisterInstance(new MatchmakingClientService());

// ...

this.matchmakingClientService.PingInterval = 4;
this.matchmakingClientService.ConnectionTimeout = 8;
this.matchmakingClientService.ApplicationIdentifier = "MyApp";
this.matchmakingClientService.ClientApplicationVersion = "1.0.0";
```

> [!Note]
> When creating a server, you would probably also want register your own process as client of that server. This is, use _MatchmakingClientService_ to connect to the server that you have already created, as a common scenario where one of the clients acts as server at the same time.


### Server discovery
Networking extension provides a way of automatic discovery of servers, always that local network infraestructure has broadcast traffic available. To discover a server, make use of following line, using the same port that you configured for your server. Once a server is discovered, _ServerDiscovered_ event will be raised. 

```csharp
this.matchmakingClientService.ServerDiscovered += this.MatchmakingClientService_ServerDiscovered;

// ...
int port = 12345;
this.matchmakingClientService.DiscoverServers(port);

// ...
private async void MatchmakingClientService_ServerDiscovered(object sender, HostDiscoveredEventArgs e)
{
    var connected = await this.matchmakingClientService.ConnectAsync(e.Host);
    Debug.WriteLine($"Connected to server {e.ServerName}.");
}
```

> [!Note]
> You must ensure your server can be reached by clients in the network. Some platforms, like _UWP_ would require extra configuration at application level for security reasons. In case of this platform, [capabilities](https://docs.microsoft.com/en-us/windows/uwp/packaging/app-capability-declarations) and, depending on your scenario, even review the [application isolation](https://docs.microsoft.com/en-us/windows/uwp/communication/interprocess-communication).

## Joining to a server room
After connecting to a server, the next step is joining a room. Clients in the same room can share information to update their states, depending on your application requirements.

```csharp
var roomOptions = new RoomOptions()
{
    RoomName = "MyRoom",
};
var joinResult = await this.matchmakingClientService.JoinOrCreateRoomAsync(roomOptions);
```

Once you have joined to a room, _MatchmakingClientService_ will update its _CurrentRoom_ property with room information, including the list of connected clients (players). You can use this information, for example, to display list of room partipants in your client application.

## Messages delivery

With an existing client-server connection, you can now send information in both directions, or even to other client applications within the network. There are two mechanisms to do this. With first one, _messages_, you are free to create a network message by your own, writing scalar fields in a buffer. The second one are the _network properties_, and they are very useful as their values will be automatically synchronized for all connected clients.

### Messages

Both _MatchmakingServerService_ and _MatchmakingClientService_ provide some methods to send messages to different peers in the network.

For _MatchmakingServerService_ you have:
- _SendToClient_: sends a message to a destination client.

For _MatchmakingClientService_ you have:
- _SendToCurrentRoom_: sends a message to all clients connected to the room.
- _SendToPlayer_: sends a message to a single player in the room.
- _SendToServer_: sends a message from a client to the server.

For example, we can send a _"hello"_ message from a client to another with something line the following.

```csharp
// client A sends hello message
var message = this.matchmakingClientService.CreateMessage();
message.Write("hello!");
this.matchmakingClientService.SendToPlayer(message, player, DeliveryMethod.ReliableOrdered);

// client B listens for incoming messages
this.matchmakingClientService.MessageReceivedFromPlayer += this.Client_MessageReceivedFromPlayer;

private void Client_MessageReceivedFromPlayer(object sender, MessageFromPlayerEventArgs e)
{
    var message = e.ReceivedMessage.ReadString();
    Debug.WriteLine($"Received '{message}'");
}
```

### Network properties

Network properties are a set of components provided by _Evergine.Networking_ extension. There are two ways properties can be stored and shared for members inside a room: _room_ properties, that will be shared at room level; and _player_ (client) properties, that will be attached to clients connected to a room.

As they are components, you can add it to any of the entities of your scene. Network properties require the existence of a properties provider for component owner or its ascendants. Depending of the type of property you want to use, you need to ensure that a component of type _NetworkRoomProvider_ or _NetworkPlayerProvider_ is placed somewhere in entity hierarchical path. This can be done manually using Evergine Studio and adding the component manually, or doing it programatically.

Network properties maintain an internal table of key-values to store information. There is also a size limitation for this tables: table key type is byte, so you can't have more than 256 properties for a room or for each single client (player). In _Evergine.Networking.Components_ namespace you can find a set of built-in components to work with network properties of more common scalar data types and structs like numbers, strings, vectors, etc.

#### Properties synchronization

For example, imagine that we want to have an object in our scene that can be manipulated by one of the clients (move, scale and rotate it). We also want all the clients connected to the room to see those transformations. In this case, the best option is to use a network property to synchronize entity transform.

Below you will find a block of code to see how it works, but lets see a few notes before:
- It's recommended to have a centralized enum to have an easier control of what room properties are already in use, and avoid using same key for different synchronization properties.
- We have used a _NetworkMatrix4x4PropertySync_ component because we want to synchronize transform information, but there are many other built-in properties.
- In this case, we are using a _room_ provider, but remember that you could also have specific properties for clients connected to the room. In that case, you should use _NetworkPropertyProviderFilter.Player_.
- Method _OnPropertyReadyToSet_ will be invoked once internal key-value table is ready to be synchronized. This will also change _IsReady_ property to a value of _true_. You should always check this property before trying to set a network property value.
- Method _OnPropertyRemoved_ will be invoked if property is removed from shared table.
- Method _OnPropertyAddedOrChanged_ will be invoked once property is ready or someone within the room has changed its value.
- To update a property value, just need to set _PropertyValue_ value, as stated in _UpdatePropertyValue_ method.

```csharp
public enum RoomProperties : byte
{
    MyObjectTransform      = 0x00,
}

public class SyncLocalTransform : NetworkMatrix4x4PropertySync<RoomProperties>
{
    [BindComponent(source: BindComponentSource.Owner)]
    private Transform3D transform3d = null;

    public SyncLocalTransform()
    {
        this.ProviderFilter = NetworkPropertyProviderFilter.Room;
        this.PropertyKey = RoomProperties.MyObjectTransform;
    }

    // We should determine somehow if current client can manipulate the object or
    // not, as only one at the same time should do it.
    public bool CanManipulate { get; set; }

    protected override bool OnAttached()
    {
        this.transform3d = this.Owner.FindComponent<Transform3D>();
        this.transform3d.LocalTransformChanged += this.Transform3D_LocalTransformChanged;

        return base.OnAttached();
    }

    protected override void OnDetach()
    {
        this.transform3d.LocalTransformChanged -= this.Transform3D_LocalTransformChanged;
        base.OnDetach();
    }

    protected override void OnPropertyAddedOrChanged()
    {
        if (!this.CanManipulate)
        {
            this.transform3d.LocalPosition = this.PropertyValue.Translation;
            this.transform3d.LocalScale = this.PropertyValue.Scale;
            this.transform3d.LocalRotation = this.PropertyValue.Rotation;
        }
    }

    protected override void OnPropertyRemoved()
    {
    }

    protected override void OnPropertyReadyToSet()
    {
        base.OnPropertyReadyToSet();
        this.UpdatePropertyValue();
    }

    private void Transform3D_LocalTransformChanged(object sender, EventArgs e) =>
        this.UpdatePropertyValue();

    private void UpdatePropertyValue()
    {
        if (this.IsReady && this.CanManipulate)
        {
            this.PropertyValue = this.transform3d.LocalTransform;
        }
    }
}
```

#### Synchronization of complex properties

_Evergine.Networking_ extension provides properties for more common scalars and structs but, what if we want to synchronize data of custom class. We can do it, but always keep in mind that is not recommendable to have big objects saved in internal key-value tables, as this will affect to memory consumption and network traffic bandwidth. In any case, we should implement some methods of _INetworkSerializable_ to achieve this.

For this example, imagine that our application has a map and we want to control the center and zoom level of that map. _INetworkSerializable_ requires you to implement two methods, one for data serialization and other for data deserialization. Only thing that you need to remember is that you should read data in the same order as you wrote it.

```csharp
public class MapInfo : INetworkSerializable
{
    public Coordinates Center { get; set; }

    public short ZoomLevel { get; set; }

    public void Write(NetBuffer buffer)
    {
        buffer.Write(this.Center.Latitude);
        buffer.Write(this.Center.Longitude);
        buffer.Write(this.ZoomLevel);
    }

    public void Read(NetBuffer buffer)
    {
        var lat = buffer.ReadDouble();
        var lng = buffer.ReadDouble();
        this.Center = new Coordinates(lat, lng);
        this.ZoomLevel = buffer.ReadInt16();
    }

    public struct Coordinates
    {
        public Coordinates(double latitude, double longitude)
        {
            this.Latitude = latitude;
            this.Longitude = longitude;
        }

        public double Latitude { get; }

        public double Longitude { get; }
    }
}

public class SyncMapInfo : NetworkSerializablePropertySync<RoomProperties, MapInfo> 
{
    public SyncMapInfo()
    {
        this.ProviderFilter = NetworkPropertyProviderFilter.Room;
        this.PropertyKey = RoomProperties.MapInfo;
    }

    // ...
    protected override void OnPropertyAddedOrChanged() 
    {
        if (this.IsReady) 
        {
            MapInfo info = this.PropertyValue;
            // Do something with this, like updating the map
        }
    }
}
```