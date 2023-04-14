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
- [Getting Started With Ansible: Basic Installation and Setup](https://www.linode.com/docs/guides/getting-started-with-ansible/)
