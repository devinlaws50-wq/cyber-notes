# Week 7 – Azure Key Vault + Managed Identity

## Overview

This lab demonstrates how to securely manage and retrieve secrets in Azure using **Azure Key Vault** and **Managed Identity**.

Instead of storing credentials directly on a virtual machine or inside application code, Azure resources can authenticate securely using **identity-based access control through Microsoft Entra ID**.

This approach follows modern cloud security best practices by eliminating hardcoded credentials.

---

## Architecture

Application VM  
↓  
System Assigned Managed Identity  
↓  
Azure Key Vault  
↓  
Secure Secret Retrieval

---

## Resources Created

The following Azure resources were deployed during this lab:

- Azure Virtual Machine (app-server)
- Azure SQL Server
- Azure SQL Database (appdb)
- Azure Key Vault (week7-keyvault)
- Managed Identity enabled on the VM
- RBAC role assignment for Key Vault access
- Key Vault secret for database credentials

---

## Lab Steps

### 1. Deploy Azure SQL Server

An Azure SQL Server instance was created to host the database used by the application.

Screenshot:

![SQL Server Deployment](screenshots/sql-server-deployment.png)

---

### 2. Create Azure SQL Database

A database named **appdb** was created on the SQL Server instance.

Screenshot:

![SQL Database Created](screenshots/sql-database-created.png)

---

### 3. Enable Managed Identity on the VM

A **system-assigned managed identity** was enabled on the app-server VM.  
This identity allows the VM to authenticate to other Azure services securely without storing credentials.

Screenshot:

![Managed Identity Enabled](screenshots/managed-identity-enabled.png)

---

### 4. Create a Secret in Azure Key Vault

A secret named **db-password** was created and stored inside Azure Key Vault.

This allows sensitive data to be stored securely instead of inside application configuration files.

Screenshot:

![Key Vault Secret Created](screenshots/keyvault-secret-created.png)

---

### 5. Assign RBAC Access to the VM

The VM’s managed identity was granted the **Key Vault Secrets User** role using Azure RBAC.

This permission allows the VM to retrieve secrets from Key Vault.

Screenshot:

![Key Vault RBAC Role Assignment](screenshots/keyvault-rbac-role.png)

---

### 6. Retrieve the Secret from the VM

Using the Azure CLI and Managed Identity authentication, the VM successfully retrieved the secret from Azure Key Vault.

Example command used:
az keyvault secret show
--vault-name week7-keyvault
--name db-password
--query value -o tsv

Screenshot:

![Key Vault Secret Retrieval](screenshots/keyvault-secret-retrieval.png)

---

## Security Concept Demonstrated

This lab demonstrates **identity-based authentication between Azure resources**.

Instead of storing passwords inside the VM or application code:

- The VM authenticates using its **Managed Identity**
- Azure verifies the identity using **Microsoft Entra ID**
- Access to Key Vault is controlled through **Azure RBAC**

This design improves security by removing the need to manage credentials manually.

---

## Key Security Benefits

- Eliminates hardcoded credentials
- Reduces risk of secret exposure
- Centralized secret management
- Identity-based authentication between services
- RBAC-controlled access permissions

---

## Key Takeaway

Managed Identity allows Azure resources to securely authenticate to other Azure services without storing passwords, making it a critical component of modern cloud security architecture.