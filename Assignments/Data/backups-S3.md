## Automated Backups - Cloud (AWS S3)

In this assignment, you will transition from local backups to **Cloud Storage**. You will treat an AWS S3 bucket as an offsite backup target. This introduces the concept of the "3-2-1 Backup Rule" (3 copies, 2 different media, 1 offsite).

### To begin:
1.  **Create an S3 Bucket:** Use the AWS Management Console to create a private bucket (e.g., `studentname-web-backups`). 
2.  **IAM Credentials:** Ensure your server has the AWS CLI installed and is configured with an IAM user or role that has `S3:PutObject` permissions.

### What to set up:
1.  **The Cloud Sync Script:**
    * Create a Bash script (`backup_to_s3.sh`) that performs the following:
        * Locates the latest `.tar.gz` archive created by your previous RAID backup script.
        * Uses the `aws s3 cp` or `aws s3 sync` command to upload that archive to your S3 bucket.
        * Logs the success or failure of the upload to a local log file (e.g., `/var/log/s3_backup.log`).
2.  **Automation (Cron):**
    * Schedule this script to run 30 minutes *after* your RAID backup script to ensure the local file exists before the upload begins.
3.  **Security & Compliance Exploration:**
    * **Public Access Block:** Verify that "Block all public access" is turned ON for this bucket. 
    * **Encryption:** Enable "Bucket Key" or Default Encryption (AES-256) and explain why this is critical for backups containing configuration files.

### Documentation Requirements:

In your GitHub repository, update your `storage` folder by creating a file named `cloud_backups.md`:

1.  **Cloud Script:** Provide the full code for your `backup_to_s3.sh` script.
2.  **S3 Logic:** Explain the difference between `aws s3 cp` and `aws s3 sync`. Which one did you choose for this task and why?
3.  **The Security Shift:** In your previous assignment, you made a bucket "public" to host a website. 
    * Why is it a major security compliance failure to have this backup bucket be public? 
    * What kind of sensitive data might be inside your `/etc/apache2` or `/etc/nginx` configs that a hacker would want?
4.  **Verification:** * Provide a screenshot of the AWS S3 Console showing your uploaded backup files.
    * Provide a screenshot of the "Permissions" tab of your bucket showing that "Public access is blocked."
5.  **The Endpoint:** Provide the link to your S3 bucket / a specific `tar` backup file. Explain the expected behavior should the link be used and what permissions prevent access..


---

## Submission

Submit a link in Pilot to your course GitHub repository with your `cloud_backups.md` documentation.

## Rubric

Your `cloud_backups.md` should include all of the following required elements:

- [ ] The full `backup_to_s3.sh` script with upload and logging logic
- [ ] Explanation of the choice between `aws s3 cp` and `aws s3 sync`
- [ ] Discussion of why the backup bucket must remain private
- [ ] Identification of sensitive configuration data in web server files
- [ ] Screenshot of S3 upload verification with backup files visible
- [ ] Screenshot showing the bucket's public access block settings
- [ ] Link and explanation of expected behavior for the S3 bucket/file endpoint

