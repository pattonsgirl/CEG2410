1.	Course essentials & skill review
    - GitHub account & workflow & markdown
    - build an IT business plan
    - IP & Subnets live quiz
        - https://ipcisco.com/subnetting-quiz-1-n485hju/
        - posted questions to menti
    
2.	Virtual & cloud networking
    - [Computer Networking 101 from a pro](https://iximiuz.com/en/posts/computer-networking-101/)
    - complete along: [build a virtual network](https://labs.iximiuz.com/tutorials/container-networking-from-scratch)
        - [VLAN sample is too much](https://iximiuz.com/en/posts/networking-lab-simple-vlan/)
    - setup VPC through instance
    - command line memory jog
        - navigation
        - permissions
3.	Disks & data
    - get physical systems to take apart + PC Tear Down companion report
    - add disks to instance
    - review types of RAIDs
    - S3 & cloud storage
        - share a file on S3 https://gist.github.com/pjkelly/be2cd3881e766620a411
        - discussion of bucket policies 
            - https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-iam-policies.html 
            - https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-walkthroughs-managing-access.html 
        - create AWS S3 Bucket - https://cloudacademy.com/lab/create-your-first-amazon-s3-bucket/
    - rules about data (HIPA, FERPA, etc.)
        - quiz generated from online banks: https://www.easyllama.com/blog/hipaa-quiz/
4. Firewalls
    - [Guide to iptables](https://iximiuz.com/en/posts/writing-web-server-in-python-sockets/)
    - firewall appliances - pfsense
    - Cloud - network ACL versus Security Groups
5.	Web servers & DNS
    - [TMI on DIY web servers](https://iximiuz.com/en/posts/writing-web-server-in-python-sockets/)
    - DNS & BIND9
        - https://www.cherryservers.com/blog/how-to-install-and-configure-a-private-bind-dns-server-on-ubuntu-22-04
        - https://www.digitalocean.com/community/tutorials/how-to-configure-bind-as-a-private-network-dns-server-on-ubuntu-20-04
        - https://www.redhat.com/sysadmin/dns-configuration-introduction
        - https://arstechnica.com/information-technology/2024/02/doing-dns-and-dhcp-for-your-lan-the-old-way-the-way-that-works/
    - Host on S3 
        - https://docs.aws.amazon.com/AmazonS3/latest/userguide/HostingWebsiteOnS3Setup.html
        - https://cloudiofy.com/aws-s3-website-hosting/ 
        - https://aws.amazon.com/getting-started/hands-on/get-a-domain/ 
    - Hosting options for dynamic sites: https://aws.amazon.com/websites/
    - downloading & pre-scanning of sites before delivery
6.	Users
    - BYOE - customizing environment - skel, https://devblogs.microsoft.com/oldnewthing/20131121-00/?p=2603
    - vim customizations, useful aliases, message of the day, public key porting
    - dotfiles
7.	Azure AD == Azure Entra ID
8.	Backup & recovery strategies
    - backup location rules
    - rsync, Windows Backup, Apple Time Machine
    - Bucket policies moved to here
9.	Scripting
    - apt, homebrew, choclately
    - do x in bash, Powershell, and python
10.	Cloning & deployment
    - make bootable USB (rufus, USB Image Writer)
    - dd, clonezilla
    - ghost & fog
    - https://www.comparitech.com/net-admin/os-imaging-deployment-software/ 
11.	Automation with Ansible
12. Risk & NIST





Archive:

•	Basic skills:
-	git & GitHub
-	documentation
-	markdown basics
-	using the terminal
-	SSH
•	Users:
-	setting yourself up on a system
-	user permissions & access control
-	creating a user
-	parsing text files
-	creating bulk users
-	directory services
	LDAP
	AD
	joining domains
•	Networking:
-	hostnames
-	IP & MAC
-	routing
-	DNS
-	firewalls
-	RDP
-	DHCP
-	SSL certificates & HTTPS
•	Storage:
-	format disk
-	create / manage RAID
-	create / manage NFS?
•	Emails:
-	Exchange? / setup email server
-	configuring email from server
-	cron to send email
	script to gather import info
•	System management
-	system builds (hardware) and servers
-	group policies
	managing sudo / admin & groups
	regedit
-	cloning
-	deployment
	setting first run / on boot
-	backups
	scope
	rules to play by
	backing up databases
	restoration & testing
-	logging & audits
-	security & patches
	CVEs
	getting notified
	deploying fixes
-	dashboards
	Grafana?
•	Automation
-	scripting in bash
-	scripting in Powershell
•	virtualization, containers, & the cloud
