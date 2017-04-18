# SSH to a linux machine from windows

On windows, you can use PuTTY to connect to your digital ocean droplet via SSH.

(I've since found two better ways to do this: 
   1. with [bash.exe](../windows/bash_on_windows.md) or 
   2. with `cmder` which I think is using OpenSSH by way of gitbash.
   
Soon I think windows will have better ssh features built in. Powershell will get them for example.)


## Creating private/public key pair for use in SSH, using PuTTYgen.
   
First need to generate private/public key pair, using PuTTYgen.

Guide I followed for this is: <https://www.digitalocean.com/community/tutorials/how-to-use-ssh-keys-with-PuTTY-on-digitalocean-droplets-windows-users>

Download complete PuTTY installer (msi) from this page: <http://www.chiark.greenend.org.uk/~sgtatham/PuTTY/download.html>

Look for "A Windows MSI installer package for everything except PuTTYtel"

Install that.

Then run PuTTYgen, and generate a private/public key pair. Save the public key as a .txt file and the private key as a .ppk file.

Store the passphrase in your password manager. Note that the passphrase is something you are expected to type, so make it an actual passphrase: easy to type but quite long.

(Originally I created a long and complex password... but then it was too hard to type. I found I could change the passphrase, using PuTTYgen -- I just had to re-save the private key afterwards.)

## Add your public key to digital ocean...

Go to your profile: https://cloud.digitalocean.com/settings/profile

Click "Security" on the left hand side...

Click "Add SSH Key"

When informing digital ocean of your public key, you need to paste it into a textbox. For this I did the wrong thing: I opened the public key text file, copied the contents and pasted it into the textbox. This resulted in an error that read:


    Add SSH Key
    Key invalid type, we support 'ssh-rsa', 'ssh-dss', 'ecdsa-sha2-nistp256', 'ecdsa-sha2-nistp384', 'ecdsa-sha2-nistp521', or 'ssh-ed25519'.


What I should've done: look at the public key in PuTTYgen, where they provide a textbox with the public key formatted in the right way that you can copy and paste into various programs. Copy it from there. Not from the raw file.



# WARNING: UNPROTECTED PRIVATE KEY FILE!

Got this error:

    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    @         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    Permissions 0744 for '/home/geek/.ssh/id_rsa' are too open.
    It is recommended that your private key files are NOT accessible by others.
    This private key will be ignored.
    bad permissions: ignore key: /home/geek/.ssh/id_rs

To limit the permissiveness of those files I used these commands...
    
    sudo chmod 600 ~/.ssh/id_dsa
    sudo chmod 600 ~/.ssh/id_dsa_com.pub


## Export PuTTYgen keys to be usable from linux subsystem for windows

Had I created my keys in a different way I would not have needed to do this. But because I used PuTTYgen, this is what I needed to do...

<http://stackoverflow.com/a/2224204/49>

1. Open PuTTYGen
2. Click Load
3. Load your private key
4. Go to Conversions->Export OpenSSH and export your private key
5. Copy your private key to ~/.ssh/id_dsa (or id_rsa).
Create the RFC 4716 version of the public key using  ssh-keygen

    ssh-keygen -e -f ~/.ssh/id_dsa > ~/.ssh/id_dsa_com.pub

6. Convert the RFC 4716 version of the public key to the OpenSSH format:

    ssh-keygen -i -f ~/.ssh/id_dsa_com.pub > ~/.ssh/id_dsa.pub

Simple right!? No, not simple.    



## Host Identification has changed.

    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    @    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
    Someone could be eavesdropping on you right now (man-in-the-middle attack)!
    It is also possible that a host key has just been changed.
    The fingerprint for the ECDSA key sent by the remote host is
    7e:5e:42:31:34:82:c7:97:e3:3a:f2:e1:b4:4f:d4:56.
    Please contact your system administrator.
    Add correct host key in /home/user1/.ssh/known_hosts to get rid of this message.
    Offending ECDSA key in /home/user1/.ssh/known_hosts:2
      remove with: ssh-keygen -f "/home/user1/.ssh/known_hosts" -R 555.55.55.555
    ECDSA host key for 555.55.55.555 has changed and you have requested strict checking.
    Host key verification failed.


    ssh-keygen -R [IP_ADDRESS]

## Source

 * <https://www.digitalocean.com/community/tutorials/how-to-use-ssh-keys-with-PuTTY-on-digitalocean-droplets-windows-users> -- includes how to configure PuTTY itself.
 * <http://stackoverflow.com/questions/20840012/ssh-remote-host-identification-has-changed>
   