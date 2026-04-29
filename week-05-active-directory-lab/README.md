# Week 5 — Active Directory Lab (AWS)

![AWS](https://img.shields.io/badge/Cloud-Amazon%20AWS-FF9900?logo=amazonaws&logoColor=white)
![Windows Server](https://img.shields.io/badge/OS-Windows%20Server-0078D6?logo=windows&logoColor=white)
![Active Directory](https://img.shields.io/badge/Service-Active%20Directory-0078D4?logo=microsoftazure&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-success)
![License](https://img.shields.io/badge/License-Private-inactive)

## 📌 Objective

Build a hands-on Active Directory (AD) lab in AWS to practice common Helpdesk tasks — user creation, groups, password resets, and account unlocks — while strengthening IAM fundamentals and enterprise identity management skills.

---

## 🛠️ Tools & Technologies

- Amazon Web Services (AWS)
- AWS EC2
- Windows Server
- Active Directory Domain Services (AD DS)
- Active Directory Users and Computers (ADUC)
- Microsoft Remote Desktop (RDP)

---

## 🧱 Environment

- **Platform:** AWS EC2 (Windows Server)
- **Instance Type:** t3.xlarge
- **Access:** RDP from Mac (Microsoft Remote Desktop)
- **Key Pair:** Created and saved locally for Windows password decryption
- **Network:** Deployed into existing Week 3 VPC (public subnet for RDP access)

---

## ⚙️ What I Built

### 1. Windows Server in AWS
- Launched a Windows Server EC2 instance in existing VPC
- Created a key pair and decrypted the Windows Administrator password
- Connected successfully via RDP

### 2. Domain Controller Setup
- Renamed server to `DC01`
- Installed Active Directory Domain Services (AD DS)
- Verified AD tools via Server Manager → Tools

### 3. Active Directory Structure
Created Organizational Units (OUs) to simulate a company structure:
- Employees
- IT
- Disabled Users

### 4. Security Groups (RBAC)
Created security groups for role-based access control:
- IT-Admins
- Helpdesk-Users
- Password-Reset-Team

### 5. User & Group Membership
- Created test user in Active Directory
- Added user to `Helpdesk-Users`
- Verified group membership using the **Member Of** tab

---

## 🔐 Helpdesk Skills Practiced

- Creating AD user accounts
- Creating security groups
- Adding users to groups (RBAC / least privilege)
- Navigating ADUC (Active Directory Users and Computers)

---

## 🧠 Key Concepts Learned

- Active Directory manages users, groups, and access in enterprise environments
- RBAC via group membership is preferred over direct permission assignment
- This lab bridges cloud IAM concepts with enterprise AD fundamentals

---

## ⚠️ Cost Control

Stop the EC2 instance when not in use to avoid unnecessary charges.

---

## ✅ Outcome

Successfully built and configured an Active Directory Domain Controller on AWS EC2, practicing real-world Helpdesk and identity management tasks in an enterprise-style environment.
