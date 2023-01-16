# Description

You can create your own module, you just need to implemente Module interface.

# Implementation

```csharp
 internal class MyCustomModule : Module
    {
        public override string Name => MyModuleName //Required

        public override MenuButtonDescription HandMenuButton => MyHandMenuButton //Required

        public override TabItem Help => MyHelp //Optional

        public override TabItem Settings => MySettings //Optional

        public override IEnumerable<string> VoiceCommands => MyVoiceCommands //Optional

        public override void Initialize(Scene scene)
        {
            // Do initialize stuff.
        }

        public override void Run(bool turnOn)
        {
            // Do magic happends.
        }
    }

```

# Installation

```csharp
 public MyApplication()
        {
            ....
             var xrv = new XrvService()
                ...
                .AddModule(new MyCustomModule())
            ...
        }
```

# Usage

Open from hand menu
