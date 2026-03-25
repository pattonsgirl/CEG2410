## BeeGFS Parallel Cluster Configuration

In this assignment, you will build a high-performance parallel file system. Unlike a local RAID which protects against disk failure on one machine, BeeGFS allows multiple servers to work together to provide a single, massive, high-speed namespace. In a BeeGFS setup, instead of one RAID array on one server, you are building a distributed system where data is "striped" across multiple servers. This is the industry standard for High-Performance Computing (HPC) and AI workloads.

| Feature | RAID (Previous Assignment) | BeeGFS (This Assignment) |
| :--- | :--- | :--- |
| **Scope** | Single Server | Multiple Servers (Cluster) |
| **Redundancy** | Handled by Parity (RAID 5/6) | Handled by "Buddy Mirroring" (Advanced) |
| **Scaling** | Limited by physical disk slots | Add more servers to increase speed/space |
| **Complexity** | Low (Internal to OS) | High (Networked Daemons) |

### To begin:

You will need **at least two (ideally three) EC2 instances** for a minimal cluster. 
1.  **Management/Metadata Node:** Coordinates the file system and stores file attributes.
2.  **Storage Node:** Stores the actual "chunks" of data.
3.  **Client Node:** The machine that actually mounts the file system to use it.

*Note: In a small lab, the Management and Metadata services can run on the same instance.*

### What to set up:

**1. Network & Firewall Configuration**
BeeGFS relies on specific ports for its distributed architecture. You must configure your AWS Security Group to allow internal cluster communication.

1.  **Identify Ports:** Configure rules for ports `8008` (Management), `8005` (Metadata), `8003` (Storage), and `8006` (Helper/Client).
    - Some of these ports may need either TCP or UDP or both.
2.  **Internal Trust:** Instead of opening these ports to the entire world (`0.0.0.0/0`), set the **Source** to the Security Group ID itself or to internal to the VPC. This ensures only your cluster nodes can communicate with these services.
3.  **Connectivity Test:** Before installing the software, ensure you can `ping` between your nodes using their **Private IP addresses**.

**2. Service Installation**
- Add the BeeGFS repository to your package manager.
- Install the specific services on their respective nodes:
    - `beegfs-mgmtd` (Management)
    - `beegfs-meta` (Metadata)
    - `beegfs-storage` (Storage)
    - `beegfs-client` & `beegfs-helperd` (Client)

**3. Target Formatting**
- On the **Storage Node**, attach an EBS volume.
- Format it with **XFS** (the preferred underlying FS for BeeGFS) and mount it. This becomes your "Storage Target."
- Do the same on the **Metadata Node** for the "Metadata Target."

**4. Cluster Registration**
- Configure each service to point to the IP address of the Management Node.
- Use the `beegfs-setup` scripts to initialize the storage and metadata targets.
- **Requirement:** The storage node must be registered as a "Target ID" in the management console.

**5. The Client Mount**
- On the **Client Node**, configure `/etc/beegfs/beegfs-client.conf` to point to the Management Node.
- Start the client service. If successful, the cluster should appear as a single mount point (e.g., `/mnt/beegfs`).

---

## Documentation Requirements

Create a folder in your repository called `cluster-storage`. Create a file named `beegfs-setup.md`.

**1. Architecture Diagram**
- Describe the "Roles" in your cluster. List the Private IP addresses and which BeeGFS service is running on each.
- Explain the difference between **Metadata** (the "map" of the files) and **Storage** (the actual data).

**2. Striping Logic**
- Explain how BeeGFS "stripes" a file. If you had two storage nodes and uploaded a 1GB file, how is that data distributed? 
- Use the command `beegfs-ctl --getentryinfo /path/to/file` to show how a file is chunked across your targets.

**3. Communication & Ports**
- Document the security group rules required. 
- Which ports did you have to open for the Management (`8008`), Metadata (`8005`), and Storage (`8003`) services to talk to each other?

**4. Verification**
- Include the output of `beegfs-ctl --listnodes`

**5. Benchmarking**
- Run a simple write test: `dd if=/dev/zero of=/mnt/beegfs/testfile bs=1G count=1 oflag=direct`.
- Compare the speed of writing to the BeeGFS mount versus writing to the local EBS volume.

---

## Submission

Submit a link in Pilot to your course GitHub repository with your `beegfs-setup.md` documentation.

A "Checklist for Success" is a lifesaver for BeeGFS labs, as one misconfigured port or service can make the entire cluster feel "broken" when it’s actually just a single missing link.

Here is a checklist you can provide to your students to help them verify each layer of the stack before they attempt the final `mount`.

---

## BeeGFS Cluster Success Checklist

Before you attempt to run `systemctl start beegfs-client`, ensure every item below is checked off. If one fails, the client will not mount.

### 1. Networking & Security Groups
- [ ] **Private IP Reachability:** Can you `ping` the Management Node's **Private IP** from the Storage and Metadata nodes?
- [ ] **Security Group Self-Reference:** Does your AWS Security Group allow ports `8008`, `8005`, `8003`, and `8006` with the **Source** set to the Security Group ID itself?
- [ ] **Instance AZ:** Are all instances in the same Availability Zone (e.g., `us-east-1a`)? (Cross-AZ traffic can cause latency issues or connection drops in high-performance filesystems).

### 2. Service Status (The "Big Three")
Run `systemctl status beegfs-X` on each respective node:
- [ ] **Management Node:** Is `beegfs-mgmtd` active (running)?
- [ ] **Metadata Node:** Is `beegfs-meta` active (running)?
- [ ] **Storage Node:** Is `beegfs-storage` active (running)?
- [ ] **Check Logs:** Run `tail -n 20 /var/log/beegfs-X.log` on each node. You should see "Registration successful" or "Successfully connected to management node."

### 3. Target Initialization
- [ ] **Storage Target:** Did you run the `beegfs-setup-storage` script pointing to the correct path on your attached EBS volume?
- [ ] **Metadata Target:** Did you run the `beegfs-setup-meta` script pointing to the metadata directory?
- [ ] **Permissions:** Does the `beegfs` user (or the user running the service) have write permissions to the underlying XFS/EXT4 folders?

### 4. Client-Side Preparation
- [ ] **Management Host:** In `/etc/beegfs/beegfs-client.conf`, is `sysMgmtdHost` set to the **Private IP** of your Management node?
- [ ] **Helper Daemon:** Is the `beegfs-helperd` service running on the client node? (The client cannot mount without the helper).
- [ ] **Kernel Modules:** Did you install `linux-headers-$(uname -r)`? The BeeGFS client builds a kernel module; if headers are missing, the build will fail.

---

### How to Verify the Cluster "Health"
Once the services are up, students can run this "Gold Standard" command from **any** node to see if the cluster sees itself:

```bash
# Check if all nodes are registered
beegfs-ctl --listnodes --nodetype=management
beegfs-ctl --listnodes --nodetype=metadata
beegfs-ctl --listnodes --nodetype=storage
```

**If a node is missing from this list, do not try to mount the client.** Troubleshoot that specific node's connection to the Management IP first.

