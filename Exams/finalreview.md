# CEG 2410 - Final Topic List

1.	Course essentials & skill review
    - GitHub account & workflow & markdown
    - aspects of an IT business plan
    - IPv4 & Subnets
        - IP range in block
        - subnet mask to CIDR & vice versa
        - divvying block into sub subnets
    - command line memory jog
        - navigation
        - permissions
2.	Virtual & cloud networking
    - VPC
    - subnet
    - Internet Gateway
    - route table, routes
    - Security Group as instance allow-only firewall
    - Instances
    - Public / Elastic IPv4 addresses
3.	Disks & data
    - PC component identification exercise
    - partition tables & partitioning singular disks / block devices
    - filesystems & mounting
    - RAIDs
        - mirroring, striping, parity
        - number of disks needed per type
        - calculation of amount of storage given type & size of disks
    - rules about data & when you need to comply (HIPA, FERPA, etc.)
    - S3 & cloud storage
        - storage tiers
        - create & share an S3 object from a bucket
4. Firewalls
    - Per system: iptables, ufw
    - stateful vs stateless
    - AWS - Network ACL versus Security Groups
    - firewall appliances
5.	Web servers & DNS
    - Linux server software:
        - apache, nginx
    - Ports
    - SSL / TLS & Certificate Authorities
    - Domain name registration
    - DNS & DNS records
    - Site hosting on S3 (what types of site, default protocols)
6. Scripting
    - focus theme: dotfiles
    - include topics:
        - checking for root, addressing non-root
        - working through official docs
        - silent installs
        - symbolic linking
        - if statements & how to check odd facts
        - key `ssh` files (`authorized_keys` vs `config` vs `known_hosts`, public vs private keys)
7. Identity & Access Management
    - kerberos authentication
    - forest vs tree vs domain
    - OUs and GPOs
    - groups
    - users, computers, and objects
8. Backups
    - 3-2-1 rule
    - strategies