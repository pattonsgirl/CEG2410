# Project 1 - Data

## Objectives

- Configure RAID array by adding volumes to instance
- Configure a file share service
- Identify ports & configure an instance firewall
- Identify types of data & control guides
- (Bonus) Connect a client to share service

## What you need

- An instance on AWS
- Your GitHub repo for project documentation
    - Name your documentation `Data.md`

## The Story

Your company has decided to begin the journey by setting up a foundation system - the ability to store data.  Your job is two-fold - set up the configurations outlined, and document the process to aside your future self and any who join the IT side later.

When wondering "How much should I write?"  This document should be explanatory enough that people have context of the task and inclusive enough that they are not scrounging the internet for basic commands you ran.  You should include links to additional resources - if you found a resource useful, you should include it in the documentation area it was used with.

## Part 1 - Server Configuration

1. Choose a RAID array configuration.  Justify your choice.
2. Add required number of volumes per your array choice
    - Recommend sticking to the 2GB / volume range
3. Configure RAID array and make it usable for storing data
    - I recommend a default `mount` point outside of individual `home` folders

### Documentation Requirements:
- Choice of RAID configuration & justification
    - justification should hit points of read / write speeds & disk recovery in case of hard failure
    - Warning: RAID 0 & RAID 1 have nearly no justification outside of consumer (non-enterprise / business) use
- How to configure, mount, and automatically mount RAID
- Method to recover RAID in case of failure
- Screenshot with RAID status & proof of mount

## Part 2 - Service Configuration

Configure your RAID directory to be either a SAMBA or NFS share.  Both have their special oddities, so I'll let you choose your path.  If you have an alternative you would like to try, notify me first to get permission.

### Documentation Requirements:
- Justification for choosing SAMBA or NFS along with **2 key points** that made it a choice advantage for you.  Reasons such as "it sounded nice" will get no credit.
- How to configure
- How to manage the service
- How to add users to access
- Screenshot with proof of setup 
    - Leaving this a little open here since each has their own "thing"

## Part 3 - Server Network Security

Note: you might want to remember what the "allow all the things from anywhere" rule looks like so you can regain access or debug when it comes to the extra credit part.

1. Identify the required ports & protocols for SAMBA or NFS & which network(s) they should be accessible from.  
    - As a hint, it could be your home (ISP) public IP and WSU as a block (130.108.0.0/16)
2. In the Security Group, delete the rule that opened attempts using any protocol on any port from any source.  Add rules to enable SSH and SAMBA or NFS from trusted networks.
    - Keep both protocols & ports in mind here

### Documentation Requirements
- List the trusted subnets
- List the required ports (and note protocols if specified)
- Screenshot your Security Group rules

## Part 4 - Data Compliance

Determine what umbrella(s) of data compliance regulations you need to worry about.  As a part of this, you should consider groups within your company and who should have access to what.  You have one overall data folder right now, but on reflection this everyone has access to one folder where everything is stored model probably won't hold up.

Approach this section from an IT standpoint.  You are not a legal department, but you will need to work in conjunction with one.

### Documentation Requirements
- Identify what compliance guidelines your organization will need to be concerned with
- Identify how you will restrict access to the data while giving access to those who need it
- Identify what happens if a compliance violation occurs 

## Extra Credit - Connect a Client (10%)

**`sftp` will not receive credit`**

Connect to your share via a client system.  I'll leave what the client is a little open - it could be a second AWS instance, your system (Windows, Mac, or Linux), etc.

### Documentation Requirements
- Client software / program needed to establish connection
- Client information needed to establish connection
- Any server side adjustments needed to authorize client
- How to view server logs for connection details (successes & failures)
- Screenshot proving client has established connection & log from server showing connection established.

## Resources

### AWS & Partitioning a Disk
- [DevOpsCube - How to Attach and Mount an EBS volume to EC2 Linux Instance](https://devopscube.com/mount-ebs-volume-ec2-instance/)
    - Note: partitioning is not necessary since the software controls the RAID.  The `fstab`section is useful, and if you've never done any of this before its a good walk through before you RAID.
- [RedHat - Format and label the partition](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/storage_administration_guide/s3-disk-storage-parted-create-part-mkfs)

### RAID
- [DigitalOcean - RAID Terminology and Concepts](https://www.digitalocean.com/community/tutorials/an-introduction-to-raid-terminology-and-concepts)
- [DigitalOcean - Create RAIDs with mdadm](https://www.digitalocean.com/community/tutorials/how-to-create-raid-arrays-with-mdadm-on-ubuntu-22-04)
- [DigitalOcean - Managing RAID arrays](https://www.digitalocean.com/community/tutorials/how-to-create-raid-arrays-with-mdadm-on-ubuntu-22-04)

### Filesystems & `fstab`
- [OSTechnix - What is Fstab in Linux](https://ostechnix.com/what-is-fstab-in-linux-introduction-to-linux-etc-fstab-file/)
    - Note: It may be wise to label the filesystem
    - It is also wise to not require it be mounted on boot, otherwise your instance may get hung and then you can't access it.

### NFS

- [Ubuntu Server Docs - NFS](https://ubuntu.com/server/docs/service-nfs)
- [Digital Ocean - Set up an NFS mount](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nfs-mount-on-ubuntu-20-04)
- [RedHat - `/etc/exports` & `exportfs`](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/5/html/deployment_guide/s1-nfs-server-config-exports) 
- [Geek Diary - Understanding the `/etc/exports` file](https://www.thegeekdiary.com/understanding-the-etc-exports-file/)

## Submission

- In the Pilot Dropbox, paste the URL to the your `Data.md` documentation in your GitHub repo
  - URL should look like: https://github.com/WSU-kduncan/ceg2410s24-YOURGITHUBUSERNAME/tree/main/Data.md

## Rubric

[Rubric.md](Rubric.md)