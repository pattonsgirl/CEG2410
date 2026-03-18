## HTTPS & SSL/TLS Configuration

In this assignment, you will secure your web traffic. Currently, your sites are served over HTTP (Port 80), which means data is sent in "plain text." You will generate your own encryption keys and configure Apache/Nginx to support HTTPS (Port 443).

## To begin:

Ensure the `ssl` module is enabled on your server. Look up how to do this action / if it is necessary for Apache / Nginx

You will need to create a directory to store your "keys" and "certs" (common practice is `/etc/apache2/ssl` or `/etc/nginx/ssl`). 
- **Security Note:** Ensure your private key is only readable by `root`.

## What to set up:

1. Generate Self-Signed Certificates

* Use the `openssl` command-line tool to create a **Private Key** and a **Self-Signed Certificate**.
* You must create two separate certificates:
    * One for `lastname.wsukduncan.com`
    * One for `something-menu.com`

* **Requirement:** When prompted for the "Common Name (CN)", ensure it matches the specific domain name for that site.

2. Configure HTTPS Virtual Hosts

* Modify your existing configuration files (or create new ones) in `sites-available` to listen on **Port 443**.
* **Requirement:**
    * Point the `SSLCertificateFile` directive to your `.crt` file.
    * Point the `SSLCertificateKeyFile` directive to your `.key` file.

* Ensure your `DocumentRoot` matches the work from the previous HTTP configuration assignment.

3. The HTTP to HTTPS Redirect

* Configure your **Port 80** virtual host so that any request coming in over standard HTTP is automatically redirected to the HTTPS version of the site.
* **Goal:** If a user types `lastname.wsukduncan.com`, the browser should automatically update to `https://lastname.wsukduncan.com`.

4. Firewall Adjustments

* Update your server's firewall (and your AWS Security Group) to allow inbound traffic on **Port 443 (HTTPS)**.

## Documentation Requirements

In your `web` folder on GitHub, create a new file named `https-config.md`. Your writeup must include:

1. SSL/TLS Concepts

* Explain the difference between a **Private Key** and a **Public Certificate**. Which one is shared with the browser?
* What is a "Self-Signed" certificate, and why does the browser show a "Your connection is not private" warning when you access it?

2. Command Syntax

* Provide the exact `openssl` command you used to generate your certificates.
* Break down what the flags `-x509`, `-nodes`, and `-days 365` actually do.

3. Redirection Logic

* Show the configuration lines used to force the redirect from Port 80 to Port 443. Explain the logic of the redirect (e.g., using `Redirect permanent` or a Rewrite Rule).

4. Verification Screenshots

* Provide a screenshot of your browser showing the "Security Warning" and then the site loading after you click "Advanced -> Proceed."
* Show a screenshot of the "Certificate Details" in the browser, proving the "Common Name" matches your domain.

5. Service Logs

* Use `curl -I https://localhost` (the `-I` flag shows headers) and provide the output.
* Show the line in the output that confirms the connection is encrypted (e.g., `HTTP/1.1 200 OK` over the SSL port).

## Submission

Submit a link in Pilot to your course GitHub repository with your HTTPS configuration documentation.

