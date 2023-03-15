## Backups

Reasons for backups:
- accidental deletions
- hardware failure 
    - RAID helps with hardware failure recovery, but is not a backup solution
- natural disasters 
- malware attacks

### Rules of Backups

3-2-1-1 rule:

- Keep at least three (3) copies of your data.
    - primary production data and two backup copies
- Store two (2) backup copies on different storage media.
    - including internal or external hard drives, NAS, tape and others
- Store one (1) copy offsite.
    - store one or more backup copies in a remote location, for example, in another city, state, country or even continent
    - physical location or cloud counts
- Create one (1) immutable or air-gapped backup copy.
    - Immutable backups are backup files stored using the write-once-read-many (WORM) model
        - no modification or deletions
    - air-gapped backups store data offline on detachable disks, NAS or tape and disconnecting them from the production site

Resources:
- [Nakivo - 3 2 1 Backup Rule](https://www.nakivo.com/blog/3-2-1-backup-rule-efficient-data-protection-strategy)

### Making Backups

1. Identify what needs backed up
2. Identify what strategies work for the OS you are working with
3. Plan to test your backups

- [Backup and Restore in Windows](https://support.microsoft.com/en-us/windows/backup-and-restore-in-windows-352091d2-bb9d-3ea3-ed18-52ef2b88cbef)
    - Note: this is managed on the individual system
- [Backup Mac with TimeMachine / iCloud](https://support.apple.com/mac-backup)
- [`rsync` for backup and restore](https://jumpcloud.com/blog/how-to-backup-linux-system-rsync)
- clone the whole partition or disk
    - [`dd`](https://linuxhint.com/clone-disk-using-dd-linux/)
    - [Clonezilla](https://success.trendmicro.com/dcx/s/solution/1105066-full-disk-backup-and-restoration-by-clonezilla?language=en_US)
    - [DRBL - for many systems](https://medium.com/@vijaventure/disk-cloning-with-drbl-clonezilla-for-multiple-laptops-3-261b0e58124a)
    - [Fog](https://docs.fogproject.org/en/latest/getting_started/capture_an_image.html)
    - [Macrium - Windows only?](https://en.wikipedia.org/wiki/Macrium_Reflect)
    - and many more...

Resources:
- [Cloudian - data backup in-depth](https://cloudian.com/guides/data-backup/data-backup-in-depth/)

### Using / Testing Backups

If backups are not tested, then you do not have backups.

Resources:
- [Carbonite - recovery testing](https://www.carbonite.com/blog/article/2021/01/backup-and-disaster-recovery-testing-how-to-make-sure-you-can-recover-when-it-matters)
- [Technology Advice - database recovery and testing](https://technologyadvice.com/blog/information-technology/how-to-test-database-backup/)
    - what applies to a database closely ties in with just data testing

## Backup Tools

### `rsync`

`rsync` is an open-source file synchronizing tool that provides incremental file transfer.

When you think about backups, part of the conversation needs to be not just what to backup, but how it backs up.  Let's use this scenario: I backup my Desktop folder.  A rookie thought might be that I make a full copy of my current Desktop folder, and transfer that to a backup location.  Let's say I do that daily.  But what if nothing changed - or only one file changed?  If you think of backups as full copies, you can start to picture the waste in terms of data transfer.

Tools like `rsync` grab changes that the remote location does not have, not whole files (unless the backup server did not have that whole file), sparing network bandwidth and resource cycles.  To get a bit more technical:

> By default, `rsync` determines which files differ between the sending and receiving systems by checking the modification time and size of each file. If time or size is different between the systems, it transfers the file from the sending to the receiving system. As this only requires reading file directory information, it is quick, but it will miss unusual modifications which change neither. `Rsync` performs a slower but comprehensive check if invoked with `--checksum`. This forces a full checksum comparison on every file present on both systems.- Wikipedia

Some sample commands / examples of `rsync`:

```
rsync [options] src dest
rsync [OPTION] … SRC … [USER@]HOST:DEST
rsync [OPTION] … [USER@]HOST:SRC [DEST]
```
SRC is the file or directory (or a list of multiple files and directories) to copy from, DEST is the file or directory to copy to

```
rsync -azP source destination
```
- `-a` = archive: quick way of saying you want recursion and want to preserve almost everything
- `-z` = compress file data during the transfer
- `-P` = show progress during a transfer (like `--progress`)

```
rsync -avAXHS --progress --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / /path/to/backup/folder
```
Exclude system dependent folders from backup of all other files.  For example, `/bin, /usr, /lib, /home` would be included.
- `-a` = archive: quick way of saying you want recursion and want to preserve almost everything
- `-v` = verbose: A single -v will give you information about what files are being transferred and a brief summary at the end
- `-H` = hard links: look for hard-linked files in the transfer and link together the corresponding files on the receiving side. Without this option, hard-linked files in the transfer are treated as though they were separate files
- `-A` = copy ACLs: update the destination ACLs to be the same as the source ACLs. The option also implies `--perms`.  TLDR: keep permissions
- `-X` = extended attributes: update the remote extended attributes to be the same as the local ones
- `-S` = sparse: Try to handle sparse files efficiently so they take up less space on the destination
- `--progress` = show progress during a transfer
- `--exclude` = exclude files matching PATTERN.  In this case, a list of folders to exclude was given

Resources:
- [`rsync` man pages](https://linux.die.net/man/1/rsync)
- [Digital Ocean - How to use `rsync`](https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories) 
- [Wikipedia - `rsync` and examples](https://en.wikipedia.org/wiki/Rsync#Examples)
- [`rsync` - examples](https://rsync.samba.org/examples.html)

Is there something like `rsync` for other OSes?
- [Reddit discussion - Windows `rsync` alternatives](https://www.reddit.com/r/DataHoarder/comments/97djbq/windows_rsync_alternative/)
- [Burkhard Schmidt - Using `rsync` on Mac](https://github.molgen.mpg.de/pages/bs/macOSnotes/mac/mac_files_rsync.html)

## Time

- Explore `system clock` to track [`system time`](https://en.wikipedia.org/wiki/System_time)
- Consider why system time matters
    - logs
    - synchronization
    - timestamps for file creation, modification, and access
    - validating requests within a time frame
- Look at how to obtain time with Network Time Protocol (NTP) and Network Time Security (NTS) to establish trust of time
    - [Cloudflare - background on `NTP`](https://blog.cloudflare.com/secure-time/)
    - [Internet Society - Everything you need to know about `NTS`](https://www.internetsociety.org/blog/2020/08/everything-you-need-to-know-about-network-time-security/)


### `date`

The `date` command is one of the handiest things - you can set the clock, specify fields needed in a timestamp, and more.

- [Linuxize - Linux `date` command](https://linuxize.com/post/linux-date-command/)

### `cron`

`cron` is a scheduling daemon that executes tasks at specified intervals. These tasks are called `cron` jobs and are mostly used to automate system maintenance or administration.

A `crontab` is a file of `cron` jobs defined for a user account or system wide.  The `crontab` command allows access to the correct file based on user using the command.

In general, a `cron` job has the following format:

```
* * * * * command(s)
- - - - -
| | | | |
| | | | ----- Day of week (0 - 7) (SUN - SAT)
| | | ------- Month (1 - 12) (JAN - DEC)
| | --------- Day of month (1 - 31)
| ----------- Hour (0 - 23)
------------- Minute (0 - 59)
```

Notation:
- `*` any value (wildcard)
- `,` value list separator
    - `MON,FRI` = do on Monday and Friday
- `-` range of values
    - `MON-FRI` = do on Monday through Friday
- `/` step values
    - `*/2` = do every two (such as two minutes or two hours)

Resources:
- [crontab guru - editor for `cron` schedule expressions](https://crontab.guru/#5_0_*_8_*)
- [Digital Ocean - How to use `cron` to automate tasks](https://www.digitalocean.com/community/tutorials/how-to-use-cron-to-automate-tasks-ubuntu-1804)
- [Linuxize - scheduling `cron` jobs with `crontab`](https://linuxize.com/post/scheduling-cron-jobs-with-crontab/)

How about scheduling in other OSes?
- [Windows Task Scheduler & Scheduling Tasks in Powershell](https://docs.active-directory-wp.com/Usage/How_to_add_a_cron_job_on_Windows/Scheduled_tasks_and_cron_jobs_on_Windows)
- [Alvin Alexander - `launchd` jobs in Mac OS](https://alvinalexander.com/mac-os-x/mac-osx-startup-crontab-launchd-jobs/)


