# Week 1 — Cloud Basics & Shared Responsibility

![AWS](https://img.shields.io/badge/Cloud-Amazon%20AWS-FF9900?logo=amazonaws&logoColor=white)
![Concept](https://img.shields.io/badge/Topic-Cloud%20Fundamentals-232F3E?logo=amazonaws&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-success)
![License](https://img.shields.io/badge/License-Private-inactive)

## 📌 Objective

Build a foundational understanding of cloud computing and the AWS Shared Responsibility Model — establishing the security baseline that all future labs build upon.

---

## 🛠️ Tools & Technologies

- Amazon Web Services (AWS)
- AWS Management Console
- AWS Documentation

---

## 🧠 Key Concepts Covered

### ☁️ Cloud Basics

- What cloud computing is and how it differs from on-premises infrastructure
- AWS global infrastructure (Regions, Availability Zones, Edge Locations)
- Core AWS service categories: Compute, Storage, Networking, Identity

---

### 🔐 Shared Responsibility Model

> **AWS secures the cloud. The customer secures what they put in the cloud.**

Understanding this boundary is critical — most cloud security incidents don't happen because AWS failed. They happen because customers misconfigure resources, over-provision access, or leave data exposed.

#### AWS Responsibilities — Security *of* the Cloud

| Area | What AWS Owns |
|------|--------------|
| Physical security | Data centers, hardware, power, cooling, and physical access controls |
| Global infrastructure | Regions, Availability Zones, and Edge Locations |
| Hypervisor & virtualization | The underlying compute fabric that runs EC2 and other services |
| Managed service security | OS, patching, and runtime for services like S3, RDS, and Lambda |
| Network infrastructure | Backbone routing and DDoS protection (AWS Shield Standard) |

#### Customer Responsibilities — Security *in* the Cloud

| Area | What the Customer Owns |
|------|----------------------|
| Identity & Access Management | Who can access what, and with how much privilege |
| Data encryption | Encrypting data at rest and in transit — opt-in, not automatic |
| Network configuration | Security groups, NACLs, VPC routing, and public subnet exposure |
| OS and app patching | For IaaS (e.g., EC2), you own the OS and everything running on it |
| Logging & monitoring | Enabling CloudTrail, CloudWatch, and GuardDuty is your choice |
| Incident response | Detecting, responding to, and recovering from events in your environment |

#### The Boundary Shifts by Service Type

| Service Model | AWS Manages | Customer Manages |
|---------------|-------------|------------------|
| **IaaS** (e.g., EC2) | Hardware, hypervisor, networking fabric | OS, runtime, app, data, IAM, network config |
| **PaaS** (e.g., RDS, Elastic Beanstalk) | Hardware, OS, runtime, patching | Application code, data, IAM, network config |
| **SaaS** (e.g., WorkMail, Chime) | Almost everything infrastructure-related | User access, data governance, and compliance |

The higher up the stack you go, the more AWS manages — but you never hand over responsibility for your data or access controls.

#### Real-World Scenarios

| Scenario | Responsibility |
|----------|---------------|
| AWS data center loses power | AWS |
| S3 bucket is left publicly readable | Customer |
| EC2 instance OS has an unpatched CVE | Customer |
| RDS database engine has a vulnerability | AWS |
| IAM user credentials are leaked | Customer |
| AWS hypervisor is exploited | AWS |
| CloudTrail logging is never enabled | Customer |

---

## 🧠 Key Concepts Learned

- Cloud providers own infrastructure security; customers own their data and access controls
- Misconfigured customer resources are the leading cause of cloud breaches — not AWS infrastructure failures
- The responsibility boundary shifts depending on whether you're using IaaS, PaaS, or SaaS
- Least-privilege IAM policies are the customer's first line of defense
- Security configurations are never automatic — they must be intentionally applied

---

## ✅ Outcome

Established a clear understanding of the AWS Shared Responsibility Model and cloud security fundamentals, forming the foundation for all hands-on labs in this portfolio.
