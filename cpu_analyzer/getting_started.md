# cpu analyzer

This is a tool originally created by Sam Saffron and since forked by jitbit. Available here: <https://github.com/jitbit/cpu-analyzer>

You can use it for profiling .net applications in production, for example for profiling w3wp, profiling iis, profiling asp.net applications. etc..




## Troubleshooting cpu-analyzer


### debuggee and debugger are on incompatible platforms.

    Error: failed to attach to process: System.Runtime.InteropServices.COMException (0x80131C30): The operation failed because debuggee and debugger are on incompatible platforms. (Exception from HRESULT: 0x80131C30)

Meaning:

Probably because you're attempting to attach to a 32 bit process from a 64 bit process.



### A call into a ReadVirtual implementation returned failure

    Unhandled Exception: System.Runtime.InteropServices.COMException: A call into a ReadVirtual implementation returned failure (Exception from HRESULT: 0x80131C49)
       at System.Runtime.InteropServices.Marshal.ThrowExceptionForHRInternal(Int32 errorCode, IntPtr errorInfo)
       at Microsoft.Samples.Debugging.CorDebug.CorStackWalkEx.MoveNextWorker()
       at Microsoft.Samples.Debugging.CorDebug.CorStackWalkEx.MoveNext()
       at Microsoft.Samples.Debugging.MdbgEngine.MDbgV3FrameFactory.<EnumerateFrames>d__0.MoveNext()
       at Microsoft.Samples.Debugging.MdbgEngine.FrameCache.IterateNextFrame()
       at Microsoft.Samples.Debugging.MdbgEngine.FrameCache.GetFrame(Int32 index)
       at Microsoft.Samples.Debugging.MdbgEngine.MDbgThread.EnsureCurrentStackWalker()
       at Microsoft.Samples.Debugging.MdbgEngine.MDbgThread.get_Frames()
       at cpu_analyzer.ThreadSnapshot.GetThreadSnapshot(MDbgThread thread) in C:\..\Program.cs:line 104
       at cpu_analyzer.Program.Main(String[] args) in C:\...\Program.cs:line 212

Line 212 is "var snapshot = ThreadSnapshot.GetThreadSnapshot(thread);"
Line 104 is " foreach (MDbgFrame frame in thread.Frames"


This can occur if the w3wp process has been torn down while you're trying to analyze it. Either take less samples, or just try again (making sure you've got the right process id.)


### failed to attach to process The operation completed successfully


    Error: failed to attach to process: System.ComponentModel.Win32Exception (0x80004005): The operation completed successfully
       at Microsoft.Samples.Debugging.CorDebug.CLRMetaHost.EnumerateLoadedRuntimes(Int32 processId)
       at Microsoft.Samples.Debugging.MdbgEngine.MdbgVersionPolicy.GetDefaultAttachVersion(Int32 processId)
       at Microsoft.Samples.Debugging.MdbgEngine.MDbgEngine.Attach(Int32 processId)
       at cpu_analyzer.Program.Main(String[] args) in C:\...\Program.cs:line 201
   


   https://samsaffron.com/archive/2009/11/11/Diagnosing+runaway+CPU+in+a+Net+production+application