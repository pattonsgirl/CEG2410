## Integrating RAID Storage with Apache/Nginx

Now that you have a functional RAID 5 or RAID 6 array mounted at `/mnt/raid_data`, you will migrate your web server's content to this redundant storage. This ensures that even if a drive fails, your website stays online.

### To begin:
Ensure your RAID array is automatically mounting via `/etc/fstab`. Create a directory on the RAID specifically for web content (e.g., `/mnt/raid_data/www`).

### What to set up:
1.  **Data Migration:** * Use `rsync` or `cp -rp` to move your existing website files from `/var/www/` to the new RAID directory. 
    * **Requirement:** You must preserve the permissions and ownership (the `www-data` user must still be able to read these files).
2.  **Web Server Configuration - Symlinks:**
    * After moving the data, create a **Symbolic Link** from the RAID back to the respective `/var/www/html` folders. 

### Documentation Requirements

Create a folder in your GitHub repository called `storage`. Create a file named `raid-web.md`:

1.  **Migration Steps:** List the commands used to move the data and verify permissions.
2.  **Configuration Snippet:** Show the symbolic link(s) from your `/var/www` folders to the web folders in `/mnt/raid_data/www`.
3.  **Verification:** Provide a screenshot of your website loading. Then, run `df -h` and highlight the line showing that your web content is being served from the RAID device (`/dev/md0`).

**Reminder**
- If Apache can't "search" (the `x` bit) through `/mnt` or `/mnt/raid_data`, it won't be able to reach the files.

---

## Submission

Submit a link in Pilot to your course GitHub repository with your `raid-web.md` documentation.
