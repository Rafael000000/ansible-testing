# Install cups
This is an example of the format of a playbook.

Command that is used for the example and that will be formatted to the playbook: `ansible all -m apt -a "name=cups" --become --ask-become-pass`

`all` becomes `- hosts: all`

-- Become makes you sudo
`--become` becomes `become: true` in a playbook

-- This will be a title in the output. Be descriptive.
`- name: (name)` eg: `- name= install cups package`

-- Documentation on the apt module: [Ansible apt docs](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html)
`apt` stays `apt` but make sure it is alligned correctly

-- With name you specify which package you want to install. 
`-a "name=cups"` becomes `name: cups`

---
**Alignment in a playbook is very important!** 

To run a playbook use: 
`ansible-playbook --ask-become-pass (playbook locateion)`
eg: `ansible-playbook --ask-become-pass playbook/install_cups.yml`

Format playbook:

Playbooks are written in yaml
The beginning of a statement or block starts with an hyphen "-"

```yaml
File = playbooks/install_cups.yml
---

- hosts: all
  become: true
  tasks:

  - name: install cups package
    apt:
        name: cups
    
```

