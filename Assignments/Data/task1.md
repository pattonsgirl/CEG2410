# Task 1 - RAID Management

In class, we built a RAID 6 array with a Linux software tool - mdadm.  Your task now is to play with some command RAID Management taskings.

Create a folder in your course GitHub repository called `Data`.  Create a file named `RAID.md` and address the following core tasks.

**In all steps, be sure to highlight useful commands for completing the task at hand.**

1. **Build it** - Describe your RAID setup with supporting screenshots of your AWS EBS volumes attached to the instance and the status of your built RAID managed by mdadm on your AWS instance.
    - description should address your disk sizes, RAID type (and what that means), data storage available, steps to create the RAID and a filesystem

2. **Detect it** - How can mdadm (with or without supporting tools) detect RAID degradation?  Respond in terms of the whole RAID and detection of pending failure for a singular disk.

3. **Break it** - Remove a disk or two (EBS volume) used in your RAID array via AWS (not via the instance's command line). Describe the effect of this on your RAID array availability and add supporting screenshots of your AWS EBS volumes and status of your built RAID managed by mdadm.

4. **Repair it** - Create *new* volume(s), attach them to your instance, and repair the RAID array.  Add supporting screenshots of your AWS EBS volumes and status of your repaired RAID managed by mdadm.

## Submission

Submit a link in Pilot to your course GitHub repository with your RAID management documentation.