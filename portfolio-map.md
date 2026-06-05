# Portfolio Map — Devin Laws

A single source of truth for all completed labs: what was built, what it proves in job terms, and where coverage gaps remain.

**Last updated:** June 2026  
**Total labs:** 16  
**LinkedIn:** [linkedin.com/in/dlaws2030](https://www.linkedin.com/in/dlaws2030)

---

## Lab Matrix

| # | Lab Title | Platform | Security Focus | Job Responsibility Proof | Status | Cert Mapping |
|---|-----------|----------|----------------|--------------------------|--------|--------------|
| 1 | [Cloud Basics & Shared Responsibility](week-01-cloud-basics/README.md) | AWS | Cloud fundamentals, shared responsibility model | Explains cloud provider vs. customer security obligations — foundational for any cloud security role | ✅ Complete | AZ-900, CLF-C02 |
| 2 | [IAM & Identity Security](week-02-iam/README.md) | AWS | IAM, least privilege, policy debugging, STS | Configured IAM users, roles, and least-privilege policies; debugged access denials — maps to Identity and Access Management responsibilities | ✅ Complete | SAA-C03, SC-300 |
| 3 | [AWS VPC & Network Security](week-03-vpc-networking/README.md) | AWS | VPC design, subnet segmentation, security groups | Built segmented cloud network with public/private subnets and least-privilege security group rules — maps to Network Security Engineer responsibilities | ✅ Complete | SAA-C03, CompTIA Security+ |
| 4 | [Wireshark Network Traffic Analysis](week-04-wireshark-network-analysis/README.md) | Wireshark | Packet analysis, protocol inspection | Captured and analyzed TCP, DNS, HTTP/HTTPS traffic — maps to network security monitoring and incident investigation | ✅ Complete | CompTIA Security+, CompTIA Network+ |
| 5 | [Active Directory Lab](week-05-active-directory-lab/README.md) | AWS + Windows Server | AD DS, RBAC groups, OU design | Deployed AD DS, built OU structure, created users and RBAC groups, performed helpdesk provisioning tasks — maps to Systems Administrator / Identity Admin responsibilities | ✅ Complete | AZ-800, SC-300 |
| 6 | [Azure Static Website](week-06-azure-static-website/README.md) | Azure | Storage security, public endpoint configuration | Configured Blob Storage static hosting with access controls — foundational Azure storage security | ✅ Complete | AZ-104 |
| 7 | [Azure 2-Tier Infrastructure](week-07-azure-2tier-app/README.md) | Azure | VNet, NSGs, subnet segmentation | Built multi-tier Azure network with NSG rules restricting inbound traffic — maps to Cloud Infrastructure and Network Security responsibilities | ✅ Complete | AZ-104, AZ-500 |
| 8 | [Azure Key Vault + Managed Identity](week-08-azure-keyvault-identity/README.md) | Azure | Secrets management, zero-trust identity | Configured Key Vault secrets with Managed Identity access — eliminates credential hardcoding, maps to zero-trust and secrets management responsibilities | ✅ Complete | AZ-104, AZ-500, SC-300 |
| 9 | [Terraform Azure Stack](week-09-terraform-azure-stack/README.md) | Azure + Terraform | Infrastructure as Code, resource lifecycle | Provisioned Azure resources with Terraform, managed state, and implemented reusable IaC — maps to Cloud Engineer / DevSecOps responsibilities | ✅ Complete | AZ-104, HashiCorp Terraform Associate |
| 10 | [Azure AD Domain Controller via Terraform](week-10-azure-ad-domain-controller-terraform/README.md) | Azure + Terraform | Hybrid identity, AD on cloud | Automated AD DS deployment on Azure via Terraform and Custom Script Extension — maps to Hybrid Identity Engineer and Systems Administrator responsibilities | ✅ Complete | AZ-800, SC-300 |
| 11 | [Azure Governance & Security Hardening](week-11-azure-governance/README.md) | Azure | RBAC, Azure Policy, cost governance | Implemented RBAC scoping, Azure Policy for VM SKU enforcement, and cost budget alerts — maps to Cloud Security Engineer / Cloud Admin governance responsibilities | ✅ Complete | AZ-104, AZ-500, SC-200 |
| 12 | [Linux SIEM Monitoring with Splunk](week-12-splunk-siem-log-analysis/README.md) | Azure + Splunk | SIEM, log ingestion, SOC dashboards | Deployed Splunk, ingested Linux auth logs, built SOC dashboards detecting failed logins and privilege escalation — maps to SOC Analyst / Security Engineer responsibilities | ✅ Complete | CompTIA Security+, Splunk Core Certified User |
| 13 | [Azure Landing Zone with Terraform](week-13-azure-landing-zone/README.md) | Azure + Terraform | Landing zone design, segmented IaC, observability | Provisioned segmented Azure environment (3 resource groups) with NSG controls and Log Analytics — maps to Cloud Security Architect / Senior Cloud Engineer responsibilities | ✅ Complete | AZ-104, AZ-500, HashiCorp Terraform Associate |
| 14 | [Azure Sentinel Threat Detection](week-14-azure-sentinel-landing-zone/README.md) | Azure + Terraform + KQL | SIEM, KQL, detection engineering | Enabled Sentinel, ingested Syslog via AMA, wrote KQL brute force correlation queries, created scheduled analytics rule — maps to Detection Engineer / SOC Analyst responsibilities | ✅ Complete | SC-200, AZ-500 |
| 15 | [Windows Server GPO Hardening](week-15-windows-server-gpo-hardening/README.md) | Azure + Windows Server | GPO hardening, AD administration, endpoint policy | Deployed AD forest, configured password/lockout GPOs, enforced Restricted Groups for local admin control, validated with `gpresult` — maps to Systems Administrator / Windows Security Engineer | ✅ Complete | AZ-800, CompTIA Security+ |
| 16 | [Windows File Server & Access Control](week-16-windows-file-server-access-control/README.md) | Windows Server + AD | File server ACLs, NTFS permissions, audit logging | Configured SMB shares with layered NTFS/share permissions, AD group-based RBAC, object access auditing in Event Viewer — maps to Systems Administrator / Windows Security responsibilities | ✅ Complete | AZ-800, CompTIA Security+ |

---

## Coverage by Domain

| Domain | Labs | Gap / Next Step |
|--------|------|-----------------|
| Cloud Governance & Posture | 11, 13 | Add Defender for Cloud, Secure Score |
| SIEM & Detection Engineering | 12, 14 | Add Sentinel Workbooks, threat intel watchlists |
| Identity & Access Management | 2, 5, 8, 10 | Add Privileged Identity Management (PIM), Conditional Access |
| Network Security | 3, 7, 13 | Add Azure Firewall, DDoS protection |
| Windows Hardening & Administration | 15, 16 | Add advanced audit policy, Defender AV GPO settings |
| Infrastructure as Code | 9, 10, 13, 14 | Add CI/CD pipeline for Terraform (GitHub Actions) |
| Cloud Fundamentals | 1, 6 | Complete — foundational coverage done |

---

## Certification Alignment

| Certification | Covered by Labs |
|---------------|-----------------|
| CompTIA Security+ | 3, 4, 12, 15, 16 |
| AZ-104 (Azure Administrator) | 6, 7, 8, 9, 11, 13 |
| AZ-500 (Azure Security Engineer) | 7, 8, 11, 13, 14 |
| AZ-800 (Windows Server Hybrid) | 5, 10, 15, 16 |
| SC-200 (Microsoft Security Operations) | 11, 12, 14 |
| SC-300 (Identity & Access Administrator) | 2, 5, 8, 10 |
| HashiCorp Terraform Associate | 9, 13 |
| AWS SAA-C03 | 2, 3 |

---

*This file is the single source of truth for portfolio coverage. Update when labs are added or improved.*
