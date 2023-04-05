## Setup & Basic Tour

### Install AD DS with PowerShell: 
- [How to Install AD DS](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/deploy/install-active-directory-domain-services--level-100-)

### Use Server Manager to set system as Domain Controller:
- [How to Install AD in Windows Server 2019 Server Manager](https://petri.com/how-to-install-active-directory-in-windows-server-2019-server-manager/)
- [ServerSpace - Installing AD on Windows Server 2019](https://serverspace.io/support/help/installing-active-directory-on-windows-server-2019/)
    - My favorite, but skips static IP & PC rename (first link calls out need)
- [Set up Domain Controller in PowerShell](https://social.technet.microsoft.com/wiki/contents/articles/52765.windows-server-2019-step-by-step-setup-active-directory-environment-using-powershell.aspx)

### AD Ports & Firewalls:
- [Microsoft - Configure Firewall for AD Domains & Trusts](https://learn.microsoft.com/en-us/troubleshoot/windows-server/identity/config-firewall-for-ad-domains-and-trusts)

### Organizational Units (OU):
- [IT Bros - AD OUs Ultimate Guide](https://theitbros.com/active-directory-organizational-unit-ou/)

### Users & Computers:
- [Active Directory Pro - How to Create New AD User Account](https://activedirectorypro.com/how-to-create-a-new-active-directory-user-account/)
- [Active Directory Pro - Add Users to AD Groups](https://activedirectorypro.com/add-users-to-active-directory-groups/)
- [Adam the Automater - Add Computer to Domain](https://adamtheautomator.com/add-computer-to-domain/)
- [Microsoft - Join a Computer to a Domain](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/deployment/join-a-computer-to-a-domain)
    - [Microsoft - Troubleshoot Errors Joining Computer to Domain](https://learn.microsoft.com/en-us/troubleshoot/windows-server/identity/troubleshoot-errors-join-computer-to-domain)
    - [TechNews Today - Remove Computer from Domain](https://www.technewstoday.com/remove-computer-from-domain/)
    - [Digital Citizen - WORKGROUP vs Network Domain](https://www.digitalcitizen.life/workgroup-windows/)
- [Windows OS Hub - Restrict Workstation Logon to Set of AD Users](https://woshub.com/restrict-workstation-logon-ad-users/)

### Groups:
- [IT Bros - AD Groups](https://theitbros.com/active-directory-groups/)
- [Microsoft - Understand Security Groups](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-groups)
- [IT Bros - Check Group Membership](https://theitbros.com/check-active-directory-group-membership/)
- [IT Bros - Privileged Groups in AD](https://theitbros.com/managing-privileged-groups-in-active-directory/)

### Group Policy Objects (GPO):  
Computer-related policies specify:
- system behavior
- application settings
- security settings
- assigned applications
- computer startup and shutdown scripts
User-related policies specify:
- system behavior
- application settings
- security settings
- assigned and published applications
- user logon and logoff scripts
- folder redirection

Be aware that computer-related settings override user-related settings.  

GPO order of policy application:
- LSDOU order: local, site, domain, organization unit (OU). 
1. the policy on the local computer gets processed. 
2. Active Directory policies from the site level to the domain. 
3. Organizational unit: GPOs that are nested within organizational units apply from the closest OU to the root, then continue outwards from there. If any conflicts arise, the last applied policy will take precedence and effect. 
- [Varonis - Group Policy Objects](https://www.varonis.com/blog/group-policy-objects)
- [IT Bros - Add User to RDP Group](https://theitbros.com/add-user-to-remote-desktop-group/)

## PowerShell + AD

## Kerberos

- https://www.fortinet.com/resources/cyberglossary/kerberos-authentication
- https://www.varonis.com/blog/kerberos-authentication-explained
- https://www.freecodecamp.org/news/how-does-kerberos-work-authentication-protocol/

## Bonus

### Windows Password Hashes
- https://hunter2.gitbook.io/darthsidious/getting-started/intro-to-windows-hashes