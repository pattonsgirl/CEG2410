## Setup & Basic Tour

### Domains, Trees, and Forests
- [Video](https://www.youtube.com/watch?v=7xOUsirYLYU&ab_channel=JohnChristopher)

### Install AD DS with PowerShell: 
- [How to Install AD DS](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/deploy/install-active-directory-domain-services--level-100-)

### Use Server Manager to set system as Domain Controller:
- [How to Install AD in Windows Server 2019 Server Manager](https://petri.com/how-to-install-active-directory-in-windows-server-2019-server-manager/)
- [Step-By-Step : How to install and configure Domain Controller on Windows Server 2019](https://www.virtualgyanis.com/post/step-by-step-how-to-install-and-configure-domain-controller-on-windows-server-2019)
- [ServerSpace - Installing AD on Windows Server 2019](https://serverspace.io/support/help/installing-active-directory-on-windows-server-2019/)
    - My favorite, but skips static IP & PC rename (first link calls out need)

### AD Ports & Firewalls:
- [Microsoft - Configure Firewall for AD Domains & Trusts](https://learn.microsoft.com/en-us/troubleshoot/windows-server/identity/config-firewall-for-ad-domains-and-trusts)

### Best Practices for AD Structure

- [Group Policy Central - Active Directory Structure Guidelines](https://www.grouppolicy.biz/2010/07/best-practice-active-directory-structure-guidelines-part-1/)
- [Microsoft - Design Considerations for Organizational Unit Structure and Use of Group Policy Objects](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc785903(v=ws.10)?redirectedfrom=MSDN)
- [Group Policy Central - Group Policy Design Guidelines](https://www.grouppolicy.biz/2010/07/best-practice-group-policy-design-guidelines-part-2/)
- [Active Directory Organizational Units – Best Practices for OUs!](https://www.tenfold-security.com/en/organizational-unit/)

### Organizational Units (OU):
- [IT Bros - AD OUs Ultimate Guide](https://theitbros.com/active-directory-organizational-unit-ou/)
- [Microsoft - Delegating Administration of Account OUs and Resource OUs](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/delegating-administration-of-account-ous-and-resource-ous?source=recommendations)
- [IT Bros - How to delegate Active Directory permissions to the Organizational Units?](https://theitbros.com/active-directory-organizational-unit-ou/#How_to_delegate_Active_Directory_permissions_to_the_Organizational_Units)

### Users & Computers:
- [Active Directory Pro - How to Create New AD User Account](https://activedirectorypro.com/how-to-create-a-new-active-directory-user-account/)
- [Active Directory Pro - Add Users to AD Groups](https://activedirectorypro.com/add-users-to-active-directory-groups/)
- [Adam the Automater - Add Computer to Domain](https://adamtheautomator.com/add-computer-to-domain/)
- [Microsoft - Join a Computer to a Domain](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/deployment/join-a-computer-to-a-domain)
    - [Microsoft - Troubleshoot Errors Joining Computer to Domain](https://learn.microsoft.com/en-us/troubleshoot/windows-server/identity/troubleshoot-errors-join-computer-to-domain)
    - [TechNews Today - Remove Computer from Domain](https://www.technewstoday.com/remove-computer-from-domain/)
    - [Digital Citizen - WORKGROUP vs Network Domain](https://www.digitalcitizen.life/workgroup-windows/)
    - [Magic Reddit Guide of hints](https://www.reddit.com/r/aws/comments/6z03h1/cant_join_ec2_windows_instance_to_active/)
- [Windows OS Hub - Restrict Workstation Logon to Set of AD Users](https://woshub.com/restrict-workstation-logon-ad-users/)
- [How to use the "Managed By" attribute](https://itworldjd.wordpress.com/2022/09/28/ad-usage-of-managed-by-attribute/)

### Groups:
- [IT Bros - AD Groups](https://theitbros.com/active-directory-groups/)
- [Microsoft - Understand Security Groups](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-groups)
- [IT Bros - Check Group Membership](https://theitbros.com/check-active-directory-group-membership/)
- [IT Bros - Privileged Groups in AD](https://theitbros.com/managing-privileged-groups-in-active-directory/)
- [IT Bros - How to add user to Remote Desktop Group?](https://theitbros.com/add-user-to-remote-desktop-group/)

#### Users, Computers, Groups, OUs Tutorial Videos
- [Video - How to Create OU, Users and Groups on Active Directory 2019](https://www.youtube.com/watch?v=cETbT22TWEE&ab_channel=MSFTWebCast)

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
- [Windows OS Hub - Changing Desktop Background Wallpaper in Windows through GPO](https://woshub.com/setting-desktop-wallpapers-background-using-group-policy/)

Troubleshooting:
- [HOW TO RESOLVE GROUP POLICY ERROR CODES 8007071A AND 800706BA](https://cloudcomputing.help/kb/how-to-resolve-group-policy-error-codes-8007071a-and-800706ba/)
- [How to use GPUpdate /Force Command to update your Group Policies](https://lazyadmin.nl/it/gpupdate-force-command/)

### GPO Videos
[Andy Malone - Windows Server 2019 Group Policy Explained](https://www.youtube.com/watch?v=BqAfgquDcj0&ab_channel=AndyMaloneMVP)
    - Is good, sometimes misinterprets what a GPO policy does by definition (just read the descriptions!)

## Kerberos

- https://www.fortinet.com/resources/cyberglossary/kerberos-authentication
- https://www.varonis.com/blog/kerberos-authentication-explained
- https://www.freecodecamp.org/news/how-does-kerberos-work-authentication-protocol/

## Bonus

### Windows Password Hashes
- https://hunter2.gitbook.io/darthsidious/getting-started/intro-to-windows-hashes
