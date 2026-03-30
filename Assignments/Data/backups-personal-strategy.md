## Personal Data Sovereignty & Backup Analysis

In previous assignments, you built a professional-grade redundant storage system (RAID) and an offsite disaster recovery plan (S3). Now, you will apply those same "System Admin" principles to your own digital life. You will analyze your current habits, identify "Single Points of Failure," and design a robust **3-2-1 Strategy** for your personal data.

### Part 1: The Current State Audit
Perform a "Digital Audit" of where your data currently lives. Consider:
* **Active Data:** School projects, current code repositories, tax documents.
* **Archive Data:** Photos from the last 5 years, old course materials.
* **Cloud Dependency:** Are your files *only* on Google Drive, iCloud, or OneDrive? (Remember: Syncing is not the same as Backing Up).

### Part 2: The 3-2-1 Strategy Design
You must propose a plan that satisfies the industry-standard **3-2-1 Rule**:
1.  **3 Copies of Data:** (1 Primary + 2 Backups).
2.  **2 Different Media:** (e.g., Internal SSD, External HDD, NAS, Optical, or Cloud).
3.  **1 Offsite Copy:** (A physical drive at a different location or a Cloud provider).

---

## Documentation Requirements

Create a folder in your GitHub repository called `storage`. Create a file named `personal-backup-analysis.md`. Your report should include the following sections:

### 1. Risk Assessment (The "Why")
Identify your **Crown Jewels** (the data you absolutely cannot lose).
- What would happen if your primary laptop was stolen or the SSD failed today?
- Estimate the "Recovery Time Objective" (RTO)—how long would it take you to get back to work?

### 2. Current Strategy Evaluation
Describe how you currently handle backups. 
- Be honest: If your current strategy is "I hope it doesn't break," explain the risks of that approach.
- If you use Cloud Sync (Dropbox/iCloud), explain the difference between **Sync** (deleting a file on your phone deletes it in the cloud) and a **Backup** (a point-in-time version you can retrieve).

### 3. Proposed 3-2-1 Implementation
Detail your "Ideal State" setup. For each of the three layers, specify:
- **Primary:** Where the data lives daily.
- **Local Backup:** What hardware or software will you use? (e.g., Time Machine to an external HDD, a Windows Backup to a second internal drive, or a manual `rsync` to a Raspberry Pi).
- **Offsite Backup:** Which service or physical location will you use? (e.g., Backblaze, AWS S3 Glacier, or a rotated drive kept at a relative’s house).

### 4. Implementation Costs & Tools
- List the tools you would use (e.g., Restic, Duplicati, Carbon Copy Cloner, or simple Cron jobs).
- Provide a brief "Budget" for this plan. What is the one-time cost (Hardware) vs. the recurring cost (Cloud Storage)?

### 5. The "Fire Drill" Plan
- Briefly describe how you would test your backup once a year.
- How do you know the data in your backup is actually readable and not corrupted?

---

## Submission

Submit a link in Pilot to your GitHub repository with your `personal-backup-analysis.md` documentation.
