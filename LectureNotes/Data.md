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

![GearMeUp - HDD, SSD, NVMe](https://d3d14bvuzxlv37.cloudfront.net/media/wysiwyg/hdd-ssd-m.2-nvme.jpg)

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

- RAID 0
- RAID 1
- RAID 10 (read as one-zero)
- RAID 5
- RAID 6

### Hardware RAID

### Software RAID

## Mounts

### Physically Attached Storage

### Network Hosted Storage

#### Type of Network Storage

- [Backblaze - NAS vs SAN](https://www.backblaze.com/blog/whats-the-diff-nas-vs-san/)

Open Source NAS Options:
- [openmediavault](https://www.openmediavault.org/)
- [TrueNAS](https://www.truenas.com/)

- requirements of open / closed file management software

#### Protocols

- NFS
- SMB / CIFS

[QuoByte - What is NFS?](https://www.quobyte.com/storage-explained/what-is-network-filesystem/)

## Interfaces

## Backups

### Rules of Backups

### Making Backups

- `rsync`

### Restoring from Backups

## Cloud Storage

- Storage Tiers (AWS perspective)
- the cost of business

## Standards to Consider

- HIPPA, NIST, FERPA