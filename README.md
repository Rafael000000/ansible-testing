# ansible-testing
Ansible testing repository

-------------------------------
### Ansible-notes

This directory is a vault for the program Obsidian. The notes in the folder are in markdown format therefore it is possible to open the notes in other programs like notepad or leafpad or programs that support markdown format.

-------------------------------
### set-inventory-default.sh

The script called 'set-inventory-default.sh' creates a backup of '/etc/ansible/hosts' named '/etc/ansible/hosts.bak'. Afterwards it creates a symlink with the following command 'sudo ln -s /home/$USER/Git/ansible-testing/inventory /etc/ansible/hosts'. This is done so that the inventory file from the git repository will be the default hosts file.
