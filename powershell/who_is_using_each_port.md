# Who is using each port?

To see if a port is in use, and by which process, use this command:

    > netstat -ano

To filter for a particular port, e.g. 5060

    > netstat -ano | select-string 5060
    TCP    0.0.0.0:5060           0.0.0.0:0              LISTENING       15264
    UDP    0.0.0.0:5060           *:*                                    15264


To see the details of that process id (pid) -- use the famous get-process, as seen in every powershell example ever...

    > get-process -Id 15264

    Handles  NPM(K)    PM(K)      WS(K) VM(M)   CPU(s)     Id ProcessName
    -------  ------    -----      ----- -----   ------     -- -----------
       1079     149   109644     104552   526    30.50  15264 LyncAddOn
