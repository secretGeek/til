# Test if windows is using light/dark theme

This is not yet battle tested

	//using Microsoft.Win32
	public bool WindowsIsUsingDarkTheme()
	{
		var keyName = @"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize";
		var valueName = "AppsUseLightTheme";
		var value = Registry.GetValue(keyName, valueName, null);
		if (value == null)
		{
			return false;
		}
		
		if (int.TryParse(value.ToString(), out int result)){
			return result == 0;
		}
		
		return false;
	}

Source: https://gist.github.com/secretGeek/fa0ea0039f0c5eaa7d122fe569fa2b44