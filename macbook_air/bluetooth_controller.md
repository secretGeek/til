# No bluetooth in Settings -> Devices

And bluetooth generally not present anywhere on the machine.

In device manager:

Other devices -> "Bluetooth USB Host Controller" has a warning icon. And there was no info about the device.
No manufacturer etc.

Trick was to update the drivers and then point it at the "AppleBluetoothBroadcom64" folder -- which I already had from previous times I faced this issue.

Previously I have downloaded all of the BootCamp drivers, and unzipped them to here:


    C:\Users\Leon\Downloads\BootCamp5.1.5640\$WinPEDriver$\AppleBluetoothBroadcom64
    
So I updated the drivers and browsed to that location.

Then it believed that bluetooth was A-OK again.

