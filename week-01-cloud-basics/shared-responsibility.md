# AWS Shared Responsibility Model

## Overview

The AWS Shared Responsibility Model defines the security obligations split between AWS and the customer. The core principle is simple:

> **AWS secures the cloud. The customer secures what they put in the cloud.**

Understanding this boundary is critical — most cloud security incidents don't happen because AWS failed. They happen because customers misconfigure resources, over-provision access, or leave data exposed. Knowing exactly where your responsibility begins is the first step to building secure cloud environments.

---

## AWS Responsibilities — Security *of* the Cloud

AWS owns the physical and foundational layers of the infrastructure:

- **Physical security** — data centers, hardware, power, cooling, and physical access controls
- **Global infrastructure** — Regions, Availability Zones, and Edge Locations
- **Hypervisor and virtualization layer** — the underlying compute fabric that runs EC2 and other services
- **Managed service security** — for services like S3, RDS, and Lambda, AWS manages the underlying OS, patching, and runtime environment
- **Network infrastructure** — the backbone routing, DDoS protection at the network level (AWS Shield Standard)

If an AWS data center floods or a hypervisor has a vulnerability, that's AWS's problem to fix — not yours.

---

## Customer Responsibilities — Security *in* the Cloud

Everything you deploy and configure is your responsibility:

- **Identity & Access Management (IAM)** — who can access what, and with how much privilege
- **Data classification and encryption** — encrypting data at rest and in transit is opt-in, not automatic
- **Network configuration** — security groups, NACLs, VPC routing, and public subnet exposure
- **Operating system and application patching** — for IaaS services like EC2, you own the OS and everything running on it
- **Logging and monitoring** — enabling CloudTrail, CloudWatch, and GuardDuty is your choice
- **Incident response** — detecting, responding to, and recovering from security events in your environment

---

## The Boundary Shifts by Service Type

The split isn't fixed — it depends on the type of service being used:

| Service Model | AWS Manages | Customer Manages |
|---------------|-------------|------------------|
| **IaaS** (e.g., EC2) | Hardware, hypervisor, networking fabric | OS, runtime, app, data, IAM, network config |
| **PaaS** (e.g., RDS, Elastic Beanstalk) | Hardware, OS, runtime, patching | Application code, data, IAM, network config |
| **SaaS** (e.g., WorkMail, Chime) | Almost everything infrastructure-related | User access, data governance, and compliance |

The higher up the stack you go, the more AWS manages — but you never hand over responsibility for your data or access controls.

---

## Real-World Examples

| Scenario | Whose Responsibility? |
|----------|----------------------|
| AWS data center loses power | AWS |
| S3 bucket is left publicly readable | Customer |
| EC2 instance OS has an unpatched CVE | Customer |
| RDS database engine has a vulnerability | AWS |
| IAM user credentials are leaked | Customer |
| AWS hypervisor is exploited | AWS |
| CloudTrail logging is never enabled | Customer |

---

## Key Takeaway

The shared responsibility model means you can trust AWS to run reliable, secure infrastructure — but you cannot assume that means your workloads are secure by default. Every IAM policy you write, every security group you configure, and every encryption setting you enable (or skip) is on you.

Misconfigured customer resources are the leading cause of cloud breaches — not AWS infrastructure failures.
