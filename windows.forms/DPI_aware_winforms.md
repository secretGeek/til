# DPI Aware Winforms apps

I still struggle with this, but here's my approach currently (2019)

Firstly, in Main():

	if (Environment.OSVersion.Version.Major >= 6)
		SetProcessDPIAware();


Where:


	[DllImport("user32.dll")]
	private static extern bool SetProcessDPIAware();

This code requires these using statements

	using System;
	using System.Runtime.InteropServices;


It may or may not be important to set `AutoScaleMode` of forms to `Dpi` (instead of their default of `Font`).

