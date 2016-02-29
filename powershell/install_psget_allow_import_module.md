# Install PsGet so that "import-Module" and "install-module" will work

    (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex


See http://psget.net/