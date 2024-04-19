# Final Project - IT Plan

This project is a detailed revisit to the IT plan assignment that you did week 1 / 2.  The intent is that now that you have explored concepts throughout this course, you can provide a more knowledgeable outline of different areas of IT within a small business.

This project may be completed in substitution of your final exam.

In your course repository (`ceg2410s24-yourGitHubUsername`), create a document named `FINAL-ITPlan.md`.  Use it to outline the information outlined below.

## Network Administration

1. Determine the client organization's domain name.  This name should be available, and you should note the fee associated with ownership.

2. Determine the number of subnets appropriate for the client organization.   You may use a private subnet block of your choice.
    - [Reminder of valid private subnet blocks](https://en.wikipedia.org/wiki/Private_network)
    - For each subnet within your private subnet block, determine:
        - Reason for subnet (device expectations)
        - Subnet range, and therefore number of devices supported on the subnet
        - Inbound & outbound firewall rules
    - If you are going to use the cloud for resources described below, you need to additionally write the same report for your VPC network

3. Determine the starting set up networking equipment between routers, switches, access points, and firewalls.  I am looking less for brand recognition, and more for a generic shopping list of devices needed to support the client organization's networking setup.

4. Determine how many public IPv4 addresses you will need between the client organization location & cloud services.  List what resources need a public IPv4 address.
    - Hint: don't forget private networks use NAT and a border router to communicate external to, and receive communication back from, resources external to the subnet.

5. Determine a short list of **external DNS** record needs.  I am seeking the domain / sub-domain name and to what publicly addressable servers they need to tie to.

6. Determine a short list of **internal DNS** record needs.  I am seeking the domain / sub-domain name and to what internally addressable servers they need to tie to.

## Hardware Recommendations

1. Determine a set of specifications for employee or client (noted for those focusing on an education orientation where you may have students) devices working at the client organization.  I am looking for specifications & justifications of those specifications.  You may have different sets of specifications for different employee roles.
    - For example, HR staff don't need a gaming PC - or would you like to justify why they do?

2. Determine sets of specifications for servers within the client organization.  These should consider expected growth.  Again, this should focus on specifications & justifications for those specifications.  This does include cloud hosted servers.

## Identity & Access Management

Assume you are going to host an Active Directory environment for your client organization.

Provide for your client organization a logical diagram of Organizational Units & Groups.  Since diagrams should not be wordy, include a description of intent for each OU and Group.  

Recommend one or two Group Policy Objects that would apply to each OU.  
    - If a Group Policy is going to be used repeatedly, give it it's own bullet point and description, and refer to it by name for the OU(s) it applies to.

Recommend how different groups would be utilized for control over OUs or access permissions to resources.

### Resources

You can use whatever tools you would like, here are some recommended tools that people use for building clean diagrams

- [Lucid Charts](https://www.lucidchart.com/pages/)
- [`Textographo`](https://textografo.com/)
- [Mermaid - new markdown feature](https://github.blog/2022-02-14-include-diagrams-markdown-files-mermaid/)
- PowerPoint and OneNote are still good choices

## External Facing Website Management

1. Determine if the client organization's external website will be hosted internally or in the cloud.  Provide justification for your decision - this should reflect points we have discussed in class such as cost & hardware maintenance.

2. Determine the software stack for the client organization's website.

Make sure your network administration and company hardware plans accurately reflects your needs from this portion.

## Company / Internal Data Management

1. Determine the types of data that your client organization will be working with.  "Data" should consider employee records, files on employee devices, client information, code bases / projects.  For each category of data, identify the primary compliance principles that apply.

2. Determine how the storage for the different categories of data will be handled.  You may self host with one or more servers or cloud host, but with either identify and justify what you are using

3. Based on your Identity & Access Management plan, determine which groups will have access to which data categories.  Your notes here should be reflected in the description for your Groups in the IAM section.

Make sure your network administration and company hardware plans accurately reflects your needs from this portion.

## Backup Plan

1. For each type of data and systems (including employee devices), identify the items below.  I will allow a "no-backups needed" justification if you can prove your data plan handles it.
    - Backup schedule
    - What to backup (just data, or entire system setup)
    - Time to keep backups
    - Estimated time to restore from backup

2. Identify the backup locations for each type category above.  This should be thoughtful to the different types of data and where your data plan says it will live exist.  For non-essential data, you need at least one backup location.  For essential data, the rule of thumb is 3-2-1:
    - 3 - You create three copies of your data — the original data on your primary device and at least two copies.
    - 2 - You use two different storage devices — here, it’s up to you to choose the two storage media carriers — your PC, external hard drive, a USB flash drive, DVD, NAS or cloud storage devices such as GitHub or OneDrive.
    - 1 - You keep one of the backup copies off-site — by keeping copies of your data in a remote location, you prevent data loss due to a local disaster or a site-specific failure scenario.
        - If this adds another server / resource to the fix, it should be reflected in your overall plan
    - [Source](https://www.acronis.com/en-us/blog/posts/backup-rule/)

## Submission

- In the Pilot Dropbox, paste the URL to the your Final Project documentation in your GitHub repo
  - URL should look like: https://github.com/WSU-kduncan/ceg2410s24-YOURGITHUBUSERNAME/tree/main/FINAL-ITPlan.md

## Rubric

[Rubric.md](Rubric.md)