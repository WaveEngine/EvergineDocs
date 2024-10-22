# Storage

If you need an external repository to load your models, images, or other types of files required by your application, you can take a look at what _XRV_ offers regarding file storage. The base class for storage systems is the _FileAccess_ class, which can be extended to create specific implementations for full CRUD access to files in a repository or folder.

## File Access

We provide a set of implementations for _FileAccess_ that we will enumerate. The following set of methods will be available when using any file access instance from code.

| Method | Description |
| ------ | ------------------- |
| **ClearAsync** | Clears all files and directories. |
| **CreateBaseDirectoryIfNotExistsAsync** | Ensures that the base directory defined by _BaseDirectory_ exists. If it does not exist, the directory is created. |
| **CreateDirectoryAsync** | Creates a directory, indicated by a relative path. |
| **DeleteDirectoryAsync** | Deletes a directory, indicated by a relative path. |
| **DeleteFileAsync** | Deletes a file, indicated by a relative path. |
| **GetFileAsync** | Gets file contents by relative path. |
| **GetFileItemAsync** | Gets file metadata by relative path. |
| **EnumerateDirectoriesAsync** | Enumerates directories existing in the base directory or a relative directory path. |
| **EnumerateFilesAsync** | Enumerates files existing in the base directory or a relative directory path. |
| **ExistsDirectoryAsync** | Checks if a directory, indicated by a relative path, exists or not. |
| **WriteFileAsync** | Writes file contents by relative path. |

### Local Application Data Folder Storage

This is implemented by _ApplicationDataFileAccess_, which sets the base path to the value of _System.Environment.SpecialFolder.LocalApplicationData_, which can change depending on the target platform. If you create a new file access instance of this type, just set the _BaseDirectory_ value to a name for a base directory for that instance. You can use this file access as a data cache or to create temporary files needed by your application. However, these files may not be externally available depending on the target platform.

```csharp
var fileAccess = new ApplicationDataFileAccess()
{
    BaseDirectory = "my-folder",
};
```
> [!NOTE]
> We use some folders internally, so be careful and do not use _"cache"_ as the base directory name.

### Azure Blob Data Storage

You can also use _Azure Blob Storage_ as a data source to download files required by your application. The only thing you need to do is add some storage account configuration settings when instantiating a file access of this type. You may find different static methods to create instances, depending on the set of configuration data you want to provide.

Please note that some directory methods may not work for this file access, as _Azure Blob Storage_ does not have the concept of _directories_. When using SAS, remember that you should add appropriate permissions to the token if you want full CRUD access to blobs.

```csharp
var fileAccess = AzureBlobFileAccess.CreateFromConnectionString("Storage account connection string", "Container name"); //or
var fileAccess = AzureBlobFileAccess.CreateFromUri("https://<ACCOUNT>.blob.core.windows.net/container?sv=2021-08-06&st=2022-11-18T15%3A07%3A20Z&..."); // Container URI containing SAS (or without SAS for public containers, if you need read-only operations)
var fileAccess = AzureBlobFileAccess.CreateFromConnectionString("https://<ACCOUNT>.blob.core.windows.net/container", "sv=2021-08-06&st=2022-11-18T15%3A07%3A20Z&...");  // Container URI with separated SAS
```

### Azure Files Data Storage

We also support another service, _Azure Files_, that you can use. Similarly, you need to specify connection configuration data. You may find different static methods to create instances, depending on the set of configuration data you want to provide.

```csharp
var fileAccess = AzureFileShareFileAccess.CreateFromConnectionString("Storage account connection string", "Share name"); //or
var fileAccess = AzureFileShareFileAccess.CreateFromUri("https://<ACCOUNT>.file.core.windows.net/share?sv=2021-08-06&st=2022-11-18T15%3A07%3A20Z&..."); // Share URI containing SAS
var fileAccess = AzureFileShareFileAccess.CreateFromConnectionString("https://<ACCOUNT>.file.core.windows.net/share", "sv=2021-08-06&st=2022-11-18T15%3A07%3A20Z&...");  // Share URI with separated SAS
```

## Disk Cache

Any _FileAccess_ can use an optional cache, which will check for files locally instead of downloading them again. To activate caching for a file access, just create an instance of _DiskCache_ and assign it.

```csharp
var fileAccess = AzureFileShareFileAccess.CreateFromUri(...);
fileAccess.Cache = new DiskCache("images"); // indicate a unique cache name for your needs
```

For caching, you can specify the following settings.

| Property | Description |
| ------ | ------------------- |
| SizeLimit | Cache size limit. Defaults to 100 MB. |
| SlidingExpiration | Maximum time an item remains in cache without being accessed. |
