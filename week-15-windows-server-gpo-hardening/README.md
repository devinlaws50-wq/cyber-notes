# Week 15 – Windows Server GPO Hardening Lab

This lab walks through building and hardening an on-prem-style Windows Server environment using Group Policy Objects (GPOs) to reduce attack surface and enforce security baselines.

## Lab Objectives

- Deploy a Windows Server virtual machine in Azure to simulate an on-prem server.
- Configure basic server roles and features required for a small environment.
- Create and link Group Policy Objects to harden authentication, auditing, and user rights.
- Validate that GPO settings apply correctly using both GUI and command-line tools.
- Capture evidence screenshots and document the hardening impact.

## Architecture Overview

The following diagram shows the high-level architecture for this lab, including the Azure subscription, resource group, virtual network, and the Windows Server VM.

```mermaid
graph TD
    A[Azure Subscription] --> B[Resource Group: rg-windows-gpo-lab]
    B --> C[Virtual Network: vnet-onprem-sim]
    C --> D[Subnet: snet-servers]
    D --> E[Windows Server VM]

    E --> F[Local Users & Groups]
    E --> G[Group Policy Management Console]
    G --> H[GPO: Baseline Security]
    G --> I[GPO: Audit & Logging]

    H --> E
    I --> E
```

## Lab Environment

- Cloud provider: Microsoft Azure
- Resource group: `rg-windows-gpo-lab`
- Virtual network: `vnet-onprem-sim`
- Subnet: `snet-servers`
- Windows Server: 2022 Datacenter (Azure Marketplace image)
- VM size: `Standard_D2s_v3`
- Authentication: Local admin account (no domain controller in this lab)

## Prerequisites

- Active Azure subscription with permission to create resource groups and virtual machines.
- Azure Portal access.
- Basic familiarity with:
  - Windows Server administration
  - Group Policy Objects (GPOs)
  - RDP connectivity

---

## Step 1 – Deploy the Windows Server VM

1. Create a resource group for the lab.
2. Create a virtual network and subnet.
3. Deploy a Windows Server 2022 Datacenter VM into the subnet.
4. Allow RDP access (3389) from your IP only using an NSG.
5. Connect to the VM using RDP.

### VM Deployment Screenshot

![Screenshot 01 – Azure VM overview](./screenshots/01-azure-vm-overview.png)

---

## Step 2 – Initial Server Configuration

1. Rename the server to a meaningful hostname.
2. Configure Windows Update and verify current patch level.
3. Set the correct time zone.
4. Verify local administrator account and create a standard user account for testing.

### Server Manager and Local Configuration

![Screenshot 02 – Server Manager add roles and features](./screenshots/02-server-manager-add-roles.png)

![Screenshot 03 – Local users and groups](./screenshots/03-local-users-and-groups.png)

---

## Step 3 – Install Required Roles and Features

1. Use Server Manager or PowerShell to add any roles/features required for the lab.
2. Confirm installation of:
   - Group Policy Management Console (GPMC)
   - Any additional management tools needed.

### Role Installation Screenshot

![Screenshot 04 – Add roles and features wizard](./screenshots/04-add-roles-and-features-wizard.png)

---

## Step 4 – Create and Configure GPOs

In this lab, you will create at least two GPOs:

- **Baseline Security GPO**  
  Hardens local policies such as password complexity, lockout thresholds, and user rights assignments.

- **Audit and Logging GPO**  
  Enables advanced audit policies and configures log retention for security monitoring.

### Baseline Security GPO

Key settings (examples):

- Enforce password history
- Minimum password length
- Account lockout threshold
- Restrict local logon rights

![Screenshot 05 – Baseline security GPO settings](./screenshots/05-baseline-security-gpo-settings.png)

### Audit and Logging GPO

Key settings (examples):

- Audit logon events (Success/Failure)
- Audit account logon events
- Audit object access
- Security log size and retention

![Screenshot 06 – Audit and logging GPO settings](./screenshots/06-audit-logging-gpo-settings.png)

---

## Step 5 – Link GPOs and Force Update

1. Link the GPOs to the appropriate scope (in this lab, the local server or a simulated OU).
2. Run `gpupdate /force` on the server to ensure policies are applied.
3. Use `gpresult /r` or `gpresult /h` to confirm GPO application.

![Screenshot 07 – gpupdate and gpresult output](./screenshots/07-gpupdate-gpresult.png)

---

## Step 6 – Validate Hardening

1. Attempt to log in with weak passwords or invalid credentials to trigger lockout.
2. Review the Security event log in Event Viewer to verify audit events are generated.
3. Confirm that log sizes and retention match the configured GPO settings.

![Screenshot 08 – Security event log showing audit events](./screenshots/08-security-event-log.png)

---

## Lessons Learned

- Centralized control: GPOs allow consistent, repeatable hardening across multiple servers.
- Auditability: Proper audit and logging policies make investigations faster and more reliable.
- Defense in depth: Even in a single-server lab, layered controls (account policies, rights assignments, logging) significantly reduce risk.

---

## Next Steps

- Extend this lab by adding a domain controller and moving these GPOs to an Active Directory environment.
- Integrate the server logs with a SIEM such as Microsoft Sentinel for centralized monitoring.
- Experiment with more advanced GPO settings such as AppLocker, restricted groups, and SMB hardening.