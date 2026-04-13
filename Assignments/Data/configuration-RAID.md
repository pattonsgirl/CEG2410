## RAID Array Configuration & Management

In this assignment, you will move beyond single-volume storage used on your web server. You will provision multiple Amazon EBS volumes, attach them to your EC2 instance, and use the `mdadm` (Multiple Device Admin) utility to create a redundant storage array. You may choose to build a **RAID 5** (Distributed Parity) or **RAID 6** (Dual Distributed Parity) array.

### To begin:

Log into your AWS Console

Create the necessary EBS volumes. 
- For **RAID 5**, you need a minimum of **3** volumes.
- For **RAID 6**, you need a minimum of **4** volumes.
- **Requirement:** All volumes must be the same size (e.g., 2 GiB or 5 GiB) and located in the **same Availability Zone** as your EC2 instance. 

Once created, **attach** each volume to your instance. Use `lsblk` on your instance to verify the new block devices (e.g., `/dev/xvdf`, `/dev/xvdg`, etc.) are visible.

### What to set up:

**1. Array Creation**
- Install the `mdadm` utility if it isn't already present.
- Use `mdadm --create` to build your array (e.g., `/dev/md0`).
- **Requirement:** You must specify the correct `--level` (5 or 6) and the exact number of `--raid-devices` you attached.

**2. Monitoring the Build**
- Software RAID takes time to "sync" or "reshape" the parity bits across the drives. 
- You must monitor the progress using `cat /proc/mdstat`. 
- **Wait** until the array is fully "clean" or "active" before proceeding to the filesystem step.

**3. Filesystem & Persistence**
- Create an **ext4** filesystem on your new RAID device (`/dev/md0`).
- Mount the device to a new directory (e.g., `/mnt/raid_data`).
- **Persistence:** Update `/etc/fstab` so the RAID array mounts automatically on reboot. 
- **Important:** You must also save your RAID configuration to the `mdadm.conf` file so the array assembles correctly at boot time.

**4. Failure Simulation (The "Admin" Test)**
- To prove the redundancy works, you must **fail** one of your drives intentionally using `mdadm --manage --fail`.
- Verify the array status. Can you still access your files while the array is "degraded"?
- **Recovery:** Remove the "failed" drive and "add" a new spare EBS volume to trigger a rebuild.

---

## Documentation Requirements

Create a folder in your GitHub repository called `storage`. Create a file named `raid-management.md`.

**1. Architecture Choice**
- State whether you chose RAID 5 or RAID 6. 
- Explain why you chose that level over the other. Mention the trade-off between **usable storage capacity** and **fault tolerance**.

**2. Storage Math**
- Provide the math for your usable space. 
- If you have $n$ disks of size $S$, what is the formula for usable space in RAID 5? What about RAID 6?

**3. Configuration Snippets**
- Provide the exact `mdadm --create` command you used.
- Provide the output of `sudo mdadm --detail /dev/md0` showing the array in a "clean" state.
- Provide the command used to create an `ext4` filesystem on `/dev/md0`

**4. Persistence Strategy**
- Show your `/etc/fstab` entry.
- Show the contents of your `/etc/mdadm/mdadm.conf` (or equivalent) and explain why this file is necessary for the array to survive a reboot.

**5. Failure & Recovery Log**
- Document the process of failing a drive. 
- Include a screenshot of `/proc/mdstat` while the array is **rebuilding**. How long did the rebuild take for your volume size?

---

## Submission

Submit a link in Pilot to your course GitHub repository with your `raid-management.md` documentation.

## Rubric

Your `raid-management.md` should include all of the following required elements:

- [ ] RAID level choice explained and justified
- [ ] Usable storage calculations for the selected RAID level
- [ ] Exact `mdadm --create` command and `mdadm --detail /dev/md0` output shown
- [ ] Filesystem creation and mount persistence documented with `/etc/fstab`
- [ ] RAID configuration saved in `mdadm.conf` for reboot assembly
- [ ] Failure simulation and degraded-array recovery process documented
- [ ] Evidence of rebuild progress via `/proc/mdstat` included

