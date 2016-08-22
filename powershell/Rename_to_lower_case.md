# Rename all files and folders to lower case


For the files....

    Get-ChildItem -recurse |
        Where {-Not $_.PSIsContainer} |
        Rename-Item -NewName {
            $_.FullName.ToLowerInvariant()
        }

For the folders....

    #Get the directories / sub directories and rename to lowercase
    Get-ChildItem -recurse | 
        ?{ $_.PSIsContainer -And $_.Name -CMatch "[A-Z]" } | 
        %{
            $NName = $_.Name.ToLowerInvariant()

            # Set temporary name to enable rename to the same name; Windows is not case sensitive
            $TempItem = Rename-Item -Path $_.FullName -NewName "x$NName" -PassThru
            
            Rename-Item -Path $TempItem.FullName -NewName $NName
        }
    
## Source
 * [script from  stuartfromnz](https://social.technet.microsoft.com/Forums/office/en-US/7241cee3-779b-4741-ba16-dbbaefb52d69/powershell-script-to-rename-all-files-and-folders-to-lowercase-in-a-directory?forum=winserverpowershell)

