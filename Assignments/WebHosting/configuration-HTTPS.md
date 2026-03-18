## HTTPS & SSL/TLS Configuration

This assignment follows the progression from your previous tasks. Since students are likely working on AWS or a private network where they don't yet have a public CA-signed certificate (like Let's Encrypt), using **Self-Signed Certificates** is the perfect way to teach the underlying SSL/TLS handshake and configuration logic.

---

## HTTPS & SSL/TLS Configuration

In this assignment, you will secure your web traffic. Currently, your sites are served over HTTP (Port 80), which means data is sent in "plain text." You will generate your own encryption keys and configure Apache/Nginx to support HTTPS (Port 443).

### To begin:

Ensure the `ssl` module is enabled on your server. For Apache, this is typically done with `sudo a2enmod ssl`.

You will need to create a directory to store your "keys" and "certs" (common practice is `/etc/apache2/ssl` or `/etc/nginx/ssl`). **Security Note:** Ensure your private key is only readable by `root`.

### What to set up:

**1. Generate Self-Signed Certificates**

* Use the `openssl` command-line tool to create a **Private Key** and a **Self-Signed Certificate**.
* You must create **two separate certificates**:
* One for `lastname.wsukduncan.com`
* One for `something-menu.com`


* **Requirement:** When prompted for the "Common Name (CN)", ensure it matches the specific domain name for that site.

**2. Configure HTTPS Virtual Hosts**

* Modify your existing configuration files (or create new ones) in `sites-available` to listen on **Port 443**.
* **Requirement:**
* Point the `SSLCertificateFile` directive to your `.crt` file.
* Point the `SSLCertificateKeyFile` directive to your `.key` file.


* Ensure your `DocumentRoot` matches the work from the previous assignments.

**3. The HTTP to HTTPS Redirect**

* Configure your **Port 80** virtual host so that any request coming in over standard HTTP is automatically redirected to the HTTPS version of the site.
* **Goal:** If a user types `lastname.wsukduncan.com`, the browser should automatically update to `https://lastname.wsukduncan.com`.

**4. Firewall Adjustments**

* Update your server's firewall (and your AWS Security Group) to allow inbound traffic on **Port 443 (HTTPS)**.

---

## Documentation Requirements

Update your GitHub repository. Create a file named `https-ssl.md` in your `web` folder.

**1. SSL/TLS Concepts**

* Explain the difference between a **Private Key** and a **Public Certificate**. Which one is shared with the browser?
* What is a "Self-Signed" certificate, and why does the browser show a "Your connection is not private" warning when you access it?

**2. Command Syntax**

* Provide the exact `openssl` command you used to generate your certificates.
* Break down what the flags `-x509`, `-nodes`, and `-days 365` actually do.

**3. Redirection Logic**

* Show the configuration lines used to force the redirect from Port 80 to Port 443. Explain the logic of the redirect (e.g., using `Redirect permanent` or a Rewrite Rule).

**4. Verification Screenshots**

* Provide a screenshot of your browser showing the "Security Warning" and then the site loading after you click "Advanced -> Proceed."
* Show a screenshot of the "Certificate Details" in the browser, proving the "Common Name" matches your domain.

**5. Service Logs**

* Use `curl -I https://localhost` (the `-I` flag shows headers) and provide the output.
* Show the line in the output that confirms the connection is encrypted (e.g., `HTTP/1.1 200 OK` over the SSL port).

---

## [Extra Credit] Diffie-Hellman Group

For extra security, generate a **Strong Diffie-Hellman Group** to enhance the "Perfect Forward Secrecy" of your server.

* Provide the command used to generate the `dhparam.pem` file.
* Show the configuration line where you added this to your web server config.
* Explain why increasing the bit length (e.g., to 2048 or 4096) makes the initial handshake more secure but more CPU-intensive.

---

**Would you like me to provide a "Troubleshooting Guide" you can give the students, specifically addressing common AWS Security Group and "Certificate Name Mismatch" errors?**

Sites are expected, practically required, to utilize HTTPS, which is HTTP with SSL secured with TLS.  

You'll be researching Certificate Authorities (CAs) in the next task.  For now we will focus on self-made certificates.

Your browser *will not trust* your self-signed certificate - you may need to click through browser warnings regarding your site security.

## Documentation

Create a folder in your course GitHub repository called `Web-Hosting`.  Create a file named `https.md` and insert the following details.

- Identify, install, and enable modules required for the apache service to use HTTPS.  Document how this was done.
- Firewall acknowledgments to allow access to server over configured port
- Create a self-signed certificate with OpenSSL.  Document how this task was complete and details on the location of associated files
- Configure apache to utilize your certificate.  Document the process such so that future you can replace the certificates as required
- Redirect HTTP request to utilize HTTPS instead
- Provide at least two ways to tell that your server is serving content over HTTPS
- Screenshot(s) to validate site is utilizing HTTPS
    - focus on proving via browser tools that HTTPS is enabled

## Submission

Submit a link in Pilot to your course GitHub repository with your HTTPS configuration documentation.
