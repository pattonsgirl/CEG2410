# Project 1 - DIY HTTPS Server

## Objectives
- set up a webserver to host content
- enable and configure HTTPS
- modify Security Groups for best instance firewall rules

## What you need
- a website (nothing fancy, although it breaks up grading monotony)
- an AWS instance (a VM will not be sufficient)

## Part 1 - HTTP Server

1. Install either Apache HTTP Server OR Nginx to your instance.  Document the following:
    - What port is the service running on?
    - What directory does it serve content from by default?
    - What is the name of the primary configuration file for the service?
2. Host your content via the web server.  Describe two ways (at least) that you can confirm the webserver is serving your site's content
3. Set appropriate access.  Ensure the following:
    - the content server can read the site files
    - members of a group named `devs` are allowed to edit and create new files
        - this should persist for new content created within the site folder - new things created should also be modifiable by members of `dev`

## Part 2 - Enable HTTPS 

- Research a CA you would use if creating a public certificate
- Research a registrar you would use to claim a domain name

## Part 3 - Firewall Fixes