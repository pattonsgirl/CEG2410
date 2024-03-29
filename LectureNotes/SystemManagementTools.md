# System Management Tools

## Cloning

Things to think on before you clone:
- Same hardware or new hardware?
- Same size disk?
- Keep accounts?
- Keep software?

### Prep Tools

- [Windows `sysprep`](https://www.iperiusbackup.net/en/sysprep-cloning-and-deployment-of-windows-installations/)
- [Windows OOBE - Out of Box Experience](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/customize-oobe)
- ["sysprep" for Mac OS](https://www.mosandl.eu/en/2013/04/16/sysprep-for-mac-osx/)
    - [Other options](https://www.itninja.com/blog/view/sysprep-for-mac-images)
- Linux?
    - [`oem-config-prepare`](https://manpages.ubuntu.com/manpages/bionic/man8/oem-config-prepare.8.html) && [`oem-config-firstboot`](https://manpages.ubuntu.com/manpages/focal/man8/oem-config-firstboot.8.html)
    - [`virt-sysprep`](https://manpages.ubuntu.com/manpages/kinetic/en/man1/virt-sysprep.1.html) Reset, unconfigure or customize a **virtual machine** so clones can be made

### Cloning

- [`Clonezilla`](https://clonezilla.org/)
    - [Download `Clonezilla`](https://clonezilla.org/downloads.php)
    - [Example of cloning with `clonezilla`](https://pureinfotech.com/clone-windows-10-drive-clonezilla/)
    - [`Clonezilla` Server Edition - `DRBL`](https://clonezilla.org/clonezilla-SE/)

## FOG

FOG = Free Open Source [Ghost](https://en.wikipedia.org/wiki/Ghost_(disk_utility))
- [Install a FOG Server](https://docs.fogproject.org/en/latest/installation/server/install-fog-server/)
    - [Configure a FOG client](https://docs.fogproject.org/en/latest/installation/client/install-fog-client/)
- [Basic Tasks with FOG](https://docs.fogproject.org/en/latest/kb/how-tos/capture-an-image/)

## Ansible

- [Getting Started Guide](https://docs.ansible.com/ansible/latest/getting_started/index.html)
- [Ansible Command Cheat Sheet](https://www.digitalocean.com/community/cheatsheets/how-to-use-ansible-cheat-sheet-guide)

### Build an Inventory

The simplest inventory is a single file with a list of hosts and groups. The default location for this file is `/etc/ansible/hosts`. You can specify a different inventory file at the command line using the `-i <path>` option or in configuration using inventory.

- https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html 
- https://www.digitalocean.com/community/tutorials/how-to-set-up-ansible-inventories

Sample inventory (wish it was hostnames)
```ini
[windowsservers]
#domain controller
52.205.171.21
# pc on domain
50.17.249.76

[linuxservers]
52.70.19.50
54.88.160.13
#brand new
44.210.27.83
```

[Inventory variables](https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html#connecting-to-hosts-behavioral-inventory-parameters) (needed to specify default user & private key for `ssh`) & how to specify [variables for a group](https://www.cyberciti.biz/faq/define-ssh-key-per-host-using-ansible_ssh_private_key_file/) \ [group variables](https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html#assigning-a-variable-to-many-machines-group-variables)
```ini
[linuxservers:vars]
ansible_ssh_user=ubuntu
ansible_ssh_private_key_file=/home/kduncan/keys/ceg2410.pem
```

Check ansible can read inventory (no format errors)
```bash
ansible-inventory -i inventory.ini --list
ansible-inventory -i inventory.ini --graph
```

Check ansible can connect to managed nodes
```bash
ansible all -i inventory -m ping
```

### Build a Playbook

Playbooks are YAML files containing a list of ordered tasks that should be executed on a remote server to complete a task or reach a certain goal, such as to set up a LEMP environment. Ansible playbooks allow you to fully automate server setup and application deployment, using an accessible syntax and an extensive library of built-in resources.

- https://www.digitalocean.com/community/tutorial_series/how-to-write-ansible-playbooks

Hello world playbook
```yml
# set one group, one host, or all groups in inventory
- hosts: linuxservers
  tasks:
    - name: Print message
      debug:
        msg: Hello Ansible World
```
- At the beginning of each play, Ansible executes by default an additional task that gathers information — referred to as facts — about the remote nodes
- This playbook defines one task, named `Print message`
- Each node will print message `Hello Ansible World`

Run playbook
```bash
 ansible-playbook -i inventory.ini hello-world.yml
```

Playbook to view gathered facts
```yml
- hosts: all
  tasks:
  - debug:
      var: ansible_facts["all_ipv6_addresses"]|type_debug
  - debug:
      var: ansible_facts["memory_mb"]|type_debug
  - debug:
      var: ansible_facts["machine"]|type_debug
```

#### Privilege escalation in playbook

- [Using `become` to use `sudo`](https://www.digitalocean.com/community/tutorial_series/how-to-write-ansible-playbooks#understanding-privilege-escalation-in-ansible-playbooks)

#### Playbook for adding `group` / `user`

- https://adamtheautomator.com/ansible-create-user/
- https://www.linuxsysadmins.com/ansible-playbook-to-create-users-and-groups/

#### Playbook for installing software packages

- [How To Install and Manage System Packages in Ansible Playbooks](https://www.digitalocean.com/community/tutorials/how-to-install-and-manage-system-packages-in-ansible-playbooks)
- [All ansible `apt-module` options](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html) [and examples](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html#examples)

#### Playbook to configure a webserver

- [How To Deploy a Static HTML Website with Ansible on Ubuntu 20.04 (Nginx)](https://www.digitalocean.com/community/tutorials/how-to-deploy-a-static-html-website-with-ansible-on-ubuntu-20-04-nginx)
- [Ansible/Nginx Playbook](https://charlesreid1.com/wiki/Ansible/Nginx_Playbook)

### Ansible + Windows

- https://docs.ansible.com/ansible/latest/os_guide/windows_usage.html
- [Set up SSH on Windows](https://docs.ansible.com/ansible/latest/os_guide/windows_setup.html#windows-ssh-setup)
    - [Microsoft Docs](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui)

#### Windows Web Server using Ansible

- [Install IIS Web server on Windows 2019 via Ansible](https://tungle.ca/?p=1274)

### Ansible Demos

- [RedHat Repo Collection of Demos](https://github.com/ansible/product-demos)
