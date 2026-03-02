## AWS Setup Assignment

Objectives:
- confirm subnet design per in-class setup
- create route tables, NACLs, SGs with intent of subnet and instance purpose
- implement firewall configuration with the layers of security in mind amoung NACL, SG and device level (iptables / ufw)

### Firewall configuration:

Make sure you have implemented rules discussed in class for the server and customer device and their respective subnets, NACLs, and Security Groups for instances on those subnets

[Firewall configuration requirements for server and customer devices]( https://github.com/pattonsgirl/CEG2410/blob/main/LectureNotes/Firewall-Config.md)

### Core assignment requirements
In your course GitHub repository, create a markdown file - `aws-setup.md`

In this file, include:

- VPC configuration and screenshot
- Subnets configuration, intent of design, screenshot(s)
- Route table configuration - which route tables have which rules and go with which subnet and why; screenshot(s)
- NACL configuration(s) - description of rules, which subnet(s) they are designed for; screenshot(s)
- Security Group configuration(s) - description of rules, which resources they are designed for; screenshot(s)
- Instance with system level firewall rules - describe the rules; screenshot(s) of rules in place and chaining active
- Instances on different subnets; proof backed by experimental descriptions and screenshots that the network configuration and firewall behavior is working as configured
- Propose a build for the advertising devices (TV menus) subnet; include notes on route tables, NACLs, SGs, and system level firewalls

### Submission

Submit URL to `aws-setup.md` to Dropbox in Pilot

### Rubric

Score / 32

- VPC
  - [ ] configuration - notes on VPC size and intent
  - [ ] screenshot
- Subnets
  - [ ] configuration
  - [ ] intent of design (size and purpose)
  - [ ] screenshot(s)
- Route tables
  - [ ] configuration
  - which route tables have which rules and go with which subnet and why
    - [ ] Internet Gateway for server subnet
    - [ ] NAT Gateway for customer subnet
  - [ ] screenshot(s)
- NACL
  - [ ] configuration(s)
  - [ ] description of rules
  - [ ] which subnet(s) they are designed for
  - [ ] screenshot(s)
- Security Group
  - [ ] configuration(s)
  - [ ] description of rules
  - [ ] which resources they are designed for
  - [ ] screenshot(s)
- Firewall config
  - server
    - [ ] only allows trusted IPs to SSH to server instance
    - [ ] allows any IP to connect to server instance for HTTP / HTTPS
    - [ ] highlights how connections are allowed back to the server if the server instance is the client (updates, downloads, etc from external sources)
  - customer
    - [ ] notes when a NACL is needed for network communications
    - [ ] only allows the server or server subnet to make ssh requests to client instance
    - [ ] otherwise only allows customer devices to make outgoing requests - no other traffic should be allowed in unless the client instance initiated it 
- Instance with system level firewall rules (iptables / ufw / nftables)
  - [ ] describe the rules
  - [ ] inbound or outbound chain present (something would be blocked)
  - [ ] screenshot(s) of rules
- Instances on different subnets (expecting one server and one customer device)
  - [ ] proof that instances are on different subnets with NACL / SGs designed for each 
  - [ ] proof backed by experimental descriptions and screenshots that the network configuration and firewall behavior is working as configured
- Propose a build for the advertising devices (TV menus) subnet. Notes on:
  - [ ] route tables
  - [ ] NACLs
  - [ ] SGs
  - [ ] system level firewalls
