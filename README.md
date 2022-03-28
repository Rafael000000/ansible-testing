# ansibel-testing
Ansible testing repository

The script called 'set-inventory-default.sh' creates a backup of '/etc/ansible/hosts' named '/etc/ansible/hosts.bak'. Afterwards it creates a symlink with the following command 'sudo ln -s /home/$USER/Git/ansible-testing/inventory /etc/ansible/hosts'. This is done so that the inventory file from the git repository will be the default hosts file.
