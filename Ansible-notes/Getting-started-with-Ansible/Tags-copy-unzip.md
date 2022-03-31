## Tags
(Snippets from files-copy.yml)
You can use tags to run only specific tasks. For example:
```yaml
- hosts: web_servers
  become: true
  tasks:

  - name: Install apache & php for Ubuntu servers
    tags: httpd,apache2
    apt:
        name:
          - apache2
          - libapache2-mod-php
        state: latest
    when: ansible_pkg_mgr == "apt"
```

In this ^  code snippet you can see I gave this task the tags httpd and apache2. This makes it possible to only run this part of the playbook by using the following command:
Single tag: `ansible-playbook --tags (tag) --ask-become-pass files-copy.yml`
Multiple tags: `ansible-playbook --tags "tag,tag" --ask-become-pass files-copy.yml`

e.g. 
Single tag: `ansible-playbook --tags httpd --ask-become-pass files-copy.yml` 
Multiple tags: `ansible-playbook --tags "httpd,apache2" --ask-become-pass files-copy.yml`

There is also a tag that makes it that a task/block always runs. That would be the tag "always". 

e.g. 
```yaml
- name: Install updates (Ubuntu)
    tags: always
    apt:
        update_cache: yes
        upgrade: dist
        autoremove: yes
    when: ansible_distribution == "Ubuntu"
```


## Copy
(Snippets from files-copy.yml)

You can copy files to your servers by doing the following:

e.g. This snippet is located under (- hosts: web_servers)
```yaml
- name: Copy default html file to web servers
    tags: httpd,apache2
    copy:
      src: /home/$USER/Git/ansible-testing/playbooks/managing-services-files/default_site.html
      dest: /var/www/html/index.html
      owner: root
      group: root
      mode: 0644
```

Here you can see I use the module 'copy' to copy 'default_sites.html' to '/var/www/html/index.html' on the web servers. The owner of the file and the group will be root, once it is on the web server. The permissions of the file are also set by ansible.

`Copy:` is a module from ansible [Docs copy](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/copy_module.html)
`src:` This is where you input the file that needs to be copied. This can be a full path.
