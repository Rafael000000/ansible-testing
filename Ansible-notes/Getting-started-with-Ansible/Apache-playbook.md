**Alignment in a playbook is very important!** 
[[Playbook-example]]

Info about:
-- This will be a title in the output. Be descriptive.
`- name: install name package`
-- Module name
   `apt:`
-- Name of package to install
        `name: (package name)
-- When state is set to 'latest' it will update it automatically if there is an update available
        `state: latest`
-- To remove a package use
        `state: absent`

To run a playbook use: 
`ansible-playbook --ask-become-pass (playbook locateion)`
e.g. `ansible-playbook --ask-become-pass playbook/install_apache.yml`

Format playbook:

Playbooks are written in yaml
The beginning of a statement or block starts with an hyphen "-"

```yaml
File = playbooks/install_apache.yml
---

- hosts: all
  become: true
  tasks:

  - name: update repository index
    apt:
      update_cache: yes

  - name: install apache2 package
    apt:
        name: apache2
        state: latest

  - name: add PHP support for apache
    apt:
      name: libapache2-mod-php
      state: latest
    
```

