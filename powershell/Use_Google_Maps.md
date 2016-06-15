# Use Google Maps from the PowerShell


    Install-Module GoogleMap -Scope CurrentUser


That worked great, now let's try and use it....

    
    "White House", "Eiffel Tower" | Get-GeoCoding
    
    You need to register and get an API key and save it as environment variable $env:GoogleGeocode_API_Key = "YOUR API KEY"
    Follow this link and get the API Key - http://developers.google.com/maps/documentation/geocoding/get-api-key
    

SO I follow that link... I have to accept some terms and conditions. It sees that I have no projects with google maps, and it auto-creates one called "MyProject"

I receive the key eventually (I have an option to limit the acceptable IPs for this key, but don't take it)

Then in powershell I set the environment variable as requested.

    $env:GoogleGeocode_API_KEY = "...my API key..."    


Thereafter, I try again:


    "White House", "Eiffel Tower" | Get-GeoCoding


    InputAddress : White House
    Address      : The White House, 1600 Pennsylvania Ave NW, Washington, DC 20500, USA
    Country      : United States
    State        : District of Columbia
    PostalCode   : 20500
    Latitude     : 38.8976763
    Longitude    : -77.0365298
    Coordinates  : 38.8976763,-77.0365298

    InputAddress : Eiffel Tower
    Address      : Eiffel Tower, Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France
    Country      : France
    State        : Île-de-France
    PostalCode   : 75007
    Latitude     : 48.8583701
    Longitude    : 2.2944813
    Coordinates  : 48.8583701,2.2944813

Success!

Now I try 

    Get-GeoLocation
    
This one fails with a familiar though slightly different error...


    You need to register and get an API key and save it as environment variable $env:GoogleGeoloc_API_Key = "YOUR API KEY"
    Follow this link and get the API Key - https://developers.google.com/maps/documentation/geolocation/get-api-key

    At C:\Users\Leon\Documents\WindowsPowerShell\Modules\GoogleMap\1.0.0.2\GoogleMap.psm1:703 char:9
    +         Throw "You need to register and get an API key and save it as ...
    +         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        + CategoryInfo          : OperationStopped: (You need to reg...get-api-key
     :String) [], RuntimeException
        + FullyQualifiedErrorId : You need to register and get an API key and save it as environment variable $env:GoogleGeoloc_API
       _Key = "YOUR API KEY"
    Follow this link and get the API Key - https://developers.google.com/maps/documentation/geolocation/get-api-key    

 
i.e. This time it's

GoogleGeoloc_API_Key (not GoogleGeocode_API_Key)

Can I use my geo coding API key?

I try that, but it fails.

Looking at the code itself I see it is checking 

    !$env:GooglePlaces_API_Key
    
So I'll set that!

Later in the code it mentions $env:GoogleGeoloc_API_Key -- so I think it needs BOTH set (and the reference to the first one is a bug)

    
    
## Source

 * Prateek Singh [Powershell Module for Google Map](https://geekeefy.wordpress.com/2016/05/17/powershell-module-for-google-map/)
 
 
 