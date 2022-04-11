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

Within the roles directory you create directories. These directories are the roles. 
e.g.
```plaintext
.    rwx r-x r-x $USER users 2022-04-11 14:47 7 -
..   rwx r-x r-x $USER users 2022-04-11 15:09 5 -
base rwx r-x r-x $USER users 2022-04-11 14:48 3 -
```

Within this directory you need to create two directories. These are:
files/
tasks/

e.g.
```plaintext
.     rwx r-x r-x $USER users 2022-04-11 15:02 4 -
..    rwx r-x r-x $USER users 2022-04-11 14:47 7 -
files rwx r-x r-x $USER users 2022-04-11 15:02 2 -
tasks rwx r-x r-x $USER users 2022-04-11 15:03 2 -
```

Within the tasks directory you can place .yml files. These contain snippets from playbooks. Where a normal playbook would look something like this [[Example_of_playbook]]. A roles looks something like this [[Example_role]].

The difference between the two is that the role only contains what is needed for the role that gets called. For more examples of what can be called [[#^260dc8]].

When your role calls upon a file this file can be placed in the 'files' directory of the respected role.
e.g.
```plaintext
└──> ✔ ls roles/web_servers/files/
.                 rwx r-x r-x $USER users 2022-04-11 15:02 2 -
..                rwx r-x r-x $USER users 2022-04-11 15:02 4 -
default_site.html rw- r-- r-- $USER users 2022-04-11 15:02 1 116 B
```

Calling a role looks like this:
```yaml
- hosts: all
  become: true
  roles:
    - base
```

Under the `roles` module you write the name of the folder in the roles folder. [[#^260dc8]]

### Example
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

^260dc8

Here ^ we again see 'web_servers'. In this directory are two more located:
```plaintext
.     rwx r-x r-x $USER users 2022-04-11 15:02 4 -
..    rwx r-x r-x $USER users 2022-04-11 14:47 7 -
files rwx r-x r-x $USER users 2022-04-11 15:02 2 -
tasks rwx r-x r-x $USER users 2022-04-11 15:03 2 -
```

In the tasks directory is the 'web_servers' part of the original playbook located. The file is called main.yml again (in my case):
```plaintext
└──> ✔ ls roles/web_servers/tasks/
.        rwx r-x r-x $USER users 2022-04-11 15:03 2 -
..       rwx r-x r-x $USER users 2022-04-11 15:02 4 -
main.yml rw- r-- r-- $USER users 2022-04-11 15:03 1 1.0 KiB
```

(Snippet from main.yml in roles/web_servers/tasks/ directory)
```yaml
- name: Install apache & php (Ubuntu)
  tags: httpd,apache2
  apt:
      name:
        - apache2
        - libapache2-mod-php
      state: latest
  when: ansible_pkg_mgr == "apt"

#--------
- name: Install apache & php (AlmaLinux)
  tags: httpd,apache2,alma
  dnf:
      name:
        - httpd
        - php
      state: latest
  when: ansible_pkg_mgr == "dnf"

```
