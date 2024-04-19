# Final Project: IT Plan Rubric

Score: / 100

# Criteria: Core Content (75 points)

## Introduction (5 points)
- Provides a clear overview of the IT plan's purpose and scope.
- States the goals and objectives of the IT plan.

## Network Administration (15 points)
- Proposes an available domain name and associated fee of ownership
- Presents subnet blocks for different network resources at the client's location.  Addresses:
    - Description of devices on subnet
    - Subnet range, and therefore number of devices supported on the subnet
    - Inbound & outbound firewall rules
        - Inbound should specify what traffic is allowed in, on what ports, and from which subnets
        - Outbound should restrict access appropriate to common restrictions
- Proposes required networking equipment to support the envisioned network structure
- Determines a reservation of IPv4 addresses based on the networking plan and subsections that follow.  Lists what the intent is for each IPv4 address reservation.
- Proposes a list of initial external DNS records.  For each record need, write the record domain / subdomain and what publicly addressable resource it would tie to.
- Proposes a list of initial internal DNS records.  For each record need, write the record domain / subdomain and what internally addressable resource it would tie to.
- Reflects decisions made in subsections that follow.

## Hardware Recommendations (15 points)
- Proposes for each employee (and client group, depending) a minimum set of hardware requirements for devices.  A reflection is shown on the day to day taskings expected of an employee in that role. The specifications should be paired with an explanation of anticipated usage so that the client organization can see why these specs should be sufficient.
- Proposes for each server or server group a minimum set of hardware requirements.  The specifications should be paired with an explanation of anticipated usage so that the client organization can see why these specs should be sufficient.
- Reflects decisions made in subsections that follow.

## Identity & Access Management (10 points)
- Proposes an Active Directory structure for the client organization to review.  It is required that there is a visual diagram of OU and groups within their AD domain.  If a legend is required it should be included in the diagram or detailed near the diagram.
- For the AD organizational structure, a description of intent behind the OUs and groups is provided to the client organization.
- Recommend Group Policy settings for each OU, and recommend how the different groups would be utilized for control over OUs or access permissions to resources.

## External Facing Website (10 points)
- Proposes hosting the external website in the cloud or on-premise, and sufficiently justifies the decision to the client organization (reflects costs by providing estimates, hardware maintenance, and uptime).
- Recommends a software stack for the website based on common languages & features used on sites by peers.

## Internal Data Management (10 points)
- Lists differing data categories that the company will be working with and compliance rules that will need to be considered.
- Proposes data storage strategies for each data category identified, and notes where the data categories will be stored.  There should be thoughtful justification on needs to segregate data - different servers versus access control.
- Reflects on the IAM Management plan 

## Backup Plan (10 points)
- Propose, for each data category, a recommendation of
    - Backup schedule
    - Elements included in the backup
    - Time to keep backups
    - Estimated time to restore from backup
- Following the rule of three where applicable, identify backup recommendations for each data category
- Plan is reflected in needs in the Networking & Hardware plans above 

# Criteria: Organization and Clarity (15 points)

- Structure and Flow (10 points)
    - Information is organized logically and flows smoothly.
    - Headings and subheadings are used effectively.
- Clarity and Conciseness (5 points)
    - Writing is clear, concise, and free from jargon.
    - Concepts are explained in a straightforward manner.

# Criteria: Presentation and Style (10 points)

- Formatting and Design (5 points)
    - Uses appropriate formatting (e.g., font size,and spacing).
    - Includes visual elements (e.g., tables, diagrams) where applicable.
- Grammar and Mechanics (5 points)
    - Demonstrates excellent grammar, punctuation, and spelling.
    - Writing style is professional and engaging.