# Storage

If you need an external repository to load your models, images or other type of files, that are required by your application, you can take a look to what _XRV_ offers about files storage. Base class for storage systems is _FileAccess_ class, that can be extended to create specific implementations for a full CRUD access to files in a repository or folder. 

## File access

We provide a set implementations for _FileAccess_ that we are going to enumerate. Following set of methods will be available when using any file access instance from code.

| Method | Description |
| ------ | ------------------- |
| **ClearAsync** | Clears all files and directories. |
| **CreateBaseDirectoryIfNotExistsAsync** | Ensure that base directory defined by _BaseDirectory_ exits. If it does not exists, directory is created. |
| **CreateDirectoryAsync** | Creates a directory, indicated by relative path. |
| **DeleteDirectoryAsync** | Deletes a directory, indicated by relative path. |
| **DeleteFileAsync** | Deletes a file, indicated by relative path. |
| **GetFileAsync** | Gets file contents by relative path. |
| **GetFileItemAsync** | Gets file metadata by relative path. |
| **EnumerateDirectoriesAsync** | Enumerates directories existing in base directory or in a relative directory path. |
| **EnumerateFilesAsync** | Enumerates files existing in base directory or in a relative directory path. |
| **ExistsDirectoryAsync** | Checks if a directory, indicated by relative path, exits or not. |
| **WriteFileAsync** | Writes file contents by relative path. |

### Local application data folder storage
This is implemented by _ApplicationDataFileAccess_, which sets as base path the value of _System.Environment.SpecialFolder.LocalApplicationData_, that can change depending on target platform. If, you create a new file access instance of this type, just set _BaseDirectory_ value to a name for a base directory for that instance. You can use this file access as data cache or to create temporary files needed by your application, but may not be externally available depending on target platform.

```csharp
var fileAccess = new ApplicationDataFileAccess()
{
    BaseDirectory = "my-folder",
};
```
> [!NOTE]
> We use some folders internally, so be careful and do not use a _"cache_" as base directory name.

### Azure Blobs data storage
You can also use _Azure Blob Storage_ as data source to download files required by your application. Only thing you need is to add some storage account configuration settings when instancing a file access of this type. You may find different static methods to create instances, depending on set of configuration data you want to provide.

Please, note that some directory methods may not work for this file access, as _Azure Blob Storage_ does not have the concept of _directory_. When using SAS, remember that you should add appropiate permissions to the token, if you want full CRUD access to blobs.

```csharp
var fileAccess = AzureBlobFileAccess.CreateFromConnectionString("Storage account connection string", "Container name"); //or
var fileAccess = AzureBlobFileAccess.CreateFromUri("https://<ACCOUNT>.blob.core.windows.net/container?sv=2021-08-06&st=2022-11-18T15%3A07%3A20Z&..."); // Container URI containing SAS
var fileAccess = AzureBlobFileAccess.CreateFromConnectionString("https://<ACCOUNT>.blob.core.windows.net/container", "sv=2021-08-06&st=2022-11-18T15%3A07%3A20Z&...");  // Container URI with separated SAS
```

### Azure Files data storage
We have support for other service, _Azure Files_ that you can use. In the same way, you need to specify connection configuration data to make. You may find different static methods to create instances, depending on set of configuration data you want to provide. 

```csharp
var fileAccess = AzureFileShareFileAccess.CreateFromConnectionString("Storage account connection string", "Share name"); //or
var fileAccess = AzureFileShareFileAccess.CreateFromUri("https://<ACCOUNT>.file.core.windows.net/share?sv=2021-08-06&st=2022-11-18T15%3A07%3A20Z&..."); // Share URI containing SAS
var fileAccess = AzureFileShareFileAccess.CreateFromConnectionString("https://<ACCOUNT>.file.core.windows.net/share", "sv=2021-08-06&st=2022-11-18T15%3A07%3A20Z&...");  // Share URI with separated SAS
```

## Disk cache

Any _FileAccess_ can use an optional cache, that will check for files locally instead of downloading them again. To activate caching for a file access, just create an instance of _DiskCache_ and assign it.

```csharp
var fileAccess = AzureFileShareFileAccess.CreateFromUri(...);
fileAccess.Cache = new DiskCache("images"); // indicate an unique cache name for your needs
```

For cache, you can specify following settings.

| Property | Description |
| ------ | ------------------- |
| SizeLimit | Cache size limit. Defaults to 100 MB. |
| SlidingExpiration | Maximum time an item remains in cache without being accessed.  |
