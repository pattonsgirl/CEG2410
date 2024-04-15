# Final Project - IT Plan

This project is a detailed revisit to the IT plan assignment that you did week 1 / 2.  The intent is that now that you have explored concepts throughout this course, you can provide a more knowledgeable outline of different areas of IT within a small business.

This project may be completed in substitution of your final exam.

## Network Administration

1. Determine the client organization's domain name.

2. Determine the number of subnets appropriate for the client organization.   You may use a private subnet block of your choice.
    - [Reminder of valid private subnet blocks](https://en.wikipedia.org/wiki/Private_network)
    - For each subnet within your private subnet block, determine:
        - Reason for subnet
        - Subnet range
        - Ports that need to allow inbound access
    - If you are going to use the cloud for resources described below, you need to additionally write the same report for your VPC network

3. Determine the starting set up networking equipment between routers, switches, access points, and firewalls.  I am looking less for brand recognition, and more for a generic shopping list of devices needed to support the client organization's networking setup.

4. Determine how many public IPv4 addresses you will need between the client organization location & cloud services.  List what resources need a public IPv4 address.

5. Determine a short list of **external DNS** record needs.  I am seeking the domain / sub-domain name and to what publicly addressable servers they need to tie to.

6. Determine a short list of **internal DNS** record needs.  I am seeking the domain / sub-domain name and to what internally addressable servers they need to tie to.

## Company Hardware

1. Determine a set of specifications for employee devices working at the client organization.  I am looking for specifications & justifications of those specifications.  You may have different sets of specifications for different employee roles.

2. Determine sets of specifications for servers within the client organization.  Again, this should focus on specifications & justifications for those specifications.  This does include cloud hosted servers.

## Identity & Access Management

Assume you are going to host an Active Directory environment for your client organization.

Provide for your client organization a logical diagram of Organizational Units & Groups.  Since diagrams should not be wordy, include a description of intent for each OU and Group.  

Recommend one or two Group Policy Objects that would apply to each OU.  If a Group Policy is going to be used repeatedly, give it it's own bullet point and description, and refer to it by name for the OU(s) it applies to.

### Resources

You can use whatever tools you would like, here are some recommended tools that people use for building clean diagrams

- [Lucid Charts](https://www.lucidchart.com/pages/)
- [Textographo](https://textografo.com/)
- [Mermaid - new markdown feature](https://github.blog/2022-02-14-include-diagrams-markdown-files-mermaid/)
- PowerPoint and OneNote are still good choices

## External Facing Website

1. Determine if the client organization's external website will be hosted internally or in the cloud.  Provide justification for your decision - this should reflect points we have discussed in class such as cost & hardware maintenance.

2. Determine the software stack for the client organization's website.

Make sure your network administration and company hardware plans accurately reflect your needs from this portion.

## Company / Internal Data

1. Determine the types of data that your client organization will be working with.  "Data" should consider employee records, client information, code bases / projects.  For each category of data, identify the primary compliance principles that apply.

2. Determine how the storage for the different categories of data will be handled.

3. Based on your Identity & Access Management plan, determine which groups will have access to which data categories.  Your notes here should be reflected in the description for your Groups in the IAM section.

Make sure your network administration and company hardware plans accurately reflect your needs from this portion.

## Backup Plan

