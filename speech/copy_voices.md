# Make Windows Mobile Text-to-Speech voices available for System.Speech.Synthesis

Okay, thanks to reddit comment from a 'Pessimist__Prime' (details below) I found a way to enable some more voices on my (Win 8+) machine, without installing anything else.

Under text-to-speech settings I could see various voices (such as "Microsoft James Mobile") but these voices were not visible when calling `synth.GetInstalledVoices` (where `synth = new System.Speech.Synthesis.SpeechSynthesizer()`).

However, by copying some details from:

    HKLM:\software\Microsoft\Speech_OneCore\Voices\Tokens
    
to both these locations:

    HKLM:\SOFTWARE\Microsoft\Speech\Voices\Tokens
    HKLM:\SOFTWARE\WOW6432Node\Microsoft\SPEECH\Voices\Tokens
    
...all of the installed voices became available.

Here's the script for performing the copy, provided by Pessimist__Prime at reddit:
    
    $sourcePath = 'HKLM:\software\Microsoft\Speech_OneCore\Voices\Tokens'           # Where OneCore voices live
    $destinationPath = 'HKLM:\SOFTWARE\Microsoft\Speech\Voices\Tokens'              # For 64-bit apps
    $destinationPath2 = 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\SPEECH\Voices\Tokens' # For 32-bit apps
    cd $destinationPath
    $listVoices = Get-ChildItem $sourcePath
    foreach($voice in $listVoices)
    {
        $source = $voice.PSPath #Get the path of this voices key
        copy -Path $source -Destination $destinationPath -Recurse
        copy -Path $source -Destination $destinationPath2 -Recurse
    }

## Source

 * [If you use VoiceAttack, EDDI or any other Text-To-Speech program - and you are on Windows 10, you can install the 'Microsoft Mobile Voices' for more variety](https://www.reddit.com/r/EliteDangerous/comments/5d02vv/if_you_use_voiceattack_eddi_or_any_other/)
 