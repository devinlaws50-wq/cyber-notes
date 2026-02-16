
# Week 4 — Active Directory Lab (AWS)

## Objective
Build a hands-on Active Directory (AD) lab in AWS to practice common Helpdesk tasks (user creation, groups, password resets, and account unlocks) and strengthen IAM fundamentals.

---

## Environment
- **Platform:** AWS EC2 (Windows Server)
- **Instance Type:** t3.xlarge
- **Access:** RDP from Mac (Microsoft Remote Desktop)
- **Key Pair:** Created and saved locally for Windows password decryption
- **Network:** Deployed into existing Week 3 VPC (public subnet for RDP access)

---

## What I Built

### 1. Windows Server in AWS
- Launched a Windows Server EC2 instance in existing VPC
- Created a key pair and decrypted the Windows Administrator password
- Connected successfully via RDP

### 2. Domain Controller Setup
- Renamed server to `DC01`
- Installed Active Directory Domain Services (AD DS)
- Verified AD tools via Server Manager → Tools

### 3. Active Directory Structure
Created Organizational Units (OUs) to simulate company structure:
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
- Verified group membership using **Member Of** tab

---

## Helpdesk Skills Practiced
- Creating AD user accounts
- Creating security groups
- Adding users to groups (RBAC / least privilege)
- Navigating ADUC (Active Directory Users and Computers)

---

## Key Concepts Learned
- Active Directory manages users, groups, and access in enterprise environments
- RBAC via group membership is preferred over direct permission assignment
- This lab bridges cloud IAM concepts with enterprise AD fundamentals

---

## Next Steps
- Password reset and account unlock scenarios
- Account lifecycle tasks (disable/enable)
- (Optional) Join a second Windows client EC2 instance to the domain
- Map actions to ServiceNow-style tickets

---

## Cost Control
Stop the EC2 instance when not in use to avoid unnecessary charges.
