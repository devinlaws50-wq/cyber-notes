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

### 🔐 Shared Responsibility Model

The Shared Responsibility Model defines the security obligations split between AWS and the customer.

| Responsibility | Owner |
|----------------|-------|
| Physical data centers, hardware, and global infrastructure | **AWS** |
| Hypervisor, networking fabric, and managed service security | **AWS** |
| Customer data and encryption | **Customer** |
| Application-level security and configurations | **Customer** |
| Identity and access management (IAM) | **Customer** |
| Operating system patching (for IaaS resources) | **Customer** |

**AWS secures the cloud. The customer secures what they put in the cloud.**

#### Real-World Examples

- **AWS secures:** Physical data centers — the customer has no access to the underlying hardware
- **Customer secures:** Who has access to AWS resources, how data is encrypted, and how applications are configured

---

## 🧠 Key Concepts Learned

- Cloud providers own infrastructure security; customers own their data and access controls
- Misunderstanding the shared responsibility model is one of the leading causes of cloud breaches
- Least-privilege IAM policies are the customer's first line of defense
- Security configurations are never automatic — they must be intentionally applied

---

## ✅ Outcome

Established a clear understanding of the AWS Shared Responsibility Model and cloud security fundamentals, forming the foundation for all hands-on labs in this portfolio.
