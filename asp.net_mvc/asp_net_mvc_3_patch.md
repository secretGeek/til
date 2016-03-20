# Asp.net MVC 3.0.0.0 upgrade to Asp.net MVC 3.0.0.1

At some point ASP.Net MVC 3 was silently upgraded to 3.0.0.1

Hence when I open up some of my older projects from the glory days of MVC 3, I get this warning:


> Warning Could not resolve this reference. Could not locate the assembly "System.Web.Mvc, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=MSIL". Check to make sure the assembly exists on disk. If this reference is required by your code, you may get compilation errors.


And a lot of errors such as :

> Error The name 'View' does not exist in the current context<br />
> Error The name 'ViewBag' does not exist in the current context<br />
> Error The type or namespace name 'ActionResult' could not be found (are you missing a using directive or an assembly reference?)<br />
> Error The type or namespace name 'AuthorizeAttribute' could not be found (are you missing a using directive or an assembly reference?)<br />

The solution is to edit the project file, and replace this line:

    <Reference Include="System.Web.Mvc, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=MSIL" />

With something like this:

    <Reference Include="System.Web.Mvc, Version=3.0.0.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=MSIL" />

And in the Web.Config there is a `bindingRedirect` that redirects MVCs 1 & 2 to MVC 3.... now you need to update it so that it redirects MVC 1, 2 and 3 to 3.0.0.1


    <runtime>
        <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
            <dependentAssembly>
                <assemblyIdentity name="System.Web.Mvc" publicKeyToken="31bf3856ad364e35" />
                <bindingRedirect oldVersion="0.0.0.0-3.0.0.0" newVersion="3.0.0.1" />
            </dependentAssembly>
        </assemblyBinding>
    </runtime>


Also (depending on where you're deploying to) change the Reference to Asp.net MVC such that "Copy Local"  is true.

That results in adding this `Private` tag to the `proj` file.

    <Reference Include="System.Web.Mvc, Version=3.0.0.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=MSIL">
        <Private>True</Private>
    </Reference>

