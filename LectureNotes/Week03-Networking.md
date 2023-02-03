# Networking

- [IPv4 vs IPv6](https://bluecatnetworks.com/blog/ipv4-vs-ipv6-whats-the-difference/)
- [Mozilla - How the Internet Works](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/How_does_the_Internet_work)
    - This is actually great.  Mozilla in general is great

## Machine to Network

A network capable device (laptop, PC, NestHub) has one or more Network Interface Cards (NICs)

Each NIC is uniquely connected to a network.  A device can be connected to multiple networks. 

Each NIC has a unique Media Access Control Address (MAC) that uniquely identifies it from all other devices.  If you buy 60 HP laptops, they may all have Realtek wireless NICs, but each card will have a unique NIC.  Fun fact, since these aren't randomly generated, if ordered in bulk like this, the addresses may even be sequential!

Virtual Network Adapters are a thing - if you have installed a VMM (VirtualBox, Hyper-V, etc.) your device also hosts a virtual network for it to connect to.

The NIC is what is actually given information about connecting to the network.

As far as what connects you to a network, there's options:
- Wi-Fi (WLAN)
    - 2.4 GHz & 5 GHz are used most commonly
    - Check out the rules of [frequency ranges for Wi-Fi](https://en.wikipedia.org/wiki/List_of_WLAN_channels)
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

First, [what is a domain name](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_domain_name) - it is a string of parts separated by dots read from **right** to **left**.  The "end" part (`.com`, `.edu`, `.io`, etc.) is the [Top Level Domain (TLD)](https://www.cloudflare.com/learning/dns/top-level-domain/) that tells users the general purpose of the service behind the domain name. The [ICANN / IANA maintained list of TLDs is here](https://www.icann.org/resources/pages/tlds-2012-02-25-en).

The label before the TLD is the Secondary Level Domain (SLD).  For any domain, there can be additional subdomains.

Examples: 
- Given `wright.edu`, `.edu` is the TLD, `wright` is the SLD.
- Given `wings.wright.edu`, `wings` is a subdomain of `wright`

Domain names are not "owned", but "leased" for one or more years.  **Registrars** use domain name registries to keep track of technical and administrative information connecting you to your domain name.

**Domain Name System (DNS)** is the lookup system you rely on.  Instead of remembering IP addresses of everything you want to connect to, you use the hostname.  You are usually given a first lookup DNS, where a cache is kept of last seen IP to hostname correlations.  If it hasn't seen it, you are passed to the next up the chain until a full query is made (i.e. you are the first to have looked up that hostname in your region).  [Check out the DNS flow](https://www.cloudflare.com/learning/dns/what-is-dns/)
- [Types of DNS Records](https://www.cloudflare.com/learning/dns/dns-records/) also matter.  You should familiarize yourself with:
    - `A` - holds IPv4 address of a domain
    - `AAAA` - holds the IPv6 address of a domain
    - `CNAME` - forwards one domain or subdomain to another domain, does NOT provide an IP address
    - `MX` - directs mail to an email server
- Once you get an IP address of the domain / hostname you are connecting to, you can address the packet to the correct destination.
- [Samples of DNS entries](https://support.dnsimple.com/articles/common-dns-records/)

For this course, you should understand an overview of how DNS works.  Some articles I recommend are below:
- [Networld - What is DNS and how does it work](https://www.networkworld.com/article/3268449/what-is-dns-and-how-does-it-work.html)
- [How DNS Works - web comic style](https://howdns.works/)
- Note: The Linux / Unix Administration handbook dedicates a whopping 100 pages to DNS alone.

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

First, make sure you get the [difference between webpages, websites and webservers](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/Pages_sites_servers_and_search_engines)

Let's assume you packet has made it to its destination - a server.  Some things to note:
- A server can do more than one function.  The program / service is listening over a port.
- THe services on the server use protocols to define how to read and respond to your request
- Modern websites often use a reverse proxy, commonly known as a load balancer.  You connect to the reverse proxy, which then determines which of a set of backend servers services your request.
    - See CEG 3120 if curious

At this moment, you are just focusing on [what a web server is](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_web_server) and how it works.

Hypertext Transfer Protocol Secure (HTTPS) layers TLS encryption over HTTP.  HTTP is just a protocol for fetching resources such as HTML documents
- See [protocol video](https://www.youtube.com/watch?v=d-zn-wv4Di8&t=4s&ab_channel=LiveOverflow) for nice visual
- [Mozilla - HTTP Overview](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview)
- [Cloudflare - HTTP Protocol](https://www.cloudflare.com/learning/ddos/glossary/hypertext-transfer-protocol-http/)

The encryption protocol is Transport Layer Secure (TLS).  TLS is an update to Secure Socket Layer (SSL) - SSL is outdated, but you still see it used in some documentation, although they probably meant TLS (old habits die hard).

TLS provides three key major peace-of-mind features:
1. Authentication - lets each party to the communication verify that the other party is who they claim to be.
2. Encryption - data is encrypted while being transmitted between the user agent and the server, in order to prevent it from being read and interpreted by unauthorized parties.
3. Integrity - TLS ensures that between encrypting, transmitting, and decrypting the data, no information is lost, damaged, tampered with, or falsified.

Get an understanding of HTTPS: 
- [Cloudflare - What is HTTPS](https://www.cloudflare.com/learning/ssl/what-is-https/)
- [HTTPS explained with carrier pigeons](https://baida.dev/articles/https-explained-with-carrier-pigeons)

What is TLS and how does it work:
- [Mozilla - TLS](https://developer.mozilla.org/en-US/docs/Web/Security/Transport_Layer_Security)
- [Cloudflare - What happens in a TLS handshake](https://www.cloudflare.com/learning/ssl/what-happens-in-a-tls-handshake/)
- [SSL.com - SSL/TLS Handshake - good diagram](https://www.ssl.com/article/ssl-tls-handshake-overview/)

Understanding TLS Certificates & **Certificate Authorities**: 
- [Steve's Internet Guide - SSL Certificates Explained](http://www.steves-internet-guide.com/ssl-certificates-explained/)
- Know the three types of certificates:
    - Domain Validation (DV)
    - Organization Validation (OV)
    - Extended Validation (EV)
    - [Which to choose](https://www.digicert.com/dc/blog/how-to-choose-the-right-type-of-tls-ssl-certificate/)
- [Self-Signed vs CA Certificates](https://cheapsslsecurity.com/blog/self-signed-ssl-versus-trusted-ca-signed-ssl-certificate/)

Modify configuration files to use TLS:
- [Mozilla - SSL Configuration Generator](https://ssl-config.mozilla.org/#server=apache&version=2.4.41&config=modern&openssl=1.1.1k&guideline=5.6)
    - DO NOT copy this word for word.  Read what it is recommending, make good, slow decisions

As a piece of another conversation, there are a variety of response codes you should be aware of.  200, 404, and 500 / 503 are ones I see around, but you can [checkout all of them](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) and what they are meant to define.  These days you see these "hidden" by cutesy "Oops" pages with monkeys, but those are more like Easter eggs that hide things - like what is actually wrong and whose fault it is.

## Other fun digs

- [Globe view of cables](https://www.submarinecablemap.com/)
- [HSTS - HTTP Strict Transport Security](https://www.reddit.com/r/sysadmin/comments/uixjuq/hsts_http_strict_transport_security_what_it_is/)
- [What does `.io` mean?](https://www.hostinger.com/tutorials/what-does-io-mean)
- [How Web Browsers Work](https://web.dev/howbrowserswork/)
    - This thing is a monster.  Way outside the scope of this class, but great for those who want to take on Chrome / Firefox / Opera and do their own thing
- [Moving to HTTPS - migration guide](https://movingtohttps.com/)
- Read case studies (post damage reports) when things go wrong
    - [Facebook outage - October 2021](https://blog.cloudflare.com/october-2021-facebook-outage/)
