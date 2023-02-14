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
    - You can find SSD+HDD combo drives, and just released was a NVME+HDD drive
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

## Filesystems

Resources:
- [freecodecamp - file systems architecture explained](https://www.freecodecamp.org/news/file-systems-architecture-explained/)

## Data Redundancy

### RAIDS

## Mounts

## Interfaces

## Rules of Backups

## Restoring from backups

## Cloud Storage

- the cost of business
- 

## Data Servers

- requirements of open / closed file management software

## Standards to Consider

- HIPPA, NIST, FERPA