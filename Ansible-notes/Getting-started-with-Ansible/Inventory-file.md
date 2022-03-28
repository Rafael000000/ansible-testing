In the inventory file you put the hosts that have to be managed by ansible. 

File name = "inventory" or "hosts"
When the file is catted it should look something like this, but with your amount of hosts:

------------------
`$ cat inventory`

192.168.122.187
192.168.122.117
192.168.122.32