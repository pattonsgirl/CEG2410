# Networking

- [IPv4 vs IPv6](https://bluecatnetworks.com/blog/ipv4-vs-ipv6-whats-the-difference/)

## Machine to Network

A network capable device (laptop, PC, NestHub) has one or more Network Interface Cards (NICs)

Each NIC is uniquely connected to a network.  A device can be connected to multiple networks. 

Each NIC has a unique Media Access Control Address (MAC) that uniquely identifies it from all other devices.  If you buy 60 HP laptops, they may all have Realtek wireless NICs, but each card will have a unique NIC.  Fun fact, since these aren't randomly generated, if ordered in bulk like this, the addresses may even be sequential!

Virtual Network Adapters are a thing - if you have installed a VMM (VirtualBox, Hyper-V, etc) your device also hosts a virtual network for it to connect to.

The NIC is what is actually given information about connecting to the network.

As far as what connects you to a network, there's options:
- Wifi (WLAN)
    - 2.4 GHz & 5 GHz are used most commonly
    - Check out the rules of [frequency ranges for wifi](https://en.wikipedia.org/wiki/List_of_WLAN_channels)
- CAT cable
    - general term for unshielded twisted pair
    - You can look further down this rabbit hole into all the [versions of CAT cables](https://www.guru99.com/ethernet-cables-types.html)
- [Coaxial Cable](https://en.wikipedia.org/wiki/Coaxial_cable)
- [Fiber-optic cable](https://en.wikipedia.org/wiki/Fiber-optic_cable)


## Connection to a Network

There are two sub-situations within this: 
- requesting network info
- manually configuring network info

In general, you need the following network information to be on a network (remember, this is per NIC):
- IP address
- Subnet mask
- Gateway address
- DNS address
- DHCP address (if applicable)
- lease time (if applicable)

Commands:
- Powershell: `ipconfig /all`
- Ubuntu: `ip a`
- Mac: ?

You'll see Dynamic Host Control Protocol (DHCP) most commonly on private IPV4 networks or networks where there are specific sets of allowed devices.  [Check out this article for more details on DHCP](https://whatismyipaddress.com/dhcp).  On controlled networks, allowed MACs are collected, and only matching MACs will receive network information.  At school, or a library, or Starbucks, you might see disallowed MACs - MACs banned after generating worrisome network traffic.

## Connecting to a Domain / Hostname

Domain Name System (DNS) is the lookup system you rely on.  Instead of remembering IP addresses of everything you want to connect to, you use the hostname.  You are usually given a first lookup DNS, where a cache is kept of last seen IP to hostname correlations.  If it hasn't seen it, you are passed to the next up the chain until a full query is made (ie. you are the first to have looked up that hostname in your region).  [Check out the DNS flow](https://www.cloudflare.com/learning/dns/what-is-dns/)
- [Types of DNS Records](https://www.cloudflare.com/learning/dns/dns-records/) also matter.  You should familiarize yourself with:
    - A - holds IPv4 address of a domain
    - AAAA - holds the IPv6 address of a domain
    - CNAME - forwards one domain or subdomain to another domain, does NOT provide an IP address
    - MX - directs mail to an email server
- Once you get an IP address of the domain / hostname you are connecting to, you can address the packet to the correct destination.

The other part of this conversation is the **protocol** - this will define a slew of things such as the port to connect to and how communication needs to be formatted for the application to create and assemble packets.

[Check out this video deep dive on protocols - ~ 20 minutes](https://www.youtube.com/watch?v=d-zn-wv4Di8&t=4s&ab_channel=LiveOverflow)
- This is really worth watching.

Now, if we know who we are talking TO (the destination IP) and how to talk to them (protocol) and where the service is listening (the port), we just need to get there (well, our packets) and get a response.

1. Check routing table for best match subnet & corresponding gateway
    - Powershell: `route PRINT`
    - Ubuntu: `ip route`, `route` (I find this one to be cleaner)
    - Mac: ?
2. Send packet to destination OR to next gateway.  Check route, repeat
3. Packet may reach a **border** gateway.  Network Address Translation (NAT) is needed to communicate outside network.  The origin / FROM address of the packet is modified to the IP of the gateway.  Gateway maintains table to return packets to source.
4. When the packet reaches its destination, more than you expect needs to come next...

## Connecting to HTTPS domains

Let's assume you packet has made it to its destination - a server.  Some things to note:
- A server can do more than one function.  The program / service is listening over a port.
- THe services on the server use protocols to define how to read and respond to your request
- Modern websites often use a reverse proxy, commonly known as a load balancer.  You connect to the reverse proxy, which then determines which of a set of backend servers services your request.
    - See CEG 3120 if curious

Hypertext Transfer Protocol Secure (HTTPS) layers encryption over HTTP (see protocol video linked above for some neat visuals or view [Cloudflare's writeup](https://www.cloudflare.com/learning/ddos/glossary/hypertext-transfer-protocol-http/)).  The encryption protocol is Transport Layer Secure (TLS).  TLS is an update to Secure Socket Layer (SSL) - SSL is outdated, but you still see deprecated uses of it in terminology.

Start here to get an understanding of HTTPS: [Cloudflare - What is HTTPS](https://www.cloudflare.com/learning/ssl/what-is-https/)

Now look into TLS Certificates: [Steve's Internet Guide - SSL Certificates Explained](http://www.steves-internet-guide.com/ssl-certificates-explained/)

Focus on how just a TLS handshake works (certificate aside): [Cloudflare - What happens in a TLS handshake](https://www.cloudflare.com/learning/ssl/what-happens-in-a-tls-handshake/)

[AWS has another all-in-one guide](https://aws.amazon.com/what-is/ssl-certificate/) but it includes some AWS specific terms.

[HTTPS explained with carrier pigeons](https://baida.dev/articles/https-explained-with-carrier-pigeons)

## Further Info

- [Globe view of cables](https://www.reddit.com/r/educationalgifs/comments/ujqljl/the_global_submarine_fiber_optic_cable_network/)
- [HSTS - HTTP Strict Transport Security](https://www.reddit.com/r/sysadmin/comments/uixjuq/hsts_http_strict_transport_security_what_it_is/)