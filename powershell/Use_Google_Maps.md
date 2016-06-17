# Use Google Maps from the PowerShell


    Install-Module GoogleMap -Scope CurrentUser


That worked great, now let's try and use it....

    
    "White House", "Eiffel Tower" | Get-GeoCoding
    
    You need to register and get an API key and save it as environment variable $env:GoogleGeocode_API_Key = "YOUR API KEY"
    Follow this link and get the API Key - http://developers.google.com/maps/documentation/geocoding/get-api-key
    

So I follow that link... I have to accept some terms and conditions. It sees that I have no projects with google maps, and it auto-creates one called "MyProject"

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

Later in the code it mentions $env:GoogleGeoloc_API_Key -- so I think it needs BOTH set (and the reference to GooglePlaces_API_Key is a bug... you need to set it because of the bug...)

Okay -- I went to that url <https://developers.google.com/maps/documentation/geolocation/get-api-key> and basically enabled the GeoLocation API for the project that I've created at developers.google.com. 

Try 

    Get-GeoLocation

And it returned the address of the house next door.

That is spooky!

What we've sent to google is the first two MAC addresses we could find from set of Wifi access points, it's handed back a lat/long, and then we've asked for an adddress based off that.

What if I modify the code to send *ALL* of the MAC addresses we have?

To do that in isolation I changed this line of code:

    $body = @{wifiAccessPoints = @{macAddress = $($WiFiAccessPointMACAdddress[0])},@{macAddress = $($WiFiAccessPointMACAdddress[1])}}|ConvertTo-Json

    $body = "{`"wifiAccessPoints`":[" + (($WiFiAccessPointMACAdddress | % { "{`"macAddress`": `"$_`"}" }) -join ",`n") + "]"

But the resulting address that was returned was not any more accurate. So I will leave the code as it was.


Okay, moving on to Get-Direction... similar error:


    You need to register and get an API key from below link and have to setup an Environment variable like
    $env:GoogleDirection_API_Key = "YOUR API KEY" to make this function work. You can save this $Env variable in your profile, so
    that it automatically loads when you open powershell console.
    API Key Link - https://developers.google.com/maps/documentation/directions/get-api-key
 
 
Again I visited the URI provided and then all was good.

When I tried:

    Get-Direction -from "250 Adelaide St, Brisbane" -to "30 Mary St, Brisbane" | ft -autosize


One of the directions read:

    Turn right onto Mary StDestination will be on the right

Hmmm. No space between 'St' and 'Destination' -- what is happening there?


I found this method was preparing the text:


    #To Clear unwanted data from the String
    Function Remove-UnwantedString($Str)
    {
        $str = $Str.replace('<div style="font-size:0.9em">','')
        $str = $str.replace('</div>','')
        $str = $str.replace('<b>','')
        $str = $str.replace('</b>','')
        $str = $str.replace('&nbsp;','')
        Return $str
    }

And when I bypassed that method, the result was:

    Turn <b>right</b> onto <b>Mary St</b><div style="font-size:0.9em">Destination will be on the right</div>

So I updated that method to put a single space where that &lt;div... had been.


    #To Clear unwanted data from the String
    Function Remove-UnwantedString($Str)
    {
        $str = $Str.replace('<div style="font-size:0.9em">',' ') # space here
        $str = $str.replace('</div>','')
        $str = $str.replace('<b>','')
        $str = $str.replace('</b>','')
        $str = $str.replace('&nbsp;',' ') # space here
        Return $str
    }

And then I got the result I was expecting.


Finally onto the fun one....


    ("cyberhub, dlf phase 3, Gurgaon" | Get-GeoCoding).Coordinates | Get-NearbyPlace -Radius 3000 -TypeOfPlace bar -Keyword beer


This gave no result at first. It just returned nothing (no error either)

(Perhaps `($status -eq 'OK')` was false?)

I found I had to visit https://developers.google.com/places/web-service/get-api-key

Then it started to work.


Finally, to find local pizza joints....


    (Get-GeoLocation -WithCoordinates).Coordinates | Get-NearbyPlace -Radius 2000 -TypeOfPlace Restaurant -Keyword Pizza | % { $_.Name + " (" + $_.Address + ")" }
    

And nearest beer:
    
    (Get-GeoLocation -WithCoordinates).Coordinates | Get-NearbyPlace -Radius 1000 -TypeOfPlace Bar -Keyword Beer | % Name

returned:

    Pizza Capers (658 Ipswich Road, Annerley)
    Puccini Pizza Pasta Gelati Bar (Shop 2/6 Gapap Street, Tarragindi)
    Mediterranean Flavours - Gourmet Pizza and Pasta (1A 398 Tarragindi Road, Tarragindi) 

    
Fantastic!


## Source

 * Prateek Singh [Powershell Module for Google Map](https://geekeefy.wordpress.com/2016/05/17/powershell-module-for-google-map/)


 