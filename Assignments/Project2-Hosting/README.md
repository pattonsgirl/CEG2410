# Project 2 - DIY HTTPS Server

## Objectives
- set up a webserver to host content
- enable and configure HTTPS
- understand the role of DNS at various levels
- modify firewall rules on the server and via Security Groups

## What you need
- a website (nothing fancy, although it breaks up grading monotony)
    - if you don't have one to play with, you can play with [`site.tar.gz`](site.tar.gz) by extracting it to your website folder
- an AWS instance
- course GitHub repository (for project documentation deliverables)
    - looks like `https://github.com/WSU-kduncan/ceg2410s24-YOURGITHUBUSERNAME`
- a list of resources used either as you go in long (so in context with parts you are working on) or listed in a section at the end of your project.

Your project documentation will be in your course repository in a file named `Hosting.md`.

## Part 1 - HTTP Server

1. Install either **Apache HTTP Server** OR **Nginx** to your instance.
2. Host your site content via the web service.  
    - Describe two ways (at least) that you can confirm the webserver is serving your site's content
3. Set appropriate access.  Ensure the following:
    - the content server can read the site files
    - members of a group named `devs` are allowed to edit and create new files
        - the permission set should persist for new content created within the site folder, as in `devs` should always have read & write access 
    - For example: `jane`, `bob`, and `ubuntu` are all in group `devs`.  If `jane` makes a new file in the website folder, `form.html`, `jane` may be the owner, but `devs` should always and automatically have read write access.
    - **Resources**
        - [Linuxize - Understanding Linux File Permissions](https://linuxize.com/post/understanding-linux-file-permissions/)
        - [Linuxize - How to add user to group in Linux](https://linuxize.com/post/how-to-add-user-to-group-in-linux/)

### Documentation Requirements
- Service Basics
    - Service name & installation
    - Default port & site directory
- Site administration
    - Configuration files, including what they configure, their location and any notes about why location matters
        - service configuration
        - site configuration
    - Configuration of permissions for website files
        - **include screenshot** of folder & file permissions

**NOTE: IF YOU DO NOT COMPLETE ENABLING HTTPS, INCLUDE SCREENSHOT OF SITE RUNNING WITH HTTP**

## Part 2 - Enable HTTPS 

1. Create a self-signed TLS certificate for your server
2. Enable HTTPS for your web content service
    - Redirect HTTP requests to HTTPS
    - Restart the web content service

### Documentation Requirements
- Creating & location of self-signed certificate files
- Service configuration file changes & description of reason / why
- Service administrative commands 
    - How to restart the web content service
    - How you can confirm HTTPS is enabled
- Include screenshot of site after HTTPS is enabled

Note: configuring your web browser to trust the cert is optional

## Part 3 - Firewall Fixes

Make a minimum change of the following in your instance's Security Group rules.

Create 2 rules for SSH:
- allow SSH connections from your home (and any additional trusted sources)
- allow SSH connections from campus (130.108.0.0/16)

Create 2 rules for HTTP/ HTTPS
- allow HTTP from any source
- allow HTTPS from any source

### Documentation Requirements
- Explain updates to Security Group in terms of protocols, ports, and sources
- **Screenshot** of your rules.

## Part 4 - DNS

Craft DNS records to allow both "your-domain.com" and "www.your-domain.com" to resolve to your instance's public IP address.

Notice: the "hands-on" portion of this requires the instructor to set up a DNS server.  She's working on it.  Confirming your record entries worked will be an in-class assignment.

### Documentation Requirements

- choose a domain name for your website.  For the purpose of not causing headaches, please do not choose something in use or inappropriate.  
    - No actual bank names, no pilot, no google and must be appropriate.
- write an A record that points to "your-domain.com" to your instance's EIP (public IPv4 address)
- explain the purpose and fields in A type records
- write a CNAME record that points to "www.your-domain.com" to "your-domain.com"
- explain the purpose and fields in CNAME type records


## Part 5 - Research

1. Domain name registration
    - Select a registrar you would use to register a domain name
2. Certificate Authority Validation
    - Select a CA you would use to validate your site & generate a certificate

### Documentation Requirements
- Note what registrar you would choose & why
- Describe what steps would be needed to associate the domain name with your web server
- Note what certificate authority you would choose & why
- Describe what you would need to provide (such as documentation of your legitimacy) to generate a certificate

## Part 6 - Resources Used

This does not need to be in it's own section, but you should document what resources you used.  This does not need to be fancy.  You can [link in line to xkcd](https://xkcd.com/), or just list links
- https://xkcd.com/

or my favorite, give a bit of a title and what's inside
- [xkcd - comic of the day](https://xkcd.com/)

## Recommended Resources

- [Digital Ocean - Apache vs Nginx: Practical Considerations](https://www.digitalocean.com/community/tutorials/apache-vs-nginx-practical-considerations)
- [Red Switches - Apache vs Nginx](https://www.redswitches.com/blog/apache-vs-nginx/)

### Apache Basics
- [Ubuntu tutorials - Install and Configure Apache](https://ubuntu.com/tutorials/install-and-configure-apache)
- [Digital Ocean - How To Install the Apache Web Server on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-20-04)

### Nginx Basics
- [Ubuntu tutorials - Install and configure Nginx](https://ubuntu.com/tutorials/install-and-configure-nginx)
- [Digital Ocean - How To Install Nginx on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04)

### Certificates & HTTPS
- [Digital Ocean - How To Create a Self-Signed SSL Certificate for Apache in Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-ubuntu-22-04)
- [Digital Ocean - How To Create a Self-Signed SSL Certificate for Nginx in Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-20-04-1)
- [Rose Hosting - How To Enable HTTPS Protocol with Apache 2 on Ubuntu 20.04](https://www.rosehosting.com/blog/how-to-enable-https-protocol-with-apache-2-on-ubuntu-20-04/)

### DNS
- [CloudFlare - DNS A Record](https://www.cloudflare.com/learning/dns/dns-records/dns-a-record/)
- [CloudFlare - DNS CNAME Record](https://www.cloudflare.com/learning/dns/dns-records/dns-cname-record/)
- [RedHat - Zone File Resource Records](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/4/html/reference_guide/s3-bind-zone-rr)
- [AWS Docs - How do I assign a static DNS server to the EC2 instance that persists during reboot?](https://repost.aws/knowledge-center/ec2-static-dns-ubuntu-debian)

## Submission

- In the Pilot Dropbox, paste the URL to the your Project 2 folder in your GitHub repo
  - URL should look like: https://github.com/WSU-kduncan/ceg2410-projects-YOURGITHUBUSERNAME/tree/main/Project2

## Rubric

[Rubric](Rubric.md)