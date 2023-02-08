# NGINX

## Host Multiple Sites

The real term for hosting multiple sites on one server is virtual hosts.

The trick here is that to request a unique site, you need to refer to it's server name (which in the config files refers to a unique folder with that site's content).  To make this happen, you need to configure [`etc/hosts` on your system](https://linuxize.com/post/how-to-edit-your-hosts-file/).  Yes, Windows has this file too.

My time got spent here because I forgot to restart `nginx` after enabling my sites.

- [DigitalOcean guide](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04)
- [webdock.io guide](https://webdock.io/en/docs/how-guides/shared-hosting-multiple-websites/how-configure-nginx-to-serve-multiple-websites-single-vps)

Why should you look through this?  It's a low scale example of how sites like Heroku do it - you upload a site, you bring a domain name, and you call it a day.  Their beefy servers handle concurrency (speed of access).

## Configure TLS on NGINX

I like the guide below - it covers creating a self-signed cert with `openssl` to configuring NGINX to use it and redirecting HTTP requests.  It will have some additional things it recommends configuring beyond the scope to your project.  All I ask for this project is that you enable HTTPS.  There are a lot of other security settings that can be configured, but you can carefully ignore things outside of getting the server to use TLS.

- [Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-on-centos-7)

# Apache2

## Host Multiple Sites

Configure Virtual Hosts

- [webdock.io guide](https://webdock.io/en/docs/articles/how-configure-apache-to-serve-multiple-websites-single-vps)

## Configure TLS on Apache2

The guide below covers creating a self-signed cert with `openssl` to configuring Apache2 to use it and redirecting HTTP requests.  Depending on how comfortable you feel with what you are creating, you'll see room to simplify a few steps (like append to the default configuration file instead of making a new one).  Be careful of how much it suggests to type `ufw` things...

- [DigitalOcean - create self-signed cert and enable TLS on Apache2](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-ubuntu-16-04)

# Firewalls

## iptables

`iptables` exist by default on Linux OS's.  Most other firewall tools are just overlay's for `iptables` (`ufw` is a good example).  

By default, they have an INBOUND policy to ACCEPT.  If you change it to DENY, all traffic regardless of port will be denied, unless you set an ALLOW chain.

The OUTBOUND policy is also set to ACCEPT.  You do not need to modify OUTBOUND rules for this course, but a good case to need to would be to DENY access to certain sites.

- [iximiuz - illustrated guide to iptables](https://iximiuz.com/en/posts/laymans-iptables-101/)
- [DigitalOcean - common iptables firewall rules](https://www.digitalocean.com/community/tutorials/iptables-essentials-common-firewall-rules-and-commands)

## ufw

Uncomplicated Firewalls (`ufw`) are sneaky.  They are pretty and straightforward, but keep track of the order you create allow rules and don't `enable` `ufw` until you have rules in place to keep your connection alive.

- [DigitalOcean - common ufw rules](https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands)

Note this straight from the guide below:

By default, when **enabled UFW will block external access to all ports on a server**. In practice, that means if you are connected to a server via SSH and enable `ufw` before allowing access via the SSH port, you’ll be disconnected. Make sure you follow the section on how to enable SSH access of this guide before enabling the firewall if that’s your case.

In other words [**allow SSH before you enable ufw rules**](https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands#allow-ssh)

