## Create a SSH private and public key
`ssh-keygen -t (type) -C "comment"`
eg: `ssh-keygen -t ed25519 -C "my default"`

`-t`  stands for 'key type'

There are a couple of options for key types, these are:

dsa 
ecdsa
ecdsa-sk
ed25519 
ed25519-sk
rsa

`-C`  stands for comment. You can use this to identify which key it is.

Output:

```shelloutput
Generating public/private ed25519 key pair.

#You can use the default path by pressing enter. Or you can enter your own path.
Enter file in which to save the key (/home/$USER/.ssh/id_ed25519):

#You can create a passphrase for your key (recommended). Or leave it empty.
Enter passphrase (empty for no passphrase):

Your identification has been saved in /home/$USER/.ssh/id_ed25519
Your public key has been saved in /home/$USER/.ssh/id_ed25519.pub
The key fingerprint is:
SHA256:TwRCP9UHCUVrxIp+rcwe0R+X+QWWtgHqSPhv4oLxq14 my default
The key's randomart image is:
+--[ED25519 256]--+
|     .o . o**o   |
|       + o o+o.. |
|      . +.o.o.*  |
|       o.=.o o +o|
|       .S +.. ooo|
|    .   .+.... oo|
|     +E .+=.  . .|
|    ..o. o+.     |
|   .o..o...      |
+----[SHA256]-----+
```

----

## Send public key to server
It is possible to login to your server with your SSH key. To do this you have to send your key to the server. To send a SSH key to a server you use the following command:

`ssh-copy-id -i name.pub serverip`
eg: `ssh-copy-id -i FirstKey.pub 192.168.122.124`

`-i`  stands for input-file

----

## Use SSH key
To use your SSH key for logging in to a server via SSH you have to do the following:

`eval "$(ssh-agent)" && ssh-add /home/$USER/.ssh/Privatekey`
eg: `eval "$(ssh-agent)" && ssh-add /home/$USER/.ssh/id_ed25519`

If you created a password for your key you will need to enter it. After that you can just SSH into your servers with the terminal session. When you open a new terminal you will have to repeat this step.