# Cybersecurity Learning Notes

This repository documents a transition into cybersecurity with a focus on AWS cloud security. It contains hands-on labs, concise notes, diagrams, and lessons learned.

## Goals
- Build strong cloud security fundamentals
- Gain hands-on AWS IAM, logging, and detection experience
- Transition into a cloud security or SOC role
  
## Projects

### Week 5 — Azure Static Website Hosting

Deployed a static website using Azure Storage Accounts and Blob Storage static website hosting.

Key skills:

- Azure Storage Accounts
- Blob containers
- Static website configuration
- Public web hosting

---

### Week 6 — Azure 2-Tier Cloud Architecture

Designed and deployed a segmented cloud architecture including:

- Azure Virtual Network
- Public and Private Subnets
- Ubuntu Virtual Machines
- Apache Web Server
- Network Security Groups
- SSH administration and troubleshooting

Architecture flow:

Internet → Public IP → App Server → DB Server

Designed and deployed a segmented Azure architecture with a public web server and a private database server using Virtual Networks and Network Security Groups.

### Architecture Diagram

![Azure Architecture](week-06-azure-2tier-app/screenshots/architecture-diagram.png)

### Deployment Screenshots

Virtual Network and Subnets

![VNet](week-06-azure-2tier-app/screenshots/vnet-subnets.png)

Application Server Deployment

![App Server](week-06-azure-2tier-app/screenshots/app-server-vm.png)

Database Server Deployment

![DB Server](week-06-azure-2tier-app/screenshots/db-server-vm.png)

Network Security Group Rules

![App NSG](week-06-azure-2tier-app/screenshots/app-server-nsg.png)

![DB NSG](week-06-azure-2tier-app/screenshots/db-server-nsg.png)

### Verification

Apache was verified running locally and externally.

Local server test:

![Apache Local Test](week-06-azure-2tier-app/screenshots/apache-local-test.png)

Public access test:

![Apache Public](week-06-azure-2tier-app/screenshots/apache-public-access.png)

### Technologies Used

- Microsoft Azure
- Virtual Networks (VNet)
- Subnets
- Network Security Groups (NSG)
- Linux Virtual Machines
- Apache Web Server
- SSH

## Structure
cyber-notes
│
├ week-01-cloud-basics
├ week-02-iam
├ week-03-vpc-networking
├ week-04-active-directory-lab
├ week-05-azure-static-website
└ week-06-azure-2tier-app

Each lab folder contains:

- Project documentation
- Architecture diagrams
- Configuration screenshots
- Step-by-step explanations

## Getting started
1. Clone: `git clone https://github.com/<you>/cyber-notes.git`
2. Prereqs: AWS account, AWS CLI configured, optional Terraform/CloudFormation
3. Follow individual lab READMEs in `labs/` for step-by-step instructions and cleanup.

## Lab workflow
- Isolate resources by using unique AWS accounts or named profiles.
- Capture commands, outcomes, and screenshots in `screenshots/`.
- Include a short post-mortem in `notes/` for each lab.

## Security & ethics
Only run labs in accounts you own or are authorized to use. Sanitize any real credentials before committing.

## Contributing
- Add new labs under `labs/` with a README, resources list, and teardown steps.
- Keep notes concise and reproducible.

## License
Add a LICENSE file appropriate for your use (e.g., MIT).

<!-- Update this README as you progress; keep examples small and reproducible. -
