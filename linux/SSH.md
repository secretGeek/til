# SSH to a linux machine from windows

On windows, you'll use PuTTY to connect to your digital ocean droplet via SSH.

First need to generate private/public key pair, using PuTTYgen.

Guide I followed for this is: <https://www.digitalocean.com/community/tutorials/how-to-use-ssh-keys-with-putty-on-digitalocean-droplets-windows-users>

Download complete puTTY installer (msi) from this page: <http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html>

Look for "A Windows MSI installer package for everything except PuTTYtel"

Install that.

Then run PuTTYgen, and generate a private/public key pair. Save the public key as a .txt file and the private key as a .ppk file.

Store the passphrase in your password manager. Note that the passphrase is something you are expected to type, so make it an actual passphrase: easy to type but quite long.

(Originally I created a long and complex password... but then it was too hard to type. I found I could change the passphrase, using PuTTYgen -- I just had to re-save the private key afterwards.)

# Add your public key to digital ocean...

Go to your profile: https://cloud.digitalocean.com/settings/profile

Click "Security" on the left hand side...

Click "Add SSH Key"

When informing digital ocean of your public key, you need to paste it into a textbox. For this I did the wrong thing: I opened the public key text file, copied the contents and pasted it into the textbox. This resulted in an error that read:


    Add SSH Key
    Key invalid type, we support 'ssh-rsa', 'ssh-dss', 'ecdsa-sha2-nistp256', 'ecdsa-sha2-nistp384', 'ecdsa-sha2-nistp521', or 'ssh-ed25519'.


What I should've done: look at the public key in PuTTYgen, where they provide a textbox with the public key formatted in the right way that you can copy and paste into various programs. Copy it from there. Not from the raw file.





## Source

 * <https://www.digitalocean.com/community/tutorials/how-to-use-ssh-keys-with-putty-on-digitalocean-droplets-windows-users>