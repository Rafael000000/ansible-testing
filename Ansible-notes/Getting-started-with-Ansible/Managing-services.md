[Ansible documenation on services](https://docs.ansible.com/ansible/2.9/modules/service_module.html)

You can enable systemd services with the "service" module. You can use it like this:
(Snippet from managing-services.yml)

```yaml
 - name: Enable httpd.service(AlmaLinux)
   tags: httpd,apache2,alma
   service:
       state: started
       enabled: yes
       name: httpd
   when: ansible_os_family == "RedHat"
```

The method above works for Red Hat(-based) distributions, arch(-based) distributions and debian(-based) distributions. 

###### Explenation:

`state: ` With state you let systemd know wich state you want the service to be in. These can be:
- reloaded
- restarted
- started
- stopped

`enabled: ` This lets you choose if you want the service to start automatically at boot. Options:
- yes
- no

`name: ` This specifies the name of the service. In my case I used "httpd". 

---
As noted in the ansible documentation:
**At least one of state and enabled are required.**

This means that you need to have `state` and `enabled` within the service module. 