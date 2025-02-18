## Task 4 - HTTPS Configuration

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
