#!/bin/bash

#This script creates a backup of '/etc/ansible/hosts'
#and makes a symlink to '~/Git/ansible-testing/inventory'

#--------------------------------------------------------
## Start Script ##
#--------------------------------------------------------

sudo cp /etc/ansible/hosts /etc/ansible/hosts.bak

sudo ln -s ~/Git/ansible-testing/inventory /etc/ansible/hosts

#--------------------------------------------------------
## End Script ##
#--------------------------------------------------------
