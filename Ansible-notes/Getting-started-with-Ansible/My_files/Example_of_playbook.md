```yaml
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
