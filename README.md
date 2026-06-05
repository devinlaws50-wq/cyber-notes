# Devin Laws — Cloud Security & Systems Administration Portfolio

![Azure](https://img.shields.io/badge/Microsoft-Azure-0078D4?style=flat-square&logo=microsoftazure&logoColor=white)
![AWS](https://img.shields.io/badge/Amazon-AWS-FF9900?style=flat-square&logo=amazonaws&logoColor=white)
![Terraform](https://img.shields.io/badge/HashiCorp-Terraform-7B42BC?style=flat-square&logo=terraform&logoColor=white)
![Microsoft Sentinel](https://img.shields.io/badge/Microsoft-Sentinel-5E5ADB?style=flat-square&logo=microsoft&logoColor=white)
![Splunk](https://img.shields.io/badge/Splunk-SIEM-68C200?style=flat-square&logo=splunk&logoColor=white)
![PowerShell](https://img.shields.io/badge/Microsoft-PowerShell-5391FE?style=flat-square&logo=powershell&logoColor=white)
![Windows Server](https://img.shields.io/badge/Windows-Server%202022-0078D6?style=flat-square&logo=windows&logoColor=white)
![KQL](https://img.shields.io/badge/Kusto-KQL-2563EB?style=flat-square)

Systems Administrator building toward Cloud Security Engineering. This repository documents 16 weeks of hands-on production-style labs across Azure, AWS, Terraform, Microsoft Sentinel, Splunk, Active Directory, and Windows Server hardening. Every lab solves a real operational problem — not just theory.

**LinkedIn:** [linkedin.com/in/dlaws2030](https://www.linkedin.com/in/dlaws2030) · **Location:** Miami, FL

---

## Table of Contents

- [What This Repo Proves](#what-this-repo-proves)
- [Featured Projects](#featured-projects)
- [Labs by Capability Area](#labs-by-capability-area)
  - [Secure Azure Environments](#secure-azure-environments)
  - [Security Operations & SIEM](#security-operations--siem)
  - [Identity, Access & Hybrid AD](#identity-access--hybrid-ad)
  - [Network Security](#network-security)
  - [Windows Hardening & Administration](#windows-hardening--administration)
- [Skills & Tools](#skills--tools)
- [Portfolio Map](#portfolio-map)

---

## What This Repo Proves

- **Cloud governance and posture management** — RBAC, Azure Policy enforcement, cost controls, and landing zone design
- **SIEM deployment and detection engineering** — Microsoft Sentinel with KQL analytics rules, Splunk with SPL dashboards, log ingestion pipelines
- **Identity and access management** — Entra ID, RBAC, AWS IAM, Azure Key Vault managed identity, and hybrid Active Directory
- **Infrastructure as code** — End-to-end Azure environments provisioned and documented in Terraform
- **Windows security administration** — GPO hardening, domain controller setup, file server ACLs, and object access auditing
- **Network security design** — VPC/VNet architecture, segmented subnets, NSG and security group rules, least-privilege access paths

---

## Featured Projects

| Lab | Platform | What It Demonstrates |
|-----|----------|----------------------|
| [Azure Sentinel Threat Detection](week-14-azure-sentinel-landing-zone/README.md) | Azure + Terraform + KQL | SIEM onboarding, KQL brute force detection, scheduled analytics rule |
| [Linux SIEM Monitoring with Splunk](week-12-splunk-siem-log-analysis/README.md) | Azure + Splunk | SOC dashboard, auth log analysis, SPL detection queries |
| [Azure Landing Zone with Terraform](week-13-azure-landing-zone/README.md) | Azure + Terraform | Segmented IaC infrastructure, NSG rules, centralized Log Analytics |
| [Windows Server GPO Hardening](week-15-windows-server-gpo-hardening/README.md) | Azure + Windows Server | AD forest, GPO password policy, restricted local admin, policy validation |
| [Azure Governance & Security Hardening](week-11-azure-governance/README.md) | Azure | RBAC, Azure Policy, cost management, governance controls |
| [Windows File Server & Access Control](week-16-windows-file-server-access-control/README.md) | Windows Server + AD | SMB shares, NTFS permissions, AD group-based RBAC, audit logging |

---

## Labs by Capability Area

### Secure Azure Environments

| Lab | Key Skills | Walkthrough |
|-----|------------|-------------|
| [Azure Governance & Security Hardening](week-11-azure-governance/README.md) | RBAC, Azure Policy, Cost Management, Entra ID — *proves ability to enforce cloud compliance controls* | [![Loom](https://img.shields.io/badge/Loom-Watch-625DF5?logo=loom&logoColor=white)](https://www.loom.com/share/placeholder) |
| [Azure Landing Zone with Terraform](week-13-azure-landing-zone/README.md) | Segmented resource groups, NSG hardening, Log Analytics, Terraform IaC — *proves ability to build enterprise-grade cloud foundations* | — |
| [Azure 2-Tier Infrastructure](week-07-azure-2tier-app/README.md) | VNet, NSGs, public/private subnet segmentation — *proves hands-on Azure networking* | — |
| [Azure Key Vault + Managed Identity](week-08-azure-keyvault-identity/README.md) | Key Vault, Managed Identity, Entra ID, zero-trust access patterns — *proves secrets management and identity-based authorization* | — |
| [Azure Static Website](week-06-azure-static-website/README.md) | Blob Storage, static hosting, public endpoints | — |

---

### Security Operations & SIEM

| Lab | Key Skills | Walkthrough |
|-----|------------|-------------|
| [Azure Sentinel Threat Detection](week-14-azure-sentinel-landing-zone/README.md) | Microsoft Sentinel, KQL, AMA Syslog ingestion, scheduled analytics rules — *proves detection engineering end-to-end* | — |
| [Linux SIEM Monitoring with Splunk](week-12-splunk-siem-log-analysis/README.md) | Splunk Enterprise, SPL, auth log ingestion, SOC dashboards — *proves ability to build and operate a cloud-hosted SIEM* | [![Loom](https://img.shields.io/badge/Loom-Watch-625DF5?logo=loom&logoColor=white)](https://www.loom.com/share/092386194773439ba6963587796b24fb) |
| [Wireshark Network Traffic Analysis](week-04-wireshark-network-analysis/README.md) | TCP handshake analysis, DNS/HTTP/HTTPS packet inspection, display filters | — |

---

### Identity, Access & Hybrid AD

| Lab | Key Skills | Walkthrough |
|-----|------------|-------------|
| [Azure AD Domain Controller via Terraform](week-10-azure-ad-domain-controller-terraform/README.md) | AD DS on Azure, Custom Script Extension, DNS, IaC + identity integration — *proves infrastructure-driven AD deployment* | [![Loom](https://img.shields.io/badge/Loom-Watch-625DF5?logo=loom&logoColor=white)](https://www.loom.com/share/4d86d952dc104aa296dde9d78cd17249) |
| [Active Directory Lab](week-05-active-directory-lab/README.md) | AD DS, OUs, RBAC groups, ADUC, helpdesk provisioning tasks — *proves hands-on Windows identity administration* | — |
| [IAM & Identity Security](week-02-iam/README.md) | AWS IAM users/roles, least-privilege policies, STS, policy debugging | — |
| [Azure Key Vault + Managed Identity](week-08-azure-keyvault-identity/README.md) | Key Vault secrets, Managed Identity, RBAC, zero-trust | — |

---

### Network Security

| Lab | Key Skills | Walkthrough |
|-----|------------|-------------|
| [AWS VPC & Network Security](week-03-vpc-networking/README.md) | VPC design, public/private subnets, route tables, security groups, EC2 — *proves segmented network architecture with least-privilege access paths* | [![Loom](https://img.shields.io/badge/Loom-Watch-625DF5?logo=loom&logoColor=white)](https://www.loom.com/share/a25835f7ad6c4cad99b83d215b7ee036) |
| [Azure Landing Zone with Terraform](week-13-azure-landing-zone/README.md) | VNet segmentation, NSG rules scoped by subnet, SSH access control | — |
| [Azure 2-Tier Infrastructure](week-07-azure-2tier-app/README.md) | NSGs, subnet isolation, inbound/outbound rule configuration | — |
| [Wireshark Network Traffic Analysis](week-04-wireshark-network-analysis/README.md) | Packet analysis, protocol inspection, network traffic interpretation | — |

---

### Windows Hardening & Administration

| Lab | Key Skills | Walkthrough |
|-----|------------|-------------|
| [Windows Server GPO Hardening](week-15-windows-server-gpo-hardening/README.md) | AD forest, GPO password policy, account lockout, Restricted Groups, `gpupdate`/`gpresult` validation — *proves end-to-end Windows hardening and policy enforcement* | [![Loom](https://img.shields.io/badge/Loom-Watch-625DF5?logo=loom&logoColor=white)](https://www.loom.com/share/6d6c27c993254649a2ca5d64d586128b) |
| [Windows File Server & Access Control](week-16-windows-file-server-access-control/README.md) | SMB shares, NTFS permissions, AD group RBAC, object access auditing — *proves least-privilege file access design and audit trail configuration* | — |
| [Active Directory Lab](week-05-active-directory-lab/README.md) | OU structure, user/group provisioning, AD administration | — |

---

## Skills & Tools

| Category | Technologies |
|---|---|
| **Cloud Platforms** | Microsoft Azure, Amazon AWS |
| **Identity & Access** | Active Directory, Microsoft Entra ID, AWS IAM, Azure Key Vault, RBAC, Group Policy |
| **SIEM & Monitoring** | Microsoft Sentinel, Splunk Enterprise, KQL, SPL, Log Analytics, Azure Monitor |
| **Infrastructure as Code** | Terraform (HCL), Azure Resource Manager |
| **Scripting & Automation** | PowerShell, Bash, Azure CLI |
| **OS & Infrastructure** | Windows Server 2022, Ubuntu Server, Windows 10/11 |
| **Network Security** | VPC/VNet design, NSGs, Security Groups, route tables, subnet segmentation |
| **Governance & Compliance** | Azure Policy, Cost Management, RBAC scoping, landing zone design |

---

## Portfolio Map

See [portfolio-map.md](portfolio-map.md) for a full matrix of all 16 labs with platform, security focus, job responsibility proof, and status.

---

*This is a living portfolio. Labs are added and improved as skills grow.*  
[linkedin.com/in/dlaws2030](https://www.linkedin.com/in/dlaws2030) · Miami, FL
