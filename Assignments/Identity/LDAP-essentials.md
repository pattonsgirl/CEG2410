# LDAP Server

Give a good name, don't get tangled
`sudo hostnamectl set-hostname ldap-serv`

What ports are needed? `389` inbound on server. Be checking NACLs and Security Groups

Packages: `slapd`, `ldap-utils`

In case of reconfiguration: `sudo dpkg-reconfigure slapd`

## Configuration options

The Configuration Menus:

1. Administrator Password: You will be asked to set a password for the LDAP admin. Do not lose this. This is the password for the cn=admin account used in your ldapadd commands later.
    - Note: If the installer doesn't ask for details like the domain name, you can force the full menu with: sudo dpkg-reconfigure -plow slapd.
2. Omit LDAP server configuration? Select No.
3. DNS Domain Name: Enter class.local. This defines your base as dc=class,dc=local.
4. Organization Name: You can enter Class or your name.
5. Database Backend: Select MDB (the modern standard).
6. Remove database when slapd is purged? Usually No.
7. Move old database? Select Yes.

## Load it up:

`base-ou-structure.ldif`
```
dn: ou=people,dc=wsukduncan,dc=com
objectClass: organizationalUnit
ou: people

dn: ou=groups,dc=wsukduncan,dc=com
objectClass: organizationalUnit
ou: groups

dn: ou=dept1,ou=people,dc=wsukduncan,dc=com
objectClass: organizationalUnit
ou: dept1

dn: ou=dept2,ou=people,dc=wsukduncan,dc=com
objectClass: organizationalUnit
ou: dept2

dn: ou=admins,ou=people,dc=wsukduncan,dc=com
objectClass: organizationalUnit
ou: admins

dn: ou=disabledusers,dc=wsukduncan,dc=com
objectClass: organizationalUnit
ou: disableduser
```
Add base organization (OUs):
`sudo ldapadd -x -D cn=admin,dc=wsukduncan,dc=com -W -f basedn.ldif`

`users.ldif`
```
dn: uid=tester,ou=people,dc=wsukduncan,dc=com
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: tester
sn: User
givenName: Test
cn: Test User
uidNumber: 10011
gidNumber: 10020
userPassword: {password456}
homeDirectory: /home/tester
loginShell: /bin/bash
```

Add base users:
`sudo ldapadd -x -D cn=admin,dc=wsukduncan,dc=com -W -f users.ldif`

## Test if things are working

DUMP ALL: `ldapsearch -x -LLL -b dc=wsukduncan,dc=com`

Something specific: `ldapsearch -x -b "dc=wsukduncan,dc=com" "(uid=tester)"`

Test network communication: `sudo ldapsearch -x -b dc=wsukduncan,dc=com -H ldap://10.0.1.110:389`

# LDAP Client

Good name
`sudo hostnamectl set-hostname ldap-client`

Checkout outbound traffic is good to go

Packages: `libnss-ldap`, `libpam-ldap`, and `ldap-utils`
Reminder: You might to create a NAT Gateway, attached to VPC, and configure route table rules

In case of reconfiguration: `sudo dpkg-reconfigure ldap-auth-config`

## Menu options guide:

A series of screens will appear:

1. LDAP server URI: Change this to ldap://[Your_Server_IP]. Do not use localhost.
2. Distinguished name of the search base: Enter dc=class,dc=local
3. LDAP version: Select 3.
4. Make local root Database admin: Select Yes.
5. Does the LDAP database require login? Select No.
6. LDAP admin account: Leave as is or enter cn=admin,dc=class,dc=local

## Checking for communication:

`ldapsearch -x -H ldap://10.0.1.110 -b "dc=wsukduncan,dc=com" "(uid=Mick.Jagger)"`

## Confirming your settings:

Check config file: `cat /etc/ldap.conf`

Add to **OTHER** config file: `cat /etc/ldap/ldap.conf`
```
BASE    dc=wsukduncan,dc=com
URI     ldap://10.0.1.110
```

Test for a response: `ldapsearch -x -b "dc=wsukduncan,dc=com" "uid=tester"`

## Changing Nameservice

`/etc/nsswitch.conf`
```
passwd:         files systemd ldap
group:          files systemd ldap
shadow:         files systemd ldap
```
