# Messaging

_XRV_ counts with a simple implementation of publisher-subscriber pattern, that will let you communicate two separated parts of code using messages. You can use it in components, services or any other elements if that suits to your needs. You can emit any type of message using this channel, but the recommendation is to create specific message types, that can contain any information that you consider useful.

To emit a message, just create a custom message class and use _Publish_ method.

```csharp
public class MyMessage 
{
    public MyMessage(string data1, int data2) 
    {
        this.Data1 = data1;
        this.Data2 = data2;
    }

    public string Data1 { get; private set; }

    public int Data2 { get; private set; }
}

var pubSub = this.xrvService.Services.Messaging;
var message = new MyMessage("my-data", 1234);
pubSub.Publish(message);
```
\
To receive messages of a given type, you should use _Subscription_ method. It returns a subscription token, that you must save to be able to unsubscribe, depending on your how your code behaves. For example, if you want to use it in a _Component_, the most common pattern will be subscription in _OnAttach/OnActivated_ and desubscribe in _OnDetach/OnDeactivated_.

```csharp
public class MyComponent : Component 
{
    [BindService]
    private XrvService xrvService = null;

    private PubSub pubSub => this.xrvService.Services.Messaging;
    private Guid subscription;

    protected override bool OnAttached()
    {
        bool attached = base.OnAttached();
        if (attached)
        {
            this.subscription = this.pubSub.Subscribe<MyMessage>(this.OnMyMessageReceived);
        }

        return attached;
    }

    protected override void OnDetach()
    {
        base.OnDetach();
        this.pubSub.Unsubscribe(this.subscription);
    }

    private void OnModuleActivationChange(MyMessage message) 
    {
        // Do something
    }
}
```