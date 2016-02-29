# npm tab completion with powershell

want intellisense for npm from within powershell?

In powershell [version](../powershell/version.md) 5:

    Install-Module -Name NPMTabCompletion
    

    Import-Module NPMTabCompletion    

This not only gives you completion for npm commands, it also looks in a local package.json file to see if there are any commands you've specified there.
    

Get this error from Install-Module ?

    Install-Module : A parameter cannot be found that matches parameter name 'Name'.
    
Don't have "install-module?" -- then you need [PsGet](../powershell/install_psget_allow_import_module.md)
    
See also
 * Doug Finke wrote it, here's a blog post on it: http://dougfinke.com/blog/3-ways-to-speed-up-visual-studio-code-extension-development/
 * Here's the source code: https://github.com/dfinke/NPMTabCompletion