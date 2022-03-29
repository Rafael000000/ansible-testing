# Commands for apt
[Ansible apt docs](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html) 

- Update repos
`ansible all -m apt -a "update_cache=true" --become --ask-become-pass`
- Upgrade packages (dist,full,no,yes)
`ansible all -m apt -a "upgrade=string" --become --ask-become-pass`
- Install package (package name in string)
`ansible all -m apt -a "name=string" --become --ask-become-pass`
- Autoremoves unneeded packages
`ansible all -m apt -a "autoremove=yes" --become --ask-become-pass`

