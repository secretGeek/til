# Create profile

To test if your profile exists, use this command...

    test-path $PROFILE

To create your profile file (and create a folder to stick it in), use this command:

    New-Item -path $profile -type file -force

 * `-path $profile` -- We pass in the full path of the item we want to create, (from the `$profile` variable).
 * `-type file` -- We tell New-Item that we want to create a file.
 * `-force` -- We tell New-Item to 'just do it' (and in this case it might mean creating the directory to put the file in!)


Now you can edit your profile and start putting all the good things in.


## See Also

 * [In powershell you don't have 1 profile, you have 4 different ones.](profile_4_different_ones.md)