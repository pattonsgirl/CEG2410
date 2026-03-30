## Automated Backups - RAID

In this assignment, you will treat your RAID array as a **Backup Target**. You will configure a script to automatically back up your web server configuration and logs to the RAID at a scheduled interval.

### To begin:
Create a backup directory on your RAID (e.g., `/mnt/raid_data/backups`).

### What to set up:
1.  **The Backup Script:**
    * Create a Bash script (`backup_web.sh`) that performs the following:
        * Uses `tar` to create a compressed archive of your `/etc/apache2` (or `/etc/nginx`) configuration directory.
        * Adds a timestamp to the filename (e.g., `web-config-2026-03-25.tar.gz`).
        * Moves the archive to the backup folder on the RAID.
2.  **Automation (Cron):**
    * Use the `crontab` utility to schedule this script to run automatically once per day (or every hour for testing).
3.  **Retention Policy (Extra Credit):**
    * Update your script to find and delete backups older than 7 days so the RAID doesn't fill up over time.

### Documentation Requirements:

Create a folder in your GitHub repository called `storage`. Create a file named `backups.md`:

1.  **Script Content:** Provide the full code for your `backup_web.sh` script.
2.  **Cron Logic:** Provide the exact cron expression you used (e.g., `0 2 * * *`) and explain what each part of the expression means.
3.  **Verification:** Show a screenshot of the files currently sitting on your RAID array after the script has run at least twice.
4.  **Log Check:** Show the output of `grep CRON /var/log/syslog` to prove the system triggered your script.

---

## Submission

Submit a link in Pilot to your course GitHub repository with your `backups.md` documentation.
