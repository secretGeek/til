# Is this 64 or 32 bit PowerShell today?


On PowerShell [version](version.md) 4.0 and up:

    [Environment]::Is64BitProcess


More thorough again...

    # Is this a Wow64 powershell host
    function Test-Wow64() {
        return (Test-Win32) -and (test-path env:\PROCESSOR_ARCHITEW6432)
    }

    # Is this a 64 bit process
    function Test-Win64() {
        return [IntPtr]::size -eq 8
    }

    # Is this a 32 bit process
    function Test-Win32() {
        return [IntPtr]::size -eq 4
    }

## Source

 * http://stackoverflow.com/questions/8588960/determine-if-current-powershell-process-is-32-bit-or-64-bit
 
## See Also

 * [Which version of Windows is currently running?](../windows/which_version.md)
 * [which version of Powershell do I have?](version.md)