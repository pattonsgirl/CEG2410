# Project 2 - DIY NAS

## Objectives

- Create a shareable folder
- Install `nfs` for servers and export your shareable folder
- Install `nfs` for clients and mount your shared folder
- Modify firewall rules to restrict access to `nfs` ports
- (Extra Credit) Install and configure `smb` / `cifs`
- (Extra Credit) WSL2 + Ubuntu as an NFS client

## What you need

- An instance on AWS
- Your GitHub repo for project documentation
    - Name your documentation `NFS.md`

## Part 1 - NFS Server Configuration

1. Configure a space, use the `ext4` filesystem
    - For those who did the RAID exercise, you can use your RAID
    - For those who did not, you can create a RAID or make a partition on `/dev/sdb`
    - Document the commands used and what they do
2. `mount` the partition to a folder on your AWS instance.  Allow `other`s to add files / folder and edit files / folders within the folder.
    - Document the commands used and what they do
3. Configure `/etc/fstab` to auto mount the partition to the folder on boot.
    - Line added to `/etc/fstab`
    - Command to test `/etc/fstab`
3. Install `nfs` server 
    - Command to install
    - Command to check service status
4. Configure `/etc/exports` to share folder
    - Line added to `/etc/exports`
    - Describe the options you used in exports and why.  If you used no options, describe all default options that would apply.
5. Enable your `nfs` share
    - Command to export all directories in `/etc/exports`
    - Command to restart `nfs`

## Part 2 - Firewall Fixes

Go to the Learner Lab page, make sure "Start Lab" turned things on, then click the AWS link.  Now go to EC2 -> Security Groups.  You'll see one labeled something like: `ceg2350-Lab1SecurityGroup`

If you set `ufw` rules or `iptables` on your instance, I recommend disabling them (`ufw`) or flushing them (`iptables`).

Outbound rules: 
- leave outbound rules as default ALLOW
- some of you messed with them in project 1.  This is a reminder to undo that ;)

Inbound rules:
- ALLOW `https` from any IPv4 address (can add IPv6)
- ALLOW `http` from any IPv4 address (can add IPv6)
- ALLOW `ssh` from "home" - public IP from ISP
- ALLOW `ssh` from WSU - 130.108.0.0/16
- ALLOW `ssh` within virtual network - 10.0.0.0/16
- ALLOW `nfs` from "home" - public IP from ISP
- ALLOW `nfs` from WSU - 130.108.0.0/16
- ALLOW `nfs` within virtual network - 10.0.0.0/16

## Part 3 - Mounting an NFS Share

Linux and Mac can mount using NFS.  WSL2 can work, but is being a butt about it.  To make less of a headache, we will use our same AWS instance as a client.

For this portion, mount your share folder to the client.

1. Install NFS client
2. Create a directory to mount the NFS share to
3. Mount the share folder using the host's IP (public or private)

## Recommended Resources

- [Ubuntu Server Docs - NFS](https://ubuntu.com/server/docs/service-nfs)
- [Digital Ocean - Set up an NFS mount](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nfs-mount-on-ubuntu-20-04)
- [RedHat - `/etc/exports` & `exportfs`](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/5/html/deployment_guide/s1-nfs-server-config-exports) 

## Extra Credit - Windows Share

## Extra Credit - WSL2

Why is this extra credit?  WSL2 + Ubuntu can work as an NFS client, but it involves a bit of magic to kick it along.  For extra credit, create a guide for mounting an NFS share to WSL2.

## Submission

## Rubric