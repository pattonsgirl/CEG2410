## Drives & Drivers

**NOTE** All numbers for speed can vary depending on who wrote the article.  Numbers referred to here may be more of an average.  

### Disk Types

- HDD (Hard Disk Drive)
    - rotary hard drives with spinning platters and a moving needle that writes data to consecutive sectors on each platter
    - low cost
    - defragmentation required for best over-time performance
    - moving parts means bad choice for on-the-go devices
    - 5200 & 7200 RPM disk speeds available
    - typically uses SATA
    - speed for read and write at typically 80MB/s to 160MB/s
- SSD (Solid State Drive)
    - data is stored on non-volatile flash memory
    - typically uses SATA
    - no moving parts
    - speed for reads and writes at between 200MB/s to 550MB/s
- NVME (Non-Volatile Memory Express)
    - SSD that's attached to a PCI Express (PCIe) slot on a main board
    - read/write speeds of the top NVMe SSDs on the market can exceed 3000 MB/s (3 GB/s), with some Gen 4 NVMe PCIe SSDs capable of 7500 MB/s
    - [CDW - different types of NVME drives](https://www.cdw.com/content/cdw/en/articles/hardware/ssd-types-m2-sata-nvme-u2.html)
- Hybrids
    - You can find SSD+HDD combo drives, and just released was a [NVME+HDD drive](https://www.tomshardware.com/news/seagate-demonstrates-hdd-with-pcie-nvme-interface)
    - These are not as useful at the consumer level - these are now geared towards data centers

![GearMeUp - HDD, SSD, NVMe](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU6Re2XPIDpdMSw-wi66pgo8GmVQzUBx720A&usqp=CAU)

Within disk types, you have different companies, different disk tiers (read / write capabilities and speeds), warranty expectations, and disk class (consumer vs enterprise).

[Backblaze has a yearly HDD report](https://www.backblaze.com/blog/backblaze-drive-stats-for-2022/) of winning disks models.  They have a report for [top SSD rankings](https://www.backblaze.com/blog/ssd-drive-stats-mid-2022-review/) as well.

### Drive Interfaces / Protocols

- SATA (Serial Advanced Technology Attachment)
    - data transfer of 600MB/s (4.8 Gb/s)
        - note: it is common to use 6Gb/s, but it doesn't factor in [base 10 to 8 conversion](https://www.quora.com/Why-does-the-SATA-III-connection-max-out-at-600-MB-s-read-and-write-speeds)
    - half-duplex (one directional) - cannot read and write simultaneously
- SAS (Serial Attached Small Computer System Interface)
    - data transfer of 1500 MB/s (12 Gb/s)
    - full-duplex - can read and write simultaneously
- PCIe (Peripheral Component Interconnect Express)
    - PCIe 3.0’s throughput is 1GB per second per lane, providing an overall data transfer rate or bandwidth of up to 32GB/s total. 
    - PCIe 4.0 doubles the 3.0 throughput rate per lane, giving users a transfer rate of up to 64GB/s.
        - [Samsung - PCIe 3 vs PCIe 4](https://insights.samsung.com/2022/10/17/pcie-4-0-vs-pcie-3-0-whats-the-difference-2)

Comparing interfaces: [ciphertex - interfaces](https://ciphertex.com/ssd-interfaces-sas-sata-nvme/)

[Hostinger - what is NVME](https://www.hostinger.com/tutorials/what-is-nvme)
[DiskPart - AHCI vs NVME](https://www.diskpart.com/clone/achi-vs-nvme-ssd-0310.html)

### Sizes of Data Pools

I cannot simply state disks, as we don't have the tech to develop singular disks to some of these size scales.  Examples for real world equivalents to wrap your head around [the scale of sizes](https://www.geeksforgeeks.org/understanding-file-sizes-bytes-kb-mb-gb-tb-pb-eb-zb-yb/)

- bit
    - 1 or 0
- byte
    - 8 bits
- Kilo-byte - KB
    - 1000 B = 1 KB
- Mega-byte - MB
- Giga-byte - GB
    - 1000 MB = 1 GB
- Terra-byte - TB
    - 1000 GB = 1 TB
- Peta-byte - PB
    - 1000 TB = 1 PB
- Exa-byte - EB
    - 1000 PB = 1 EB
- Zetta-byte - ZB
    - 1000 EB = 1 ZB
- Yotta-byte - YB
    - 1000 ZB = 1 YB

## Filesystems

A  file system  defines how files are  named,  stored, and  retrieved  from a storage device.

It is a set of data structures, interfaces, abstractions, and APIs that work together to manage any type of file on any type of storage device, in a consistent manner.

### Traditional FS

Each OS, in addition to making filesystems optimized for their OS, has drivers to support different filesystems.  this is a quick listing of most common traditional filesystems and notes about them.

- FAT / FAT32
    - File Allocation Table
- exFAT
    - Extended File Allocation Table
    - designed for high-capacity removable devices, such as external hard disks, USB drives, and memory cards
    - read/write support is cross platform
- NTFS
    - New Technology File System
    - default file system of the Window NT family (2000, XP, Vista, 7, 10, 11...)
    - only read  the content of an NTFS-formatted storage device (like flash memory) on a Mac OS
        - write if you install NTFS driver for Mac OS
- ext / ext2 / ext3 / ext4
    - Extended File System
    - ext4 is the default for most Linux OSes
    - read/write in Windows and Mac with additional drivers
    - BtrFS & XFS are on the docket as alternatives, and possible "better" options than ext4
- HFS / HFS+ / APFS
    - Hierarchical File System (HFS),  HFS+, and recently  Apple File System (APFS)
    - APFS has been standard since OS X High Sierra in 2017
    - No Windows compatibility, Linux can add on a read-only driver

- [freecodecamp - file systems architecture explained](https://www.freecodecamp.org/news/file-systems-architecture-explained/)
    - THIS IS WORTH READING
- [Wikipedia - Filesystem metadata](https://en.wikipedia.org/wiki/Comparison_of_file_systems#Metadata)
    - what to note here is what metadata different filesystems carry - metadata can include permissions
- [Wikipedia - Filesystems OS Support](https://en.wikipedia.org/wiki/Comparison_of_file_systems#OS_support)
    - what filesystems are out of box compatible with which OSes (and recommended drivers to enable support)

### Distributed FS & Object Stores

In a distributed file system, the file system is distributed among multiple file servers or multiple locations.  Since this is outside my forte, I'm not going too much into these, but you should know it is a thing.

- Lustre
- GlusterFS
- Ceph
    - Note: Ceph is primarily an Object Store, with a FS overlay in early development

- [Bizety - Big Data Storage Models](https://www.bizety.com/2019/04/09/big-data-storage-models-overview-lustre-glusterfs-and-ceph/)
- [Geeksforgeeks - What is a Distributed File System](https://www.geeksforgeeks.org/what-is-dfsdistributed-file-system/)
- [AWS - RAID configuration](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/raid-config.html)

### Filesystem Architecture

Now that you are aware there are so many options of types of filesystems, the next question is how they all get along.  Your interaction with a filesystem is generally separated into three layers:

1. Physical
    - interacting with the storage hardware via drivers
2. Virtual
    - view of various filesystems mounted on the same OS
3. Logical
    - your applications use the logical layer 
        - they make API calls (OPEN, WRITE, READ)
        - at the virtual layer, which FS is identified
        - the OS (or kernel, if we are getting granular), communicates with the device using the correct FS driver

## RAIDS

RAID = Redundant Array of Independent Disks 

RAID is not a backup solution. Rather, RAID creates a single usable data disk, where several physical disks are combined into an array for better speed and fault tolerance.

Investigating RAID types:
- How does it work?
- How many disks at minimum are required build the array?
- What are the speed benefits of implementing the array?
- How many disks failures can be tolerated before data is lost?

Resources:
- [Quora - What's the relationship between file system, partitions, and RAID in Linux?](https://www.quora.com/Whats-the-relationship-between-file-system-partitions-and-RAID-in-Linux)
- [Prepressure - RAID Types pros and cons and visuals](https://www.prepressure.com/library/technology/raid)
- [IBM - RAID types](https://cloud.ibm.com/docs/bare-metal?topic=bare-metal-bm-raid-levels)

### RAID 0
- stripes blocks of data across disks
- minimum of two disks to implement
    - if one disk is smaller than the other, the max space per disk is that of the smaller disk
    - total storage is x time number of disks, where the smallest disk sets the maximum storage across all disks
- can send read / write instructions to blocks per disk, I/O performance boost
- no fault tolerance
    
![RAID 0 - Striping](https://www.prepressure.com/images/raid-level-0-striping.svg)

### RAID 1
- mirrors data - data is written to both (or all) disks
- minimum of two disks to implement
    - no improvements to total storage, same as smallest single disk in RAID
- read speed is x times number of disks, write speed is comparable to having a single disk
- if failure, controllers uses non-failed drive

![RAID 1 - Mirroring](https://www.prepressure.com/images/raid-level-1-mirroring.svg)

### RAID 10 (read as one-zero)
- striped & mirrored
    - RAID 1 set on pairs of drives (mirroring), then RAID 0 is set across sets of pairs (striping)
- minimum of 4 disks, need to work in pairs / sets
- storage capacity take hit due to mirroring, but faster rebuild time than restoring data blocks from parity

![RAID 10 - Mirror & Stripe](https://www.prepressure.com/images/raid-level-1-and-0-striping-mirroring.svg)

### RAID 5
- data is striped across drives, and on alternate drives a parity checksum of the data block is written
    - using parity, can recalculate the data from a block if it is lost
- minimum of three disks, max of 16
- fast read speeds, write speed slower due to parity calculation
- can tolerate 1 disk failure and rebuild lost data from parity stored on other drives

![RAID 5 - String with parity](https://www.prepressure.com/images/raid-level-5-striping-with-parity.svg)

### RAID 6
- data striped across drive, with double parity stored across drives
- minimum of four disks
- fast read speeds, write slower due to parity calculation
- can tolerate two disk failure

![RAID 6 - Striping with double parity](https://www.prepressure.com/images/raid-level-6-striping-with-dual-parity.svg)

### Hardware vs Software RAID

Hardware RAIDS offer standalone devices that you plug disks into.  This hardware controller then handles instructions to manage the RAID.

Software RAIDs do not require an additional device - drives are connected directly to the motherboard.  But software RAIDS are managed by the OS, thus sharing workload with other processes.  This is more crucial for computing intensive RAIDS, like 5 and 6

- [TechTarget - Differences in Hardware and Software RAIDs](https://www.techtarget.com/searchstorage/tip/Key-differences-in-software-RAID-vs-hardware-RAID)

#### Managing RAIDs with `mdadm`

- [Digital Ocean - How to create RAID arrays with `mdadm`](https://www.digitalocean.com/community/tutorials/how-to-create-raid-arrays-with-mdadm-on-ubuntu-22-04)
- [Jeff Geerling - Create  RAID array in Linux with `mdadm`](https://www.jeffgeerling.com/blog/2021/htgwa-create-raid-array-linux-mdadm)

### RAID vs LVM

What if you don't need redundancy or parity, but do want to span multiple disks? 

LVM = Logical Volume Manager

- [Digital Ocean - Using LVM to manage storage devices](https://www.digitalocean.com/community/tutorials/how-to-use-lvm-to-manage-storage-devices-on-ubuntu-18-04)

Pros:
- resizable (to resize a RAID, you need to rebuild)
- data can be rearranged to disks for hot-swapping (not all RAIDs support hot-swap)
- can stripe data across disks (get the advantage of RAID 0)
- latest versions support mirroring

- [Ubuntu Wiki - LVM](https://wiki.ubuntu.com/Lvm)
- [Linux Today - RAID-0 `mdadm` Striping vs LVM Striping](https://www.linuxtoday.com/blog/raid-vs-lvm/)
- [Computing for Geeks - RAID vs LVM vs ZFS](https://computingforgeeks.com/raid-vs-lvm-vs-zfs-comparison/)

## Mounts

Before you talk about mounting: 

1. Have an unused volume
    - new disk added to system, created partition table, made partition(s)
    - RAID array
    - LVM
2. Find volume id
3. Create a filesystem on the volume
4. Now you can `mount`...

### Physically Attached Storage

- [Linuxize - `mount` a filesystem](https://linuxize.com/post/how-to-mount-and-unmount-file-systems-in-linux/)

### Network Storage

NAS devices deliver shared storage as network mounted volumes and use protocols like NFS and SMB/CIFS, while SAN-connected disks appear to the user as local drives.

- [Backblaze - NAS vs SAN](https://www.backblaze.com/blog/whats-the-diff-nas-vs-san/)

#### NAS - Network Attached Storage

Protocols:
- NFS
    - Network File Share
    - [QuoByte - What is NFS?](https://www.quobyte.com/storage-explained/what-is-network-filesystem/)
- SMB / CIFS
    - CIFS (Common Internet File System) and SMB (Server Message Block) are both Windows file-sharing protocols used in storage systems
    - [UpGuard - SMB vs CIFS](https://www.upguard.com/blog/cifs-vs-smb)

Mounting a NAS:
- [Linuxize - `mount` an NFS Share](https://linuxize.com/post/how-to-mount-an-nfs-share-in-linux/)

Open Source NAS Options:
- [openmediavault](https://www.openmediavault.org/)
- [TrueNAS](https://www.truenas.com/)

#### SAN - Storage Area Networks

SAN Options:
- [Reddit - Discussion of SAN options](https://www.reddit.com/r/homelab/comments/3divxm/any_good_open_source_san_software/)

## Cloud Storage

An option for an offsite backup. If you google for cloud storage, you'll find a million and one people willing to take your money.  

1. Know your data
2. Know the pricing tiers of the solution provider
3. Know the types of data storage offered & rules (price) for access

## Standards to Consider

Before you look at standards too deeply:
1. Know your data
2. Create a compliance plan
3. Regularly assess your data

Standards to be aware of and what they apply to:
- HIPPA = Health Insurance Portability and Accountability Act
    - requires healthcare providers to ensure digital health information is confidential, secure, and available when being stored or transmitted
    - mandates healthcare providers to make reasonable efforts to protect against threats, security breaches, and improper use of health data
- FISMA = Federal Information Security Management Act of 2002
    - requires that all federal agencies, their subcontractors, and their service providers, alongside any organizations that operate IT systems for a federal agency categorize data they store by how negatively impactful it would be if hacked, breached, or compromised
    - must conduct regular risk assessments to reduce the risk of data compromise to an ‘acceptable level’ through proper data controls
- NIST = National Institute of Standards and Technology Special Publication 800-53
    - framework that provides a standard for government agencies to follow in order to become compliant with FISMA

Resources:
- [immuta - guide to common data security compliance laws](https://www.immuta.com/blog/the-complete-guide-to-data-security-compliance-laws-and-regulations/)
