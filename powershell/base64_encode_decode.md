# Base64 Encode and Decode string

First, from <https://adsecurity.org/?p=478>

Encode:

    $Text = 'This is a secret and should be hidden'
    $Bytes = [System.Text.Encoding]::Unicode.GetBytes($Text)
    $EncodedText =[Convert]::ToBase64String($Bytes)
    $EncodedText

Decode:

    $EncodedText = "VABoAGkAcwAgAGkAcwAgAGEAIABzAGUAYwByAGUAdAAgAGEAbgBkACAAcwBoAG8AdQBsAGQAIABiAGUAIABoAGkAZABlAG4A"
    $DecodedText = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($EncodedText))
    $DecodedText

And a different format from [Lee Holmes (via twitter)](https://twitter.com/Lee_Holmes/status/743112454616403968)

    Format-Hex -Input ([Convert]::FromBase64String("VQBzAGUAIABQAG8AdwBlAHIAUwBoAGUAbABsACEA"))

# Source

 * [PowerShell Encoding & Decoding (Base64)](https://adsecurity.org/?p=478)
 * <https://twitter.com/Lee_Holmes/status/743112454616403968>