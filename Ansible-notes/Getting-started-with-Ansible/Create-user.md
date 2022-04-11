## Create user
To create a user on all servers I used the module "user".

[Ansible documentation on "user"](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/user_module.html)

e.g. (snippet from bootstrap.yml)
```yaml
  - name: Create user whyme
    tags: always,user
    user:
        name: whyme
```

I used "name" within the "user" module to specify the name of the new user.
You can also specify the groups you want the user to be added to by using "group" within the "user" module.
e.g.
```yaml
  - name: Create user whyme
    tags: always,user
    user:
        name: whyme
        group: wheel
```


## Add authorized key to new user
To add an authorized key to a new user you can use the module "authorized_key"

[Ansible documentation on "authorized_key"](https://docs.ansible.com/ansible/latest/collections/ansible/posix/authorized_key_module.html)

e.g. (snippet from create-user.yml)
```yaml
  - name: Add ssh key for whyme
    tags: always,user
    authorized_key:
        user: whyme
        key:"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIETZeeBBZ89bV2MPt7NXQJEj/kPTUz2DZF6Cf81nkpmE ansible"
        # Don't forget the space between : and "
        # Copy and paste was shitty
```
###### Explenation:
`user: ` With user you specify which user you want to add an authorized key too.
`key: ` With key you specify the key you want to add to the users authorized key file.

You can also create an authorized_key file you can distribute to new machines with copy. See [[Tags-copy-unzip]]

## Add sudoers file
I have added a sudoers file so that the user can use sudo without password. I added it with the module "copy".

e.g. (snippet from bootstrap.yml)
```yaml
  - name: Add sudoers file for whyme
    tags: always,user
    copy:
      src: /home/$USER/Git/ansible-testing/getting-started-with-ansible/files/sudoer_whyme
      dest: /etc/sudoers.d/whyme
      owner: root
      group: root
      mode: 0440
```

You can find information about "copy" and the rights here: [[Tags-copy-unzip]]
