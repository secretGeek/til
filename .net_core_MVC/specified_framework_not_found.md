# The specified framework 'Microsoft.NETCore.App', version '1.0.0' was not found.

I knew this day would come...

    $ dotnet YourFirstProduct.dll
    The specified framework 'Microsoft.NETCore.App', version '1.0.0' was not found.
      - Check application dependencies and target a framework version installed at:
          /usr/share/dotnet/shared/Microsoft.NETCore.App
      - The following versions are installed:
          1.1.0
      - Alternatively, install the framework version '1.0.0'.
      
When I look at what packages are installed locally (with 'dot' in their name) I find....

    dpkg --get-selections | grep -v deinstall | grep dot
    
    dotnet-dev-1.0.0-preview2-1-003177              install
    dotnet-host                                     install
    dotnet-hostfxr-1.1.0                            install
    dotnet-sharedframework-microsoft.netcore.app-1.1.0      install
      

Whereas on my ancient (6 month old) linux machine I have:
    
    dpkg --get-selections | grep -v deinstall | grep dot
    
    dotnet-dev-1.0.0-preview2-003121                install
    dotnet-host                                     install
    dotnet-hostfxr-1.0.1                            install
    dotnet-sharedframework-microsoft.netcore.app-1.0.0      install
      
(You can also use `dotnet --version` to see which `dotnet` is installed... but I like the approach above because it tells me more than I need)


Looking into this some more, over at <https://www.microsoft.com/net/download/linux> it says this about the supported and current versions...

    .NET Core 1.0.3 (LTS) (Long-Term-Support)
    Ubuntu 16.04:  sudo apt-get install dotnet-dev-1.0.0-preview2-003156

And

    .NET Core 1.1 (Current)    
    Ubuntu 16.04:  apt-get install dotnet-dev-1.0.0-preview2-003175


(Why is current not the same as what's on the front screen? And why doesn't the current need 'sudo'? ([lodged it with jongalloway via twitter](https://twitter.com/secretGeek/status/823712625942896640) )
    
Putting all these facts together:

    6-months-ago    dotnet-dev-1.0.0-preview2-003121
    "LTS"           dotnet-dev-1.0.0-preview2-003156
    "current"       dotnet-dev-1.0.0-preview2-003175
    Yesterday       dotnet-dev-1.0.0-preview2-1-003177

    
    
I think I want to install that older one, the LTS version (1.0.3) 

So I run this:

    sudo apt-get install dotnet-dev-1.0.0-preview2-003156


After that it seems to work okay.



====


On a "more recent" machine with (hopefully) .net core 2.2 I see:


$ dpkg --get-selections | grep -v deinstall | grep dot
dotnet-host                                     install
dotnet-hostfxr-2.2                              install
dotnet-runtime-2.2                              install
dotnet-runtime-deps-2.2                         install
dotnet-sdk-2.2                                  install

