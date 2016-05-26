# Creating a record of all your powershell commands

You can create a transcript of everything you do in powershell via "Start-Transcript"

It will return output such as:

    > start-transcript
    Transcript started, output file is C:\Users\Jack\Documents\PowerShell_transcript.20160526143256.txt

The file will contain every command you type.
    
And when you're done, stop recording with

    > stop-transcript    
    Transcript stopped, output file is C:\Users\Jack\Documents\PowerShell_transcript.20160526143256.txt

And if you run try to Get-Content of that file, before stopping the recording, it will open a wormhole in space and time, and the output becomes the input.

    Get-Content C:\Users\Jack\Documents\PowerShell_transcript.20160526143256.txt
    
...until your hard drive is full, or some other resources is exhausted.


To do all of this in one line try

    stop-transcript; start-transcript | % { $tfile = $_.Replace("Transcript started, output file is ","") }; cat $tfile; stop-transcript