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

- VPC
  - [ ] configuration - notes on VPC size and intent
  - [ ] screenshot
- Subnets
  - [ ] configuration
  - [ ] intent of design (size and purpose)
  - [ ] screenshot(s)
- Route tables
  - [ ] configuration
  - [ ] which route tables have which rules and go with which subnet and why
  - [ ] screenshot(s)
- NACL configuration(s) - description of rules, which subnet(s) they are designed for; screenshot(s)
- Security Group configuration(s) - description of rules, which resources they are designed for; screenshot(s)
- Instance with system level firewall rules - describe the rules; screenshot(s) of rules in place and chaining active
- Instances on different subnets; proof backed by experimental descriptions and screenshots that the network configuration and firewall behavior is working as configured
- Propose a build for the advertising devices (TV menus) subnet; include notes on route tables, NACLs, SGs, and system level firewalls
