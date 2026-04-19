## The Digital Phonebook (Introduction to LDAP)

Your small business is tired of resetting passwords on five different computers every time a new employee starts. You are going to build a Centralized Directory—a single "source of truth" where you create a user once, and every other system can "look them up." This assignment introduces LDAP (Lightweight Directory Access Protocol) through practical, hands-on implementation.


### Learning Objectives

- Install and configure the OpenLDAP service
- Create organizational structure (OUs) for user and group management
- Manage user accounts using LDIF (LDAP Data Interchange Format) files
- Query directory information using LDAP search tools

---

### Part 1: Foundation & Installation

Install the LDAP server software and verify basic functionality.

**Tasks:**
- Install `slapd` (the LDAP server) and `ldap-utils` (command-line tools)
- During installation, configure DNS domain: `class.local`
  - This automatically creates the base: `dc=class,dc=local`
- Verify installation: Run `ldapsearch -x -LLL` to see the empty directory structure

---

### Part 2: Organizational Structure (OUs)

Create the "folders" of your directory—Organizational Units for People and Groups.

**Task:** Create `structure.ldif` file with the following content:

```text
dn: ou=People,dc=class,dc=local
objectClass: organizationalUnit
ou: People

dn: ou=Groups,dc=class,dc=local
objectClass: organizationalUnit
ou: Groups
```

**Action:** Load the structure into LDAP:
```
ldapadd -x -D "cn=admin,dc=class,dc=local" -W -f structure.ldif
```

---

### Part 3: User Management

Add user accounts to the People container.

**Task:** Create `users.ldif` with two accounts (yourself and a test user):

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

**Action:** Add users to the directory:
```
ldapadd -x -D "cn=admin,dc=class,dc=local" -W -f users.ldif
```

---

### Part 4: Querying the Directory

Verify that users and OUs can be found using LDAP search.

**Task:** Use `ldapsearch` to find your test user by username:
```
ldapsearch -x -b "dc=class,dc=local" "(uid=student1)"
```

---

## Documentation Requirements

Your submission should include the following:

1. Link to in repository or copy in `.md` with brief explanation of contents of `structure.ldif` and `users.ldif`
2. **Screenshot 1:** Output of `ldapsearch` showing both OUs (People and Groups) successfully created
3. **Screenshot 2:** Output of `ldapsearch` showing your own user account successfully added to the directory
4. **Written Response (1-2 sentences):** Explain the benefit of centralized directory management: *"If I delete a user from this LDAP server, why is that better than deleting them from five individual computers?"*

---

## Rubric

Your submission should include all of the following elements:

- [ ] LDAP server successfully installed and verified with `ldapsearch`
- [ ] `structure.ldif` correctly defines OUs, `users.ldif` places users in OUs and uses attributes
- [ ] Both OUs appear in directory search results (Screenshot)
- [ ] Minimum two user accounts created and searchable (Screenshot)
- [ ] Written explanation demonstrates understanding of centralized management benefits
