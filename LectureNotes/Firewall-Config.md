## The AWS Server instance 

*Initial* Intent: Web server running shop website; will need to be able to remotely log in for server updates

Remote access for configuration
- Create a whitelist of "trusted" IPs
    - Home? Work? Other servers on server subnet? WSU block is 130.108.0.0/16
- Allow inbound requests for 22 SSH
- Should we enable the ability to `ping`?

Serving web content
- Allow inbound requests for 80 HTTP, 443 HTTPS
- Make sure the response is allowed out
- NACL, SG, System?

What about client inbound traffic (requesting updates, etc)
- Determine where to allow ephemeral ports (1024-65535) - NACL, SG, System?

## The AWS Customer Device

Intent: Customers "bring in devices" and connect to the customer subnet.  Will not have device level control.

1. Finish setting up the customer network
    - Customer devices will share a public IP and exist on a private subnet
    - Set up a NAT Gateway device on a subnet that contains a route table with a route to the internet gateway & associate an EIP with the NAT Gateway.
    > ![WARNING]
    > Delete when not in use! Money pit - does not turn off when lab environment is off
    - Setup a route table for the customer subnet that send outbound traffic to the NAT Gateway for Address Translation

2. Firewall configuration

Customer devices will not be running essential services for access external to the network 
> ![WARNING]
> We are hamstrung here because our only access to the customer device is with SSH...

Customer devices **may** request any sites except competitor sites
- Determine a set of competitors (Folgers, Winans, Pettibone)
- NACL? SG? System?
- What about client inbound traffic?

Customer devices only have there service ports open to other devices on the network
- Service ports are 1-1024
- NACL, SG, System
- What about return traffic?

Customer and server talking? 
- Web Server instance may ssh to customer device
    - NACL? SG? System?
- Customer device may not ssh to Server subnet
