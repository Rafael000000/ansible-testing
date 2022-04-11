### Intro
You can use roles to cleanup your playbooks. To be able to use roles you need to create a roles directory. 
Default locations are:
```plaintext
/home/$USER/.ansible/roles 
/usr/share/ansible/roles
/etc/ansible/roles 
```

I created mine here:
```plaintext
/home/$USER/Git/ansible-testing/getting-started-with-ansible/roles
```

If you created a custom location like me you need to edit your 'ansible.cfg' file. You need to add the line "roles_path =".
e.g.
```ini
roles_path = /home/$USER/Git/ansible-testing/getting-started-with-ansible/roles
```



#### Example
A playbook that uses roles looks a bit like this:

(Snippet from main.yml)
```yaml
- hosts: all
  become: true
  pre_tasks:

- hosts: all
  become: true
  roles:
    - base

- hosts: web_servers
  become: true
  roles:
    - web_servers

- hosts: db_servers
  become: true
  roles:
    - db_servers

- hosts: file_servers
  become: true
  roles:
    - file_servers

- hosts: workstation
  become: true
  roles:
    - workstation
```

Take 'web_servers' for example. The roles are all located in the roles directory "ansible-testing/getting-started-with-ansible/roles"
An `ls` from the roles directory:
```plaintext
.            rwx r-x r-x $USER users 2022-04-11 14:47 7 -
..           rwx r-x r-x $USER users 2022-04-11 15:09 5 -
base         rwx r-x r-x $USER users 2022-04-11 14:48 3 -
db_servers   rwx r-x r-x $USER users 2022-04-11 14:48 3 -
file_servers rwx r-x r-x $USER users 2022-04-11 14:48 3 -
web_servers  rwx r-x r-x $USER users 2022-04-11 15:02 4 -
workstation  rwx r-x r-x $USER users 2022-04-11 14:48 3 -
```

Here ^ we again see 'web_servers'. In this directory are two more located:
```plaintext
.     rwx r-x r-x $USER users 2022-04-11 15:02 4 -
..    rwx r-x r-x $USER users 2022-04-11 14:47 7 -
files rwx r-x r-x $USER users 2022-04-11 15:02 2 -
tasks rwx r-x r-x $USER users 2022-04-11 15:03 2 -
```

In the tasks directory is the 'web_servers' part of the original playbook located. The file is called main.yml again:
```plaintext
└──> ✔ ls roles/web_servers/tasks/
.        rwx r-x r-x $USER users 2022-04-11 15:03 2 -
..       rwx r-x r-x $USER users 2022-04-11 15:02 4 -
main.yml rw- r-- r-- $USER users 2022-04-11 15:03 1 1.0 KiB
```
