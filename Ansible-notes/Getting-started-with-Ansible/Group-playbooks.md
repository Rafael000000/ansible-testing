You can create groups within the inventory file. You can use these groups to link specific tasks in your playbook to specific servers.
``` plaintext
[web_servers]
192.168.122.11
192.168.122.15

[db_servers]
192.168.122.12

[file_servers]
192.168.122.13

[workstation]
192.168.122.14
```

Here is a snippet of my playbook where I use host groups. I have one part dedicated to all hosts and one part only to the web_servers host group.
You can also see that I use pre_tasks (pre_tasks: always run first).
```yaml
---

- hosts: all
  become: true
  pre_tasks:

  - name: Install updates (AlmaLinux)
    dnf:
        update_only: yes
        update_cache: yes
    when: ansible_distribution == "AlmaLinux"

  - name: Install updates (Ubuntu)
    apt:
        upgrade: dist
        update_cache: yes
    when: ansible_distribution == "Ubuntu"

  - name: Install updates (Archlinux-based)
    community.general.pacman:
      #upgrade: yes
        update_cache: yes
    when: ansible_distribution == "Archlinux"

#------------------------------------------------------
- hosts: web_servers
  become: true
  tasks:

# apt
  - name: Install apache & php for (Ubuntu)
    apt:
        name:
          - apache2
          - libapache2-mod-php
        state: latest
    when: ansible_pkg_mgr == "apt"

# dnf
  - name: Install apache & php for (Almalinux)
    dnf:
        name:
          - httpd
          - php
        state: latest
    when: ansible_pkg_mgr == "dnf"
```
