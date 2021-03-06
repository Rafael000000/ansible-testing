[[Ansible-apt-commands]]
[[Apache-playbook]]
[[Playbook-example]]
```yaml
---

- hosts: all
  become: true
  tasks:

  - name: update repository index
    apt:
      update_cache: yes
    when: ansible_pkg_mgr == "apt"

  - name: install apache2 package
    apt:
        name: apache2
        state: latest
    when: ansible_pkg_mgr == "apt"

  - name: add PHP support for apache
    apt:
        name: libapache2-mod-php
        state: latest
    when: ansible_pkg_mgr == "apt"

  - name: Install arandr on arch machine
    community.general.pacman:
        name: arandr
    when: ansible_pkg_mgr == "pacman"

  - name: Install bat on arch machine
    community.general.pacman:
        name: bat
    when: ansible_pkg_mgr == "pacman"
```

With 'when:' you can make it so that a command only runs when, for example, apt is available on the server/machine.

Options for when:

`==` (Is equal to)
`!=` (Is not equal to)
`<=` (Smaller then or equal to)
`>=` (Bigger  then or equal to)

e.g.
when: ansible_pkg_mgr == "pacman" (is equal to)
when: ansible_pkg_mgr != "pacman" (is not equal to)
when: ansible_distribution_major_version <= '7' (smaller then or equal to)
when: ansible_distribution_major_version >= '7' (bigger then or equal to)

The strings you can use with 'when:' are only limited by the output of the following command:
`ansible (all/ip-address) -m gather_facts` 
e.g.  `ansible 192.168.122.124 -m gather_facts`
      `ansible all -m gather_facts`

Snippet from the output:
```
"ansible_nodename": "ubuntu-srv-01",
        "ansible_os_family": "Debian",
        "ansible_pkg_mgr": "apt",
        "ansible_proc_cmdline": {
            "BOOT_IMAGE": "/boot/vmlinuz-5.4.0-105-generic",
            "maybe-ubiquity": true,
            "ro": true,
            "root": "UUID=4b2d732d-6128-4de4-892a-0f9214810998"
        },
```
Here you can see that 'when: ansible_pkg_mgr == "apt"' uses "ansible_pkg_mgr": "apt" as string.