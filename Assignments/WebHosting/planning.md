## Web hosting - Planning Phase

## Your Web Serving Stack based on usual seat:
- Door side - Apache HTTP Server
- Non-Door side - Nginx 

## Planning:

- Ports:
    - What ports need open inbound and from what sources?
    - What ports need open outbound and to what destinations?
    - What level(s) will you be handling firewall access and what needs to be configured?  
        - NACL
        - SG
        - System (iptables / ufw / nftables...)

- Configuration:
    - What files will you need to edit to configure your web serving service?
    - How will you configure the web serving service?
        - setting up virtual hosts for your TWO sites
            - Are there additional modifications on the server - /etc/hosts, DNS, etc. - that you need to make to support the virtual hosts?
        - [stretch goal] SSL/TLS modules
        - [stretch goal] logging configuration and how to view logs
    - How do you control the deamon process for the web server?  How do you start, stop, and restart the service?

- Location & Access:
    - Where does the web serving service look for web content based on the configuration files?
    - You have TWO sites to host, how will you organize the content for each site on the server?
    - What user and group will the web server process run as, and how does that affect file permissions?
    - What permissions will you need to set on the content directories and files to allow the web server to serve them?
    - How are you going to allow developers to update the content on the server?  
        - Will you use FTP, SFTP, or some other method?
        - What permissions will the developers need to have on the server to update the content?

