## HTTP Web Service Configuration

Install and configure an the Apache HTTP Server OR NGINX HTTP package & service on your AWS instance.

### To begin: 

Copy content of *one* of your sites to the *default* directory the default site configuration file points to. 

Make sure when you access your website - via `curl` or in a browser using your server's public IP address - that it show your content.

### What to set up:

Two web content directories with respective contents:
- one for your main, publicly accessible site
- one for the menu, the site only your tv menus should access
- permissions are optional at the moment; another check-in assignment will address those expectations

Two configuration files in `sites-available`.  Create, enable, and test these *one at a time*
- one for your main site
    - configure the server name to use `lastname.wsukduncan.com` - the DNS record added for you 3/11/2026
        - **IMPORTANT** if your server's public IP has changed, you'll need to message the instructor with the new public IP
    - point root / document root to the respective web contents
    - enable the site, test that `lastname.wsukduncan.com` shows your main, publicy accessible site
- one for your tv menu
    - configure the server name to use `something-menu.com`
    - [Optional] change the port to not port 80
        - TODO - think about why this would be benificial if the end goal is only screens in the building should access this site...
    - point root / document root to the respective web contents
    - enable the site, test that `something-menu.com` shows your menu
        - you'll need to configure `/etc/hosts` with an entry for `something-menu.com`
        - you should be able to `curl` to the server's private or localhost ip - `curl something-menu.com`
        - you *can* configure `something-menu.com` to work from your personal system - edit `/etc/hosts` 

## Documentation Requirements

Create a folder in your course GitHub repository called `web`.  Create a file named `http-service.md` and create a writeup that includes the following details.

1. Title document with what service you are configuring

2. Description of what you are setting up in this document / guide.

3. Service configurations:
    - Key pieces of a server block / virtual host file 
        - explain key configuration lines - listening ports; name; web content directory
    - Why and how to enable or disable a site configuration file
    - When and how to restart the service

4. Name configurations
    - explain how and why the names work - `lastname.wsukduncan.com` and `something-menu.com`

5. Screenshots to show your service is serving your main site versus your menu site based on your requests

6. How to access and what system logs show that your service is successfully serving content based on the different requests.

## Submission

Submit a link in Pilot to your course GitHub repository with your `http-service.md` documentation.

## Rubric

Your `http-service.md` should include all of the following required elements:

- [ ] A title and description of the HTTP service being configured
- [ ] Explanation of key server block / virtual host configuration lines
- [ ] Instructions for enabling, disabling, and restarting the web service
- [ ] Explanation of how `lastname.wsukduncan.com` and `something-menu.com` are configured
- [ ] Screenshot evidence showing the main site and menu site serving correctly
- [ ] Discussion of system logs or commands that confirm successful content delivery


