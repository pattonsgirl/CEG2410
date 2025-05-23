# Self-Hosted Service Report

This report will be centered around your implementation of self-hosting one of the below services.  This is not a group project - you must implement networking, hosting and management yourself in addition to writing up the companion report.  That said, you may partner with others who picked the same software to host to help with troubleshooting / advice.  As with all work in this course, cite sources - be them classmates, web resources, or generative AI to note what helped during your implementation.

This Report will exist in your `ceg2410-GHUsername` repository in GitHub named `Self-Hosted.md`

## Choose a Software to Host

As stated in class, I am lazily breaking these up into three general categories.

Self-hosted System Management Applications:
> [!WARNING]
> For options that are OSes, you'll have to check first to see if an AMI is available to install to the instance.

- [Unraid](https://unraid.net/) - operating system for self-hosted servers and network-attached storage
- [TrueNAS](https://www.truenas.com/truenas-community-edition/) - The platform harnesses the power of the legendary ZFS file system to easily scale unified storage with the reliability and performance demanded by virtualization, backup, and many other data-intensive workloads.
- [Proxmox](https://www.proxmox.com/en/products/proxmox-virtual-environment/overview) - complete, open-source server management platform for enterprise virtualization. It tightly integrates the KVM hypervisor and Linux Containers (LXC), software-defined storage and networking functionality, on a single platform. With the integrated web-based user interface you can manage VMs and containers, high availability for clusters, or the integrated disaster recovery tools with ease.
- [Grafana](https://grafana.com/oss/grafana/) - Easily collect, correlate, and visualize data with beautiful dashboards using Grafana — the open source data visualization and monitoring solution that drives informed decisions, enhances system performance, and streamlines troubleshooting.
- [Homepage](https://github.com/gethomepage/homepage) - A modern, fully static, fast, secure fully proxied, highly customizable application dashboard

Self-hosted Utility Applications:
- [immich](https://immich.app/) - Self-hosted photo and video management solution
- [mealie.io](https://mealie.io/) - Recipe Management For The Modern Household
- [GitLab](https://about.gitlab.com/install/) - an Open Source code repository and collaborative software development platform
- [ownCloud](https://owncloud.com/download-server/) - real-time content collaboration platform

Self-hosted Game Servers:
> [!WARNING]
> This may get iffy in your AWS Academy account.  Validate that you can build an instance per minimum required specs before proceeding.  I'm not sure AWS Academy accounts can request GPU resources.
> This may also include additional fees to have a software license.

- [Minecraft](https://www.minecraft.net/en-us/download/server)   
    - [Video - How to Host a Minecraft Server on AWS](https://www.youtube.com/watch?v=RoZumss8Wug)
- Enshrouded
- Valheim

## Host your Software in an EC2 Instance

After making your software selection, your next task is to work on deploying it to an EC2 instance.  
1. Determine a suitable instance type (specs) to run your software
2. Determine which OS is best to install and run your software to
3. Install your software
4. Make network security adjustments appropriate to the needs of your server, your software, and user access
5. Determine an access plan from the following perspectives:
    - server administration
    - users wanting to access the software
    - systems connecting to the software
6. Demonstrate proper configuration by utilizing features provided by the software
    - Given the scope of allowed software, I am keeping this vague, so here are some examples:
        - Grafana - dashboard a server you manage
        - mealie - prove a user can sign in, save a recipe, and another can view it
        - Minecraft - prove players (with permission) can sign in and play
7. Create a backup policy appropriate to the system / software
    - Things to consider:
        - is there a file or set of files that could be backed up to an S3 bucket?
        - is the software so engrained that a backup needs to be an AMI image? (such as Promox)

## Documenting your Implementation

Your documentation should address / include a minimum of the following elements:

1. Project description:
    - What software will be set up through this document
    - What the software is
    - What this document will cover in terms of self-hosting this software
2. AWS VPC setup:
    - VPC block (and explanation / justification)
    - Subnet block (and explanation / justification)
    - Route table rules (and explanation / justification)
    - Network ACL rules (and explanation / justification)
    - Security Group rules (and explanation / justification)
3. AWS instance setup:
    - instance type (and explanation / justification)
    - AMI (and explanation / justification)
    - volume size (and explanation / justification)
4. Cost estimates:
    - summary of cost estimates
    - projected cost according to dashboard (screenshot)
    - cost of instance type
    - cost of EIP (note, EIP charges only apply when instance is not in use)
    - cost of AMI
5. Installation instructions:
    - point to documentation to use as reference 
    - summarize your installation process
    - **screenshot** of software operating on instance
6. Security:
    - how server access is being restricted depending on service 
        - controlling remote server administration vs using the application
    - this should reflect your Security Groups / Network ACLs / system level firewalls & management access your software allows
    - **screenshots** demonstrating different user type access rights
7. Software features: 
    - description of demonstrated features
    - **screenshots** of features in action
8. Backup policy / disaster recovery: 
    - **Thoughtful** analysis of what good backups will consist of
    - Amount of data to be backed up (estimation)
    - Backup strategy showing a reflection of the 3-2-1 rule
    - Estimated recovery time
    - Estimated time to recovery in case of failure
9. Common troubleshooting:
    - one or two things that you typically need to troubleshoot when self-hosting this application
        - can be from a system design perspective (computation resources, networking configurations)
        - can be when installing / configuring the software


## Submission

Submit link to documentation in your `ceg2410-GHUsername` repository to the Dropbox on Pilot.

## Documentation Rubric

### Total points: / 33

1. Project description - / 3
    - [ ] What software will be set up through this document
    - [ ] What the software is
    - [ ] What this document will cover in terms of self-hosting this software
2. AWS VPC setup - / 5
    - [ ] VPC block
        - [ ] explanation / justification
    - [ ] Subnet block
        - [ ] explanation / justification
    - [ ] Route table rules
        - [ ] explanation / justification
    - [ ] Network ACL rules
        - [ ] explanation / justification
    - [ ] Security Group rules
        - [ ] explanation / justification
3. AWS instance setup - / 3
    - [ ] instance type
        - [ ] explanation / justification
    - [ ] AMI
        - [ ] explanation / justification
    - [ ] volume size
        - [ ] explanation / justification
4. Cost estimates - / 5
    - [ ] summary of cost estimates
    - [ ] projected cost according to dashboard (screenshot)
    - [ ] cost of instance type
    - [ ] cost of EIP
    - [ ] cost of AMI
5. Installation instructions - / 3
    - [ ] point to documentation to use as reference 
    - [ ] summarize your installation process
    - [ ] **screenshot** of software operating on instance
6. Security - / 5
    - how server access is being restricted depending on service 
        - [ ] controlling remote server administration
        - [ ] using the application
    - [ ] reflects your Security Groups / Network ACLs / system level firewalls
    - [ ] reflects user management access your software allows
    - [ ] **screenshots** demonstrating different user type access rights
7. Software features - / 2
    - [ ] description of demonstrated features
    - [ ] **screenshots** of features in action
8. Backup policy / disaster recovery - / 5
    - [ ] **Thoughtful** analysis of what good backups will consist of based on software selection
    - [ ] Amount of data to be backed up (estimation)
    - [ ] Backup strategy showing a reflection of the 3-2-1 rule
    - [ ] Estimated recovery time
    - [ ] Estimated time to recovery in case of failure
9. Common troubleshooting - / 2
    - [ ] one or two things that you typically need to troubleshoot when self-hosting this application
    - [ ] is worth noting as something to troubleshoot
10. Deductions:
    - [ ] Lack of source cited: -10% = 3.33 pts
    - [ ] Poor markdown formatting / organization: 10% = 3.33 pts
    - [ ] Does not differentiate research of how things should be versus what is actually working: 10% = 3.33 pts


