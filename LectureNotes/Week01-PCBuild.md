# General Needs

- Electric requirements
- Rack requirements?
- Power backup requirements
  - Backup Time (in hours) = Battery Capacity (in Ah) X Input voltage (V) / Total Load (in Watts)
- Networking
  - call ISP, how many public IPs?
  - private (internal network)
  - wifi network
  - guest network

# web server build - Tables 1 & 2 (row 1) 

- spend extra on: CPU, RAM, disk speed

### Additional questions about build needs
1. Scalability - how many are accessing site and from where
2. Size of site - what does this mean about disk size & speed?
3. Site development - should version control be considered

### Other things to consider
1. Should it load balance - this will mean a need for multiple systems
2. Should it be "always on" - this could mean battery backups in case of power outages
3. Backups - how should the site & system configuration be backed up
  - configuration scripts?
  - RAID array?
  - auto backup at intervals to data storage server?
4. Should this be hosted in house / on prem / physically?  Would cloud hosting be a fit? 
   
### Primary recommended OS & base software
- Linux with common options:
  - Apache
  - NGINX
  - LAMP
- Check out [Web server developers: Market share of all sites](https://news.netcraft.com/archives/category/web-server-survey/)

### Who should have what access (think files & software) 
- Read site content - software running site needs to be able to read pages
- Write / edit site content - devs should have access
- Update & add software packages - admins with sudo (super user) privileges

### From where should the system be accessible (and by who?)
- Anyone should be able to enter URL in browser and access
- Only admins / devs should be able to access the system
- What does this mean for ports & firewall rules?

#  data storage server - Tables 3 & 4 (row 2)

- Spend extra on - space, disk speed, network speed

### Additional questions about build needs
1. What kind of data is being stored?
  - backups?
  - frequently accessed / modified data?
  - any compliance concerns?
    - NIST, HIPPA, FERPA, just to name to big ones
2. How much data is being stored?
3. What redundancy levels are needed?
4. Where does this data get backed up?
5. Would cloud hosting be a fit?
  - storage tiers
  - cost per GB
  - cost for access (typically download bandwidth)

### Primary recommended OS & base software
- most data storage servers are running Linux in some form
- We will be building a basic one with `mdadm`, a software RAID configuration and management tool
- there are opensource versions of things like dropbox - so another question is who is "interfacing" with the data

### Who should have what access (think files & software)
- access should be to files relevant to the group
  - ex. hr access to hr files & folders, devs access to projects
  
### From where should the system be accessible (and by who?)
- check any compliance regulations
- this should not be publicly accessible
- are there needs for off-prem access?
  - managing public ip lists would be rough
  - VPNs offer a solution
  - is just authentication enough?

# machine learning server with CUDA - Tables 5 & 6 (row 3)

- Spend extra on NVIDIA card with CUDA cores (total budget comes in here), RAM, and speedy data access
  - debate - enterprise series card or consumer grade?

### Additional questions about build needs

1. How often will this be accessed?
  - argument that if it's a quick project, renting cloud hardware is a good choice
2. How large are the data sets (this helps determine RAM budget & data storage capacity)
3. Are people sharing this system?
  - job queues exist so that jobs can run as resources free up (SLURM)

### Primary recommended OS & base software

- Linux with NVIDIA CUDA drivers
  - this is a running joke because it all works best in Linux, but the drivers are historically... rough
- Common machine learning software:
  - tensorflow
  - keras
  
### Who should have what access (think files & software)

- similar to web server, researchers are able to access & modify data and execute code
- admins can mange updates and software installs
- What if there are software conflicts?  (researcher A need version 2.7, B needs 3.6)
  - this introduces a need to virtualize the hardware - containers are a major player here
  - containers are not in scope of this course (happy to share resources) - check out CEG 3120
  
### From where should the system be accessible (and by who?)

- similar to data storage server - should it be accessible off-prem, would be VPN be a good solution?
