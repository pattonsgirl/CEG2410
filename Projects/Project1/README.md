# Project 1 - DIY HTTPS Server

## Objectives
- set up a webserver to host content
- enable and configure HTTPS
- enable and modify firewall rules for better security

## What you need
- a website (nothing fancy, although it breaks up grading monotony)
- an AWS instance
- course GitHub repository (for project documentation deliverables)
    - looks like `https://github.com/WSU-kduncan/ceg2410-projects-YOURGITHUBUSERNAME`

## Part 1 - HTTP Server

1. Install either **Apache HTTP Server** OR **Nginx** to your instance.  Document the following:
    - What port is the service running on?
    - What directory does it serve content from by default?
    - What is the name of the primary configuration file for the service?
2. Host your content via the web server.  
    - Describe two ways (at least) that you can confirm the webserver is serving your site's content
3. Set appropriate access.  Ensure the following:
    - the content server can read the site files
    - members of a group named `devs` are allowed to edit and create new files
        - this should persist for new content created within the site folder - new things created should also be modifiable by members of `dev`
    - in your documentation include:
        - a screenshot of your permission sets
        - a description of how you set up the permissions (especially the persistence)
        - [Resource hint 1](https://linuxize.com/post/understanding-linux-file-permissions/)
        - [Resource hint 2](https://linuxize.com/post/how-to-add-user-to-group-in-linux/)

## Part 2 - Enable HTTPS 

1. Create a self-signed certificate for your server
2. Enable HTTPS for your web content service
    - Redirect HTTP requests to HTTPS
    - Restart the web content service
3. Document:
    - Configuration file changes
    - Location of certificate files
    - Administrative commands (like how to restart the web content service)
    - How you can confirm HTTPS is enabled

## Part 3 - Firewall Fixes

Use either `ufw` or `iptables` to generate to the following firewall rules.  Move carefully and understand chaining (before you lock yourself out... forever!)

Create 2 rules for SSH:
- allow SSH connections from your home (and any additional trusted sources)
- allow SSH connections from campus (130.108.0.0/16)

Create 2 rules for HTTP/ HTTPS
- allow HTTP from any source
- allow HTTPS from any source

Remove any other rules that are too open.

Your deliverable for this part is a brief explanation of the rules created AND a screenshot of your rules.

## Part 4 - Research

1. Domain name registration
    - Select a registrar you would use to register a domain name
    - Describe what steps would be needed to associate the domain name with your web server
2. Certificate Authority Validation
    - Select a CA you would use to validate your site & generate a certificate
    - Describe what is needed for validation

## Part 5 - Resources Used

This does not need to be in it's own section, but you should document what resources you used.  This does not need to be fancy.  You can [link in line to xkcd](https://xkcd.com/), or just list links
- https://xkcd.com/

or my favorite, give a bit of a title and what's inside
- [xkcd - comic of the day](https://xkcd.com/)

## Submission

- In the Pilot Dropbox, paste the URL to the your Project 1 folder in your GitHub repo
  - URL should look like: https://github.com/WSU-kduncan/ceg2410-projects-YOURGITHUBUSERNAME/tree/main/Project1

## Rubric

[Rubric](Rubric.md)