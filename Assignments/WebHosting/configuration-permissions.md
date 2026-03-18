## Task 3 - Permissions Configuration

Create some users and groups configure permissions appropriate to those roles. You will only be configuring who can get to web content resources and what they may edit within them.

## What to set up

Create two groups - one that will be allowed to edit your main site, the other that will be allowed to edit your menu site.

Members of one of these group may not sign in with shell access - they may only use `sftp`. In addition, if a member of this group signs in with `sftp`, they are directed to the main or menu web content directory - they do not need to `cd` to that directory.

## Documentation

Create a folder in your course GitHub repository called `web`.  Create a file named `permissions.md` and create a writeup that includes the following details.

- Document the "username" utilized by the apache service
- Determine and document a permissions structure for server admins and site developers
- Implement the structure and document your implementation steps
- Provide a write up for admins to add a new developer to the site developers
- Configure the site's root document directory to be editable by site developers and readable by the apache service. Document how you configured this and screenshot(s) proving your implementation worked

## Extra credit

You may choose one or both EC objectives

1. Set the site's root document directory permissions to be persistent (auto configured) when new files are added to the site's root document directory. Document how you configured this and screenshot(s) proving your implementation worked
2. Restrict site developers from using a shell session - they may only edit via SFTP. Document how you configured this and screenshot(s) proving your implementation worked

## Submission

Submit a link in Pilot to your course GitHub repository with your permissions documentation.