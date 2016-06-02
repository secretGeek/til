# Sample scripts for dumb or fun ideas...


## Fractals

A mandelbrot one liner:

    $i=$j=$r=$x=$y=[float]-16; while(($y++) -lt 15) {for($x=0; ($x++) -lt 84; write-host (" .:-;!/>')|&IH%*#"[$k -band 15]) -nonewline){$i=$k=$r=[float]0;do{$j=$r*$r-$i*$i-2+$x/25;$i=2*$r*$i+$y/10;$r=$j} while (($j*$j+$i*$i) -lt 11 -band ($k++) -lt 111)}" "}

Which produces output like:

    :::::::::::::------------------------------------------------:::::::::::::::::::::::
    :::::::::--------------------------------------------------------:::::::::::::::::::
    :::::----------------------------------;;;;;;;;;;;-------------------:::::::::::::::
    :::-----------------------------;;;;;;;;;;;;;;;;;;;;;;;;---------------:::::::::::::
    ---------------------------;;;;;;;;;;;;;!!!/-H//!!!;;;;;;;;---------------::::::::::
    ------------------------;;;;;;;;;;;;;!!!!//>'&*|I /!!!;;;;;;;;--------------::::::::
    --------------------;;;;;;;;;;;;;!!!!!!//>')|:* |'>//!!!!;;;;;;;--------------::::::
    ----------------;;;;;;;;;;;;;!!!!!!////>>'|-    /-|>>///!!!!;;;;;--------------:::::
    ------------;;;;;;;;;;;;!!!!!!!//>')I'')||I      H&))'>>>>*/!!;;;;;-------------::::
    --------;;;;;;;;;;!!!!!!!!!!///>>)H-   |             .IH&*I >!!;;;;;-------------:::
    -----;;;;;;;;;!!!!///////////>>'|:H-                      I'>/!!;;;;;-------------::
    -;;;;;;;;;;!!!!/>||'>>''''>>'')|%.                        %|&>/!!;;;;--------------:
    ;;;;;;;;!!!!!//>>)&.-!I*;H &||&>                           *)>/!!;;;;;--------------
    ;;;;;!!!!!///>>')IH-;                                       &//!!;;;;;--------------
    !!!!/////>>>')H%:**           *                            )>/!!!;;;;;;-------------
                                                            .&)>//!!!;;;;;;-------------
    !!!!/////>>>')H%:**           *                            )>/!!!;;;;;;-------------
    ;;;;;!!!!!///>>')IH-;                                       &//!!;;;;;--------------
    ;;;;;;;;!!!!!//>>)&.-!I*;H &||&>                           *)>/!!;;;;;--------------
    -;;;;;;;;;;!!!!/>||'>>''''>>'')|%.                        %|&>/!!;;;;--------------:
    -----;;;;;;;;;!!!!///////////>>'|:H-                      I'>/!!;;;;;-------------::
    --------;;;;;;;;;;!!!!!!!!!!///>>)H-   |             .IH&*I >!!;;;;;-------------:::
    ------------;;;;;;;;;;;;!!!!!!!//>')I'')||I      H&))'>>>>*/!!;;;;;-------------::::
    ----------------;;;;;;;;;;;;;!!!!!!////>>'|-    /-|>>///!!!!;;;;;--------------:::::
    --------------------;;;;;;;;;;;;;!!!!!!//>')|:* |'>//!!!!;;;;;;;--------------::::::
    ------------------------;;;;;;;;;;;;;!!!!//>'&*|I /!!!;;;;;;;;--------------::::::::
    ---------------------------;;;;;;;;;;;;;!!!/-H//!!!;;;;;;;;---------------::::::::::
    :::-----------------------------;;;;;;;;;;;;;;;;;;;;;;;;---------------:::::::::::::
    :::::----------------------------------;;;;;;;;;;;-------------------:::::::::::::::
    :::::::::--------------------------------------------------------:::::::::::::::::::
    :::::::::::::------------------------------------------------:::::::::::::::::::::::    
    
    
...from WaiKin Kong, in 2006, shared here: [Mandelbrot One-liner](https://blogs.msdn.microsoft.com/powershell/2006/12/28/mandelbrot-one-liner/)

A less condensed version, from [poshcode, by user Zefram](http://poshcode.org/5845) which writes colored squares.

    $i=[float]-16;
    $j=[float]-16;
    $r=[float]-16;
    $x=[float]-16;
    $y=[float]-16;

    #Color Array
    $colors="Black","DarkBlue","DarkGreen","DarkCyan","DarkRed","DarkMagenta","DarkYellow","Gray","DarkGray","Blue","Green","Cyan","Red","Magenta","Yellow","White" 

    while(($y++) -lt 15) 
    { 
        for($x=0; ($x++) -lt 70; Write-Host " " -BackgroundColor ($colors[$k -band 15]) -NoNewline) 
            { 
                #Zero
                $i=[float]0;
                $k=[float]0;
                $r=[float]0; 
                do
                {
                    #Explain to PowerShell what a complex number looks like because computers are basally stupid.
                    $j=$r*$r-$i*$i-2+$x/25; $i=2*$r*$i+$y/10; $r=$j
                }
                #Make sure the fractal doesn't draw to infinity
                while (($j*$j+$i*$i) -lt 4 -band ($k++) -lt 111) 
            } 
        Write-Host " "
    }



## Emojis


    Install-Module -Name Emojis -Scope CurrentUser -Force;
    Get-Command -Module Emojis -CommandType All;
    Get-Emoji -Name airplane, ambulance;
    emoji airplane | scb;
    
From: [Emojis in PowerShell? Yes!](https://artofshell.com/2016/04/emojis-in-powershell-yes/)    


## Cowsay

Based on Tony Monroe's original Unix terminal program cowsay

See:

1. [Posh-Cowsay](https://github.com/kanej/Posh-Cowsay) "A shell cannot be called civilised until it has a talking cow."
2. [Luke Sampson's implementation](http://blog.lukesampson.com/cowsay-in-powershell)


## Speech Synthesis


    Add-Type -AssemblyName System.Speech;
    $synth = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer;
    $message = "Hello. Is there anybody OUT there? Is there anyone at home?";
    $synth.speak($message);
    $synth.Dispose();

## Beautiful music


From [Luiz Henrique Lima Campos](https://blogs.technet.microsoft.com/wikininjas/2013/11/13/wiki-life-geek/), quoted here: ["Music from the Command Line": Performed by Powershell](http://social.technet.microsoft.com/wiki/contents/articles/20989.music-from-the-command-line-performed-by-powershell.aspx), though maybe previously from [Jeff Wouters](http://jeffwouters.nl/index.php/2012/03/get-your-geek-on-with-powershell-and-some-music/)

    [console]::beep(440,500)       
    [console]::beep(440,500) 
    [console]::beep(440,500)        
    [console]::beep(349,350)        
    [console]::beep(523,150)        
    [console]::beep(440,500)        
    [console]::beep(349,350)        
    [console]::beep(523,150)        
    [console]::beep(440,1000) 
    [console]::beep(659,500)        
    [console]::beep(659,500)        
    [console]::beep(659,500)        
    [console]::beep(698,350)        
    [console]::beep(523,150)        
    [console]::beep(415,500)        
    [console]::beep(349,350)        
    [console]::beep(523,150)        
    [console]::beep(440,1000)

