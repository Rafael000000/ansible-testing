[[Ansible-when]]

You can create a cleaner playbook by merging stuff together:

``` yaml
File name: cleaner-playbook-part-1.yml
---

- hosts: all
  become: true
  tasks:

# apt
  - name: Install apache & php package
    apt:
        update_cache: yes
        name:
          - apache2
          - libapache2-mod-php
        state: latest
    when: ansible_pkg_mgr != "pacman"

# Pacman
  - name: Install caddy on arch machine
    community.general.pacman:
        update_cache: yes
        name:
          - caddy
        state: latest
    when: ansible_pkg_mgr == "pacman"
```

Here ^ I merged the apt lines together. Where at first I had 3 apt blocks, 1 for update_cache and 2 for installing packages, I now have one block that does all of it. 
This is possible because all of the options (name & update_cache) are available in the 'apt' module. 
Therefor as long as the string that is part of a module is located in the block of the correct module, eg. update_cache is located in the apt block (with right indentation), the block will recognize it as an option. 

```yaml
File name: cleaner-playbook-part-2.yml
---

- hosts: all
  become: true
  tasks:

  - name: Install apache & php package
    package:
        update_cache: yes
        name:
          - "{{ apache_package }}"
          - "{{ php_package }}"
        state: latest
    when: ansible_pkg_mgr != "pacman"

# Pacman
  - name: Install caddy on arch machine
    community.general.pacman:
        update_cache: yes
        name:
          - caddy
        state: latest
    when: ansible_pkg_mgr == "pacman"
```

In this version ^ I made the first block even more compact. Apt is not used now. Instead of the moduel 'apt' the module 'package' is used. Package is a way to install a package no matter what distro is being used. You can work with variables, "{{ variable }}", but don't forget to define them. 
I defined the variables in the inventory file.

Inventory file:
Ubuntu host:
`192.168.122.11 apache_package=apache2 php_package=libapache2-mod-php`
AlmaLinux/RHEL/CentOS host:
`192.168.122.107 apache_package=httpd php_package=php`

Here you can see that apache_package is defined in the inventory file and used in cleaner-playbook-part-2.yml.
