Got it. For a 2000-level course, we want to peel back the complexity. Instead of worrying about custom schemas or complex command-line flags, let’s focus on the "Phonebook" analogy: **Who are you, what group do you belong to, and can I find you?**

Here is a simplified, hands-on version of the Directory Foundation assignment.

---

## Assignment 1: The Digital Phonebook (Introduction to LDAP)

### **The Scenario**
Your small business is tired of resetting passwords on five different computers every time a new employee starts. You are going to build a **Centralized Directory**—a single "source of truth" where you create a user once, and every other system can "look them up."

### **Learning Objectives**
* Install the OpenLDAP service.
* Create a basic company structure (OUs).
* Add employees to the directory using simple text files (LDIFs).

---

### **Part 1: Setting the Foundation**
Students install the software. On a 2000-level, the goal is successful installation and service verification.

* **Task:** Install `slapd` (the LDAP server) and `ldap-utils` (the tools to talk to it).
* **The Setup:** During installation, students will be asked for a **DNS domain name**. Use: `class.local`.
    * This automatically creates the "Base" of their tree: `dc=class,dc=local`.
* **Verification:** Run `ldapsearch -x -LLL` to see the empty skeleton of the directory.

### **Part 2: Creating the "Folders" (OUs)**
Think of **Organizational Units (OUs)** as folders in a file cabinet. We need a folder for people and a folder for groups.

* **Task:** Create a file named `structure.ldif`.
* **The Content:**
    ```text
    dn: ou=People,dc=class,dc=local
    objectClass: organizationalUnit
    ou: People

    dn: ou=Groups,dc=class,dc=local
    objectClass: organizationalUnit
    ou: Groups
    ```
* **Action:** Run the command to "add" these folders:
    `ldapadd -x -D "cn=admin,dc=class,dc=local" -W -f structure.ldif`

### **Part 3: Adding Your First Users**
Now we put "People" into the "People" folder.

* **Task:** Create `users.ldif`. Students will create two users: one for themselves and one "Test User."
* **Key Concept:** Each person needs a **UID** (Username) and a **Common Name** (Full Name).
* **The Content (Simplified):**
    ```text
    dn: uid=student1,ou=People,dc=class,dc=local
    objectClass: inetOrgPerson
    objectClass: posixAccount
    objectClass: shadowAccount
    uid: student1
    sn: Lastname
    givenName: Firstname
    cn: Firstname Lastname
    displayName: Firstname Lastname
    uidNumber: 10001
    gidNumber: 10001
    userPassword: password123
    homeDirectory: /home/student1
    loginShell: /bin/bash
    ```

### **Part 4: The "Find" Test**
The most common task for a junior admin is finding a user's information.

* **Task:** Use the search tool to find your "Test User" by their username.
* **Command:** `ldapsearch -x -b "dc=class,dc=local" "(uid=student1)"`

---

### **Submission Requirements**
Keep it simple for grading:
1.  **A screenshot** of the `ldapsearch` results showing both OUs (People and Groups) created.
2.  **A screenshot** showing the successful addition of their own user account.
3.  **One sentence** explaining: *"If I delete a user from this LDAP server, why is that better than deleting them from five individual computers?"*
