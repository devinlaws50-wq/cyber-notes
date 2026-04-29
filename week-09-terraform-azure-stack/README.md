# Week 9 — Terraform Azure Infrastructure Deployment

![Terraform](https://img.shields.io/badge/IaC-Terraform-7B42F6?logo=terraform&logoColor=white)
![Azure](https://img.shields.io/badge/Cloud-Microsoft%20Azure-0078D4?logo=microsoftazure&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-success)
![License](https://img.shields.io/badge/License-Private-inactive)

## 📌 Objective

Deploy a complete Azure infrastructure stack using Terraform, manage local state, and understand infrastructure lifecycle operations — from initialization through teardown.

---

## 🛠️ Tools & Technologies

- Terraform
- Microsoft Azure
- Azure CLI
- Visual Studio Code
- Lucid (Architecture Diagram)

---

## 🧱 Infrastructure Deployed

Using Terraform, the following resources were provisioned in Azure:

- Azure Resource Group
- Storage Account
- Log Analytics Workspace
- Virtual Network (VNet)
- Subnet
- Random string resource (for unique naming)

---

## 📂 Project Structure

```text
week-09-terraform-azure-stack/
├── main.tf
├── outputs.tf
├── terraform.tfvars
├── .terraform/
├── terraform.tfstate
├── .gitignore
└── diagrams/
    └── week9-architecture-diagram.png
```

---

## ⚙️ Key Terraform Commands

```bash
# Initialize Terraform
terraform init

# Preview changes
terraform plan

# Deploy infrastructure
terraform apply

# Destroy infrastructure
terraform destroy
```

---

## 🗺️ Architecture Diagram

![Architecture Diagram](./diagrams/week9-architecture-diagram.png)

---

## 📸 Verification

Resources were successfully deployed and verified in the Azure Portal within the resource group:

`rg-week9-terraform-lab`

---

## 🧠 Key Concepts Learned

- Infrastructure as Code (IaC) with Terraform
- Azure Provider configuration
- Local state management (`terraform.tfstate`)
- Resource dependency handling
- Authentication using Azure CLI
- Full infrastructure lifecycle: create → manage → destroy

---

## ⚠️ Notes & Best Practices

- Local state was intentionally used for learning purposes
- Sensitive files are excluded via `.gitignore`
- In production, remote state storage (e.g., Azure Storage backend) is strongly recommended

---

## ✅ Outcome

Successfully deployed and managed a complete Azure infrastructure stack using Terraform, demonstrating real-world cloud engineering and DevOps practices through Infrastructure as Code.
