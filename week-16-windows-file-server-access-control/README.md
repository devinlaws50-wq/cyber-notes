# Week 16 Lab: Windows File Shares, NTFS Permissions, and Auditing

![Windows Server](https://img.shields.io/badge/Platform-Windows%20Server%202022-0078D6?logo=windows&logoColor=white)
![Active Directory](https://img.shields.io/badge/Directory-Active%20Directory-003366?logo=microsoft&logoColor=white)
![File Shares](https://img.shields.io/badge/Service-SMB%20File%20Shares-4CAF50)
![Permissions](https://img.shields.io/badge/Security-NTFS%20%2B%20Share%20Permissions-9C27B0)
![Auditing](https://img.shields.io/badge/Monitoring-Object%20Access%20Auditing-FF9800)

## Overview

This lab configured departmental SMB shares on `wk16-filesrv01` using both share permissions and NTFS permissions to control access.

The file server was joined to the domain, placed in the appropriate organizational unit, and prepared with a departmental folder structure under `C:\Data`.

Active Directory security groups were then used to assign access to HR, IT, and Public resources. Access was validated from the client VM with authorized and unauthorized user accounts, and auditing was enabled to capture file access events in Event Viewer.

## Objectives

- Create departmental folders under `C:\Data`
- Publish folders as SMB shares
- Assign access using AD security groups
- Validate access as HR, IT, and Staff users
- Deny unauthorized department access
- Enable and validate object access auditing in Event Viewer

## Environment

| Component | Hostname | Purpose |
|---|---|---|
| Domain Controller | `wk15-dc01` | Active Directory users and groups |
| File Server | `wk16-filesrv01` | SMB shares, NTFS permissions, auditing |
| Client VM | `wk15-client01` | Access testing with domain users |

## Architecture Diagram

```mermaid
flowchart LR
    A[Active Directory / wk15-dc01] --> B[Security Groups]
    B --> C[HR-Read]
    B --> D[HR-Modify]
    B --> E[IT-Modify]
    B --> F[Authenticated Users / Domain Users]

    G[Client VM / wk15-client01] --> H[corp\hr.user1]
    G --> I[corp\it.user1]
    G --> J[corp\staff.user1]

    H --> K[HR Share]
    I --> L[IT Share]
    J --> M[Public Share]

    N[File Server / wk16-filesrv01] --> K
    N --> L
    N --> M

    C --> K
    D --> K
    E --> L
    F --> M
```

## Folder and Share Design

The file server used a root folder at `C:\Data` with three departmental subfolders. Each folder was shared individually so access could be controlled by department and validated through the client VM.

```text
C:\Data
├── HR
├── IT
└── Public
```

### Share Names

| Folder Path | Share Name | Intended Access |
|---|---|---|
| `C:\Data\HR` | `HR` | HR users modify, staff denied |
| `C:\Data\IT` | `IT` | IT users modify, staff denied |
| `C:\Data\Public` | `Public` | Authenticated users read/write |

## Build and Configuration Screenshots

### 1. Azure file server VM overview

This screenshot shows the deployed Azure virtual machine used as the Windows file server for the lab.

![Azure file server VM overview](screenshots/01-azure-file-server-vm-overview.png)

### 2. File server domain join

This screenshot confirms that `wk16-filesrv01` was joined to the domain successfully.

![File server domain join](screenshots/02-file-server-domain-join.png)

### 3. Servers OU with file server

This screenshot shows the file server object placed in the appropriate Active Directory organizational unit.

![Servers OU with file server](screenshots/03-servers-ou-with-file-server.png)

### 4. Data folder structure

This screenshot shows the `C:\Data` folder structure with the departmental folders created for the shares.

![Data folder structure](screenshots/04-data-folder-structure.png)

### 5. AD security groups created

This screenshot shows the Active Directory security groups created to manage departmental access.

![AD security groups created](screenshots/05-ad-security-groups-created.png)

### 6. Group membership for HR modify

This screenshot shows the membership configuration for the HR modify access group.

![Group membership HR modify](screenshots/06-group-membership-hr-modify.png)

## Permission Model

### HR Share

The HR share was configured with both share and NTFS permissions so only the correct HR group members could access and modify data.

![HR share permissions](screenshots/07-hr-share-permissions.png)

![HR NTFS permissions](screenshots/08-hr-ntfs-permissions.png)

### IT Share

The IT share followed the same design pattern as the HR share. Authorized IT users were granted access through group-based permission assignment.

![IT share permissions](screenshots/09-it-share-permissions.png)

![IT NTFS permissions](screenshots/10-it-ntfs-permissions.png)

### Public Share

The Public share was configured for broader collaboration. To support file creation and editing, share permissions and NTFS permissions both had to allow write-capable access.

![Public share permissions](screenshots/11-public-share-permissions.png)

## Access Testing

Testing was performed from the client VM using domain user accounts over SMB paths to the file server.

### Successful HR access

`corp\hr.user1` successfully accessed the HR share and performed file operations as expected.

![HR user access success](screenshots/12-hr-user-access-success.png)

### Successful IT access

`corp\it.user1` successfully accessed the IT share and performed modify actions.

![IT user access success](screenshots/13-it-user-access-success.png)

### Denied staff access

`corp\staff.user1` was denied access to restricted departmental shares, confirming that unauthorized access was blocked correctly.

![Staff user access denied](screenshots/14-staff-user-access-denied.png)

### Public share validation

Public share access was validated after updating permissions to support the intended level of access.

![Public share read access](screenshots/15-public-share-read-access.png)

## Auditing Configuration

Object access auditing was enabled on the HR folder to monitor file activity. After access testing was performed, the resulting security events were reviewed in Event Viewer on the file server.

![Event Viewer audit validation](screenshots/16-event-viewer-audit-validation.png)

The captured audit log confirmed that file access activity was being recorded after auditing was configured on the target folder.

## Troubleshooting Notes

### README issue in VS Code

The original `README.md` problem was caused by accidentally creating a directory named `README.md` instead of a file. Once that folder was removed and replaced with an actual Markdown file, editing in VS Code worked normally.

### HR share not visible in Shares list

Initially, the folder structure and share state were inconsistent. This was resolved by verifying the folder path, share definition, and both permission layers.

### Access denied even when user was in the right group

The main cause was share permissions set too low. A user can still be blocked from writing if the share allows only Read, even when NTFS permissions allow Modify, because effective access is the most restrictive result across both layers.

### Public share inaccessible

Public access required changes at both layers:

- Share permissions needed `Authenticated Users` with Change
- NTFS needed `Authenticated Users` or another inclusive group with Modify


## ✅ What This Proves

- Configured departmental SMB file shares with layered NTFS and share permissions, applying explicit deny policies for cross-department access
- Assigned access using Active Directory security groups rather than individual user accounts — demonstrating scalable, role-based access control design
- Validated authorized and unauthorized access scenarios from a domain-joined client VM using multiple user identities
- Enabled object access auditing via Group Policy and verified security events in Windows Event Viewer — demonstrating Windows security monitoring skills
- Diagnosed and resolved permission conflicts caused by the interaction between share-level and NTFS-level effective access — a common real-world troubleshooting scenario

## 🔐 Security Relevance

File server access control and auditing are core Windows security administration responsibilities. This lab demonstrates least-privilege file access design, AD group-based authorization, and event log monitoring — all of which appear directly in Systems Administrator and Windows Security Engineer job descriptions. Object access auditing also supports compliance requirements (SOX, HIPAA, etc.) that mandate file access logging.


## Key Lessons Learned

- Share permissions and NTFS permissions must be evaluated together.
- Group-based permission assignment is easier to manage than user-by-user access control.
- A read-only share permission can silently block write operations even when NTFS looks correct.
- Auditing must be configured on the folder object and then validated through the Security log.
- GitHub README screenshots only render when the images are embedded with relative Markdown image paths.

## Conclusion

This lab successfully implemented a Windows file server with departmental shares, role-based access through Active Directory groups, validation of authorized and unauthorized access, and object access auditing through Event Viewer.

The final configuration demonstrated practical administration of SMB shares using layered Windows security controls, along with access testing and audit validation in a domain environment.
