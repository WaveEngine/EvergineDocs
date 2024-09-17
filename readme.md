# EvergineDocs

## Dev

Local compilation:

```pwsh
.\scripts\create_docfx_api_config.ps1 [-evergineFolder "../Engine"]
.\scripts\local_build.ps1 [-evergineFolder "../Engine"]
```

Generated documentation can be found at `build/dist` and can be served with any static file server.
