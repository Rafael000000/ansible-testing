```yaml
- name: Install apache & php package
  apt:
      update_cache: yes
      name:
        - apache2
        - libapache2-mod-php
      state: latest
  when: ansible_pkg_mgr != "pacman"
```
