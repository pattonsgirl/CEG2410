# Firewall Rule Proposals

TODO:
- Define SOURCE or DESTINATION as appropriate
- Define PORT and PROTOCOL (say ALL if ALL)
- Define where to place rule 
  - NACL = Network Access Control List
  - SG = Security Group
  - SYS = System level (iptables)
- Define if rule should be INBOUND or OUTBOUND

---

1. Block 203.0.113.5 from reaching any resource in the subnets.
    - SOURCE: 203.0.113.5/32
    - PORTS = ALL
    - PROTOCOLS = ALL
    - NACL INBOUND

2. Block customers devices from talking to servers.
    - SOURCE: 10.0.0.0/24
    - PORTS = ALL
    - PROTOCOLS = ALL
    - NACL OUTBOUND to SERVER subnet
    - TODO - DESIGN CHANGE - we need NACL to apply unique to subnets

3. Allow HTTP/S traffic from the entire internet to the Web Server.
    - SOURCE: 0.0.0.0/0
    - PORTS = 80 & 443
    - PROTOCOLS = HTTP and HTTPS (TCP)
    - NACL allow inbound; SG allow inbound; MUST HANDLE SYS if ENABLED

4. Allow SSH (Port 22) only from known admin network IPs (other servers on the subnet; any WSU IP / OAR; Admin home - public IP via ISP).
    - SOURCE: 10.0.1.96/28; 130.108.0.0/16; Run a what is my ip at home /32
    - PORT: 22
    - PROTOCOL: SSH (TCP)
    - NACL - allow inbound; SG allow inbound; MUST HANDLE SYS if ENABLED

5. Allow SSH (Port 22) only for a specific user ID on the Linux server.
   - See rule 4
   - iptables can restrict based on user ID
   - typically this is done with an SSH configuration of the `AllowedUsers` parameter

6. Allow the DB server to accept traffic only if it comes from the Web Server SG.

7. Block an entire country's IP range from the VPC. (Let's use China as the strawman)

8. Allow an EC2 instance in a private subnet to download updates from the internet via a NAT Gateway.

9. A user sends an HTTPS request to your web server; the server needs to send the webpage data back.

10. Prevent two different instances within the same subnet from talking to each other.

11. Immediately block a known botnet range (e.g., 192.0.2.0/24) before it even reaches your web server.

12. We want to allow ping for troubleshooting, but only from our office IP.

13. Traffic arrives on Port 80 but needs to be redirected to an internal service running on Port 8080.

---

Rubric:

Score / 24

- 8 rules (6 - 13) were to be filled out outside of class
- for each, student needed to propose:
    - Source / Destination 
    - Port & protocol
    - Where to place rule
    - If rule should be inbound or outbound