## LDAP Authentication Configuration

Now that you have a centralized directory service running, it's time to put it to work. In this assignment, you will configure a Linux client machine to authenticate users against your LDAP server. This means that instead of managing local user accounts on every computer, users can log in with their directory credentials.

**Real-World Context:** System administrators use LDAP authentication across Unix/Linux networks to centralize user management—when a user is hired, they get *one* login that works on every system without administrators having to create accounts on each machine.

**Key Concepts:**
- **NSS (Name Service Switch):** Tells the system where to look for user information
- **PAM (Pluggable Authentication Modules):** Handles the actual authentication process
- **LDAP Client Libraries:** The software that communicates with the LDAP server

---

### Learning Objectives

- Configure LDAP client libraries on a Linux system
- Understand NSS and how services query for user information
- Configure PAM to authenticate users against LDAP
- Test LDAP authentication by logging in with directory credentials
- Diagnose common LDAP authentication issues

---

### Part 1: Set Up the LDAP Client Environment

On a second Linux machine (your "test client"), install and configure the LDAP client libraries.

**Tasks:**
- Install LDAP client packages: `libnss-ldap`, `libpam-ldap`, and `ldap-utils`
- Create an `/etc/ldap/ldap.conf` configuration file pointing to your LDAP server
  - **Base DN:** `dc=class,dc=local`
  - **LDAP Server URI:** `ldap://<LDAP_SERVER_IP>:389` (replace with your server's IP)
- Test the connection by running a query from the client:
  ```
  ldapsearch -x -b "dc=class,dc=local" "uid=student1"
  ```
  - Verify you can see user records from the LDAP server

---

### Part 2: Configure NSS (Name Service Switch)

Configure the system to query LDAP for user and group information.

**Task:** Edit `/etc/nsswitch.conf` to tell the system to check LDAP as a source for users and groups.

**Key Lines to Modify:**
```
passwd:   files ldap
shadow:   files ldap
group:    files ldap
```

**Verification:**
- Run `getent passwd student1` to retrieve the LDAP user from the client machine
- Run `id student1` to verify that the LDAP user is recognized
- Example output: `uid=10001(student1) gid=10001(student1) groups=10001(student1)`

---

### Part 3: Configure PAM for LDAP Authentication

Configure the Pluggable Authentication Modules system to allow login with LDAP credentials.

**Task:** Update PAM configuration files to support LDAP authentication. The exact steps depend on your Linux distribution:

**For Ubuntu/Debian:**
- During installation of `libpam-ldap`, the system will ask for LDAP configuration
- Or manually edit `/etc/pam.d/common-auth` to include LDAP as an authentication source
- Add a line similar to:
  ```
  auth  sufficient  pam_ldap.so
  ```

**Verification:**
- Check the PAM configuration by examining `/etc/pam.d/common-auth` or `/etc/pam.d/system-auth`
- Confirm that `pam_ldap` appears in the authentication chain

---

### Part 4: Test LDAP Authentication

Test that an LDAP user can actually log in to the client system.

**Task:** Attempt to log in as an LDAP user.

**Method 1 - Switch User:**
```
su - student1
```
When prompted, enter the password you set in the LDAP directory (e.g., `password123`).

**Method 2 - Remote Login (if SSH is configured):**
```
ssh student1@<CLIENT_IP>
```

**Success Indicators:**
- The login succeeds with the LDAP password
- The shell prompt appears (e.g., `student1@client:~$`)
- The home directory path is correct (`/home/student1`)
- Running `whoami` returns `student1`

**Troubleshooting:**
- If login fails, check PAM logs: `journalctl -u systemd-logind`
- Verify LDAP connectivity on the client: `ldapsearch -x -b "dc=class,dc=local"`
- Confirm NSS is working: `getent passwd student1`

---

## Documentation Requirements

Your submission should include the following:

1. **Screenshot 1:** Output of `getent passwd student1` from the client machine showing the LDAP user is visible
2. **Screenshot 2:** Output of `id student1` from the client machine showing the LDAP user is recognized
3. **Screenshot 3:** Evidence of successful LDAP login (e.g., shell prompt showing you are logged in as `student1`, or `whoami` output)
4. **Configuration File - `/etc/ldap/ldap.conf`:** Provide the contents of your LDAP client configuration
5. **Configuration File - `/etc/nsswitch.conf`:** Provide the relevant lines (passwd, shadow, group, hosts) showing LDAP is configured
6. **Brief Written Explanation (2-3 sentences):** Describe one troubleshooting step you took if something didn't work initially, or explain why centralized authentication is valuable compared to managing local accounts on each machine

---

## Rubric

Your submission should include all of the following elements:

- [ ] LDAP client libraries installed and configured on a separate Linux machine
- [ ] `/etc/ldap/ldap.conf` correctly points to the LDAP server and base DN
- [ ] LDAP connectivity verified with `ldapsearch` from the client machine
- [ ] NSS configured to query LDAP (`getent passwd` returns LDAP users)
- [ ] PAM configured to authenticate against LDAP
- [ ] Successful login as an LDAP user demonstrated (Screenshot 3)
- [ ] All required configuration files provided
- [ ] Written explanation includes either troubleshooting steps or explanation of centralized authentication benefits
