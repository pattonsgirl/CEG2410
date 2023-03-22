# Directory Services

Information structure / database containing information about users, devices, and resources

- [CyberArk - What is a Directory Service](https://www.cyberark.com/what-is/directory-services/)
- [Wikipedia - Directory Service](https://en.wikipedia.org/wiki/Directory_service)

## LDAP

LDAP = Lightweight Directory Access Protocol

> LDAP specifies a method of directory storage that allows for adding, deleting, and modifying records, and it enables the search of those records to facilitate both authentication and authorization of users to resources. 

All directory services utilize LDAPv3 (+ some other protocols that have been creating in conjunction to address special needs)

LDAP organizes information in a hierarchical structure: a Directory Information Tree (DIT)

![Jumpcloud - Sample DIT](https://jumpcloud.com//wp-content/uploads/2022/05/2.1.png)

LDAP protocol both authenticates and authorizes a user and the resource they are accessing.
- To authenticate, the user provides username and password - the client asks the LDAP server if the credentials match
- Authenticated does not mean authorized
- Users can belong to different groups with different permissions to resources (clients)

We have "grown" past the LDAP core - there are newer protocols for authentication, for example, but the structure defined by LDAP carries forward.

Some common LDAP terms:

### Entry

Items (user or machine) stored in the directory

Items are referred to by their **Common Name (CN)** - for a user, a CN might be a first name + last name.

Items are uniquely identified by their **Distinguished Names (DNs)** 

```
cn=Peter Gibbons,ou=IT,ou=People,dc=Initech,dc=com
```

Reads as Common Name Peter Gibbons of Organizational Unit IT of Organization Unit People of Domain Controller Initech.com

### Attribute

Attributes describe features of objects in the directory.

For a user object, a list of possible attributes would be email, password, office, phone number, etc.

### Schema

Schema are usually predefined, but usually involve the common set of attributes an object should have.

### Resources

- [JumpCloud - What is LDAP](https://jumpcloud.com/blog/what-is-ldap)
- [Wikipedia - Lightweight Directory Access Protocol](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol)
- [ldap.com A History & Technical Overview of LDAP](https://ldap.com/a-history-and-technical-overview-of-ldap/)

What does working with an LDAP directory look like in its most basic form?
[openLDAP.org - Quick Start Guide](https://www.openldap.org/doc/admin26/quickstart.html)


## Active Directory

Most widely used directory service for enterprises.

AD built it's underlying structure on LDAP, but uses **Kerberos** for authentication.

Heavy reliance on on-premise, Windows focused environments.  Mac and Linux need additional services.

Editions of Windows Server - essentially AD editions:
- Windows Server 2022
- Windows Server 2019
- Windows Server 2016
- Windows Server 2012 R2
- Windows Server 2012

Tools within AD:
- Active Directory Administrative Center (Introduced with Windows Server 2012 and above)
- Active Directory Users and Computers
- Active Directory Domains and Trusts
- Active Directory Sites and Services
- ADSI Edit
- Local Users and Groups
- Active Directory Schema snap-ins for Microsoft Management Console (MMC)
- SysInternals ADExplorer

Terminology of Active Directory from [Understanding the AD Logical Model](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/understanding-the-active-directory-logical-model):

**Forest**  
A forest is a collection of one or more AD domains that share a common logical structure, directory schema (class and attribute definitions), directory configuration (site and replication information), and global catalog (forest-wide search capabilities). Domains in the same forest are automatically linked with two-way, transitive trust relationships.
- [Varonis - AD Forests and Trust](https://www.varonis.com/blog/active-directory-forest)

**Domains & Domain Controllers**  
A domain is a partition in an Active Directory forest. Partitioning data enables organizations to replicate data only to where it is needed.
- Domain controllers store user accounts and credentials
- Domain controllers provide authentication & authorization
- Domains can extend authentication services to users in domains outside their own forest by means of trusts.
- Domain controllers can be added as peers within a domain to provide replication

A server running the Active Directory Domain Service (AD DS) role is called a **domain controller**. It authenticates and authorizes all users and computers in a Windows domain type network, assigning and enforcing security policies for all computers, and installing or updating software. 

**Organizational Units**  
OUs are used to group objects for administrative purposes such as the application of Group Policy or delegation of authority.

**Objects**  
Each object represents a single entity—whether a user, a computer, a printer, or a group—and its attributes. Certain objects can contain other objects. An object is uniquely identified by its name and has a set of attributes—the characteristics and information that the object represents— defined by a schema, which also determines the kinds of objects that can be stored in the Active Directory.  

The objects fall into two broad categories: resources (e.g., printers) and security principals (user or computer accounts and groups). Security principals are assigned unique security identifiers (SIDs).

### Resources for Exploring AD

- [Wikipedia - Active Directory](https://en.wikipedia.org/wiki/Active_Directory)
- [Learn Active Directory in a Month of Lunches](https://www.manning.com/books/learn-active-directory-management-in-a-month-of-lunches)
- [Learn PowerShell in a Month of Lunches](https://www.manning.com/books/learn-powershell-in-a-month-of-lunches)

## Cloud Directory Services - Identity & Access Management

aka. Identity as a Service (IaaS)

Focus on authentication + authorization. 

It's kind of typical for AD controller to be on an internal network, which means resources created in the cloud (for example) can't use the controllers to authenticate.  AD's other downside is lack of support outside of Windows environments.  But in addition, even Microsoft came out with some great services, like Microsoft 365.  

We are in a place where orgs use both on-premise and cloud directory services (hybrid) 

- [Azure AD](https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-whatis)
    - [Azure AD vs AD features & scope](https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-compare-azure-ad-to-ad)
- [AWS AD](https://aws.amazon.com/directoryservice/)
- [JumpCloud](https://jumpcloud.com/)
    - JumpCloud is more a Directory as a Service (DaaS)
- [Okta](https://www.okta.com/)
    - [Auth0](https://auth0.com/)

What about the ability to sign in "with Google/ Facebook/ Apple..."?  Check out [OpenID Connect](https://openid.net/connect/)