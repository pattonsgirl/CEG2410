## Permissions Configuration

Now that your web server is serving two distinct sites, you must configure a secure way for different stakeholders to update content without granting full shell access to the server.

## To begin:

Identify the two web root directories you created in the previous assignment (e.g., `/var/www/main_site` and `/var/www/menu_site`).

Before creating users, ensure the parent directories of your web content roots are owned by `root:root` (meaning `root` is the owner and `group` associated with the directories. There is no strict requirement on `other` - but remember `www-data` will fall into `other`). This is a strict requirement for the SSH "Chroot" (jail) security feature you will be implementing.

## What to set up

1. User Structure Plan

Before running any commands, define your user and group strategy. You need to account for three types of access:

- Business Owner: Needs access to both the main site and the menu site.
- Tech Help: Needs access to both the main site and the menu site.
- Menu Staff: Needs access only to the menu site.

2. Group & User Creation

- Create two Linux groups: one for full web admins and one specifically for menu-only staff.
- Create at least three users (e.g., owner, tech-support, and staff-member) using the useradd command.
    - Requirement: Users must be created with the -M flag (no home directory) and have their shell set to `/usr/sbin/nologin`.
    - Requirement: Users must be authenticated via passwords.

3. The SFTP Jail (Chroot)

- Modify `/etc/ssh/sshd_config` to create `Match Group` blocks.
- Configure the server so that when these users connect via SFTP:
    - They are restricted (jailed) to their respective site directories.
    - They cannot "CD" up into the system root.
    - Standard SSH shell access is denied (they should only be able to use SFTP).
    - They are automatically directed to the `public_html` (or equivalent) subfolder upon login.
    - Users may nagivate to view other content directories, but may not edit unless they are the member of an appropriate group.

4. Directory Permissions

- Set the ownership and permissions so that members of the appropriate groups can upload, delete, and edit files within the web roots.
- Ensure the Apache / Nginx service (usually `www-data`) can still read the files to serve them to the web.

## Documentation

In your `web` folder on GitHub, create a new file named `permissions.md`. Your writeup must include:

1. User Access Matrix

- Create a table showing your users, which groups they belong to, and which directories they have permission to edit.

2. Command Logic

- Explain the difference between `useradd -m` and `useradd -M`. Why did we choose `-M` for this scenario?
- Explain the purpose of setting the shell to `/usr/sbin/nologin`.

3. SSH Configuration Explained

- Provide a snippet of your Match Group configuration from `sshd_config`.
- Explain what `ChrootDirectory` does and the specific ownership requirement (root-owned) that makes it work.
- Explain the `ForceCommand internal-sftp` directive.

4. Testing & Logs

- Show a screenshot or command output of a successful SFTP login.
- Show a screenshot of a denied SSH shell login attempt for one of these users.
- Provide the tail of `/var/log/auth.log` (or `journalctl -u ssh`) showing a successful SFTP session establishment.

5. Permission Verification

- Provide the output of `ls -la` for your web root directories, explaining how the owner and group settings allow the users to work while keeping the "jail" secure.

## Extra credit - Persistent Permissions & Collaboration (SGID)

In a real-world scenario, if the Business Owner creates a new html file via SFTP, the Tech Help user might not be able to edit it, and the Apache / Nginx service might not be able to read it. To solve this, you must implement Set Group ID (SGID) and understand Default ACLs.

The Task:
1. Configure the SGID Bit:

- Apply the `s` bit to the `public_html` (or equivalent) directories for both sites.
- Goal: Ensure that any new file created inside these folders automatically inherits the group ownership of the parent folder (e.g., web-admins or menu-staff), regardless of who uploads it.

2. Implement Default ACLs (Access Control Lists):

- Install the `acl` package if not present.
- Use setfacl to define "Default" permissions on the web root directories.
- Goal: Ensure new files are automatically created with `rw-` (read/write) permissions for the group, preventing the "Permission Denied" errors that occur when one user tries to edit another's upload.

3. Documentation Requirements for Extra Credit:
- Provide the specific chmod command used to set the SGID bit (e.g., the symbolic or octal method).
- Explain the difference between standard Linux permissions and Access Control Lists (ACLs).
- Proof of Persistence: 
    - Log in as the owner and create a file.
    - Show a screenshot or command output (ls -la) proving that the file was created with the correct group ownership and write permissions for others in that group.

## Rubric

Your `permissions.md` should include all of the following required elements:

- [ ] A user/group access plan for Business Owner, Tech Help, and Menu Staff
- [ ] Linux groups and users created with `useradd -M` and `/usr/sbin/nologin`
- [ ] SSH `Match Group` configuration with `ChrootDirectory` and `ForceCommand internal-sftp`
- [ ] Directory ownership and permissions configured for secure SFTP access
- [ ] Evidence of successful SFTP login and denied shell login
- [ ] Command output showing `ls -la` for web root directories with explanation
- [ ] Extra credit: SGID bit configured for persistent group ownership
- [ ] Extra credit: Default ACLs configured to preserve group read/write permissions on new files

## Submission

Submit a link in Pilot to your course GitHub repository with your permissions documentation.