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


This can occur if the w3wp process has been torn down while you're trying to analyze it. Either take less samples, or just try again (making sure you've got the right process id, if it's been restarted with a new one)


### failed to attach to process The operation completed successfully


    Error: failed to attach to process: System.ComponentModel.Win32Exception (0x80004005): The operation completed successfully
       at Microsoft.Samples.Debugging.CorDebug.CLRMetaHost.EnumerateLoadedRuntimes(Int32 processId)
       at Microsoft.Samples.Debugging.MdbgEngine.MdbgVersionPolicy.GetDefaultAttachVersion(Int32 processId)
       at Microsoft.Samples.Debugging.MdbgEngine.MDbgEngine.Attach(Int32 processId)
       at cpu_analyzer.Program.Main(String[] args) in C:\...\Program.cs:line 201

I don't know why I got this one.



### the state of the thread is invalid



When running for longer, such as this (120 samples, 250ms apart... total 30 seconds of sampling)

	> .\cpu-analyzer.exe 8132 /S 120 /I 250 > output.txt

I often hit this:

	Unhandled Exception: System.Runtime.InteropServices.COMException: The state of the thread is invalid. (Exception from HRESULT: 0x8013132D)
	   at Microsoft.Samples.Debugging.CorDebug.NativeApi.ICorDebugThread3.CreateStackWalk(ICorDebugStackWalk& ppStackWalk)
	   at Microsoft.Samples.Debugging.CorDebug.CorThread.CreateStackWalk(CorStackWalkType type)
	   at Microsoft.Samples.Debugging.MdbgEngine.MDbgV3FrameFactory.<EnumerateFrames>d__0.MoveNext()
	   at Microsoft.Samples.Debugging.MdbgEngine.FrameCache.GetFrame(Int32 index)
	   at Microsoft.Samples.Debugging.MdbgEngine.MDbgThread.EnsureCurrentStackWalker()
	   at Microsoft.Samples.Debugging.MdbgEngine.MDbgThread.get_Frames()
	   at cpu_analyzer.ThreadSnapshot.GetThreadSnapshot(MDbgThread thread) in C:\...\Program.cs:line 104
	   at cpu_analyzer.Program.Main(String[] args) in C:\...\Program.cs:line 212


To avoid this, at line 104 in Program.cs,  I wrapped the foreach in a try/catch

	try
	{
		foreach (MDbgFrame frame in thread.Frames)
		{
			try
			{
				snapshot.StackTrace.Add(frame.Function.FullName);
			}
			catch
			{
				// no frame, so ignore
			}
		}
	}
	catch (COMException)
	{
		//Thread might be in an invalid state apparently...
		//So ignore away
	}

## Source

 * [Diagnosing runaway CPU in a .Net production application](https://samsaffron.com/archive/2009/11/11/Diagnosing+runaway+CPU+in+a+Net+production+application)
 * [jitbit/cpu-analyzer](https://github.com/jitbit/cpu-analyzer)