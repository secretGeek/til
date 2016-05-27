# Creating a record of all your powershell commands

You can create a transcript of everything you do in powershell via "Start-Transcript"

It will return output such as:

    > start-transcript
    Transcript started, output file is C:\Users\Jack\Documents\PowerShell_transcript.20160526143256.txt

The file will contain every command you type.

And when you're done, stop recording with

    > stop-transcript    
    Transcript stopped, output file is C:\Users\Jack\Documents\PowerShell_transcript.20160526143256.txt

And if you try to Get-Content of that file, before stopping the recording, it will open a wormhole in space and time, and the output becomes the input.

    Get-Content C:\Users\Jack\Documents\PowerShell_transcript.20160526143256.txt

...until your hard drive is full, or some other resources is exhausted.




To do all of this in one line try the following:

    stop-transcript; start-transcript | % { $tfile = $_.Replace("Transcript started, output file is ","") }; cat $tfile; stop-transcript


To get the location of the current or most recent transcript file:

    function Get-TranscriptFilePath {
      try {
        $externalHost = $host.gettype().getproperty("ExternalHost",[reflection.bindingflags]"nonpublic,instance").getvalue($host, @())
        $externalhost.gettype().getfield("transcriptFileName", "nonpublic,instance").getvalue($externalhost)
      } catch {
        Write-Warning "This host does not support transcription."
      }
    }

...allegedly. Though so far that only works on half my machines.
    

## External links
 * [Colorize PowerShell Transcript with CSS](http://www.spjeff.com/2014/10/02/colorize-powershell-transcript-with-css/)
 * [Unbounded recursion](http://wiki.secretgeek.net/unbounded-recursion)

