# Week 16 Lab: Windows File Shares, NTFS Permissions, and Auditing

![Windows Server](https://img.shields.io/badge/Platform-Windows%20Server%202022-0078D6?logo=windows&logoColor=white)
![Active Directory](https://img.shields.io/badge/Directory-Active%20Directory-003366?logo=microsoft&logoColor=white)
![File Shares](https://img.shields.io/badge/Service-SMB%20File%20Shares-4CAF50)
![Permissions](https://img.shields.io/badge/Security-NTFS%20%2B%20Share%20Permissions-9C27B0)
![Auditing](https://img.shields.io/badge/Monitoring-Object%20Access%20Auditing-FF9800)

## Overview

This lab configured departmental SMB shares on `wk16-filesrv01` using a layered access model based on both share permissions and NTFS permissions. In Windows, effective access is determined by the most restrictive combination of share and NTFS permissions, so both levels were configured deliberately for HR, IT, and Public access control.

The environment used Active Directory security groups to grant department-based access instead of assigning permissions directly to individual users. This approach is easier to manage, scales better, and aligns with common Windows file server administration practices.

## Objectives

- Create departmental folders under `C:\\Data`
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

## Folder and Share Design

The file server used a root folder at `C:\\Data` with three departmental subfolders. Each folder was shared individually so access could be controlled by department and validated through the client VM.

```text
C:\\Data
├── HR
├── IT
└── Public
```

### Share Names

| Folder Path | Share Name | Intended Access |
|---|---|---|
| `C:\\Data\\HR` | `HR` | HR users modify, staff denied |
| `C:\\Data\\IT` | `IT` | IT users modify, staff denied |
| `C:\\Data\\Public` | `Public` | Authenticated users read/write |

## Architecture Diagram

```mermaid
flowchart LR
    A[Active Directory<br/>wk15-dc01] --> B[Security Groups]
    B --> C[HR-Read]
    B --> D[HR-Modify]
    B --> E[IT-Modify]
    B --> F[Authenticated Users / Domain Users]

    G[Client VM<br/>wk15-client01] --> H[corp\\\\hr.user1]
    G --> I[corp\\\\it.user1]
    G --> J[corp\\\\staff.user1]

    H --> K[\\\\\\\\wk16-filesrv01\\\\HR]
    I --> L[\\\\\\\\wk16-filesrv01\\\\IT]
    J --> M[\\\\\\\\wk16-filesrv01\\\\Public]

    N[File Server<br/>wk16-filesrv01] --> K
    N --> L
    N --> M

    C --> K
    D --> K
    E --> L
    F --> M
```

## Permission Model

### HR Share

- Share permissions were configured so authorized users could access the share across the network.
- NTFS permissions on `C:\\Data\\HR` were assigned to HR-related groups such as `HR-Read` and `HR-Modify`.
- `corp\\hr.user1` successfully created, edited, and deleted files in the HR share after share-level write access was corrected.

### IT Share

- The IT share followed the same design pattern as HR.
- Authorized IT users were allowed to modify content through group-based permissions.
- Unauthorized staff users were denied access by design because they did not belong to the permitted group set.

### Public Share

- The Public share was configured for collaborative use by authenticated users.
- To allow file creation and editing, both share permissions and NTFS had to allow write-capable access such as Change at the share layer and Modify at the NTFS layer.

## Access Testing

Testing was performed from the client VM using domain user accounts over SMB paths to the file server.

### Successful Access

- `corp\\hr.user1` successfully accessed `\\\\wk16-filesrv01\\HR` and created, edited, and deleted a test file.
- `corp\\it.user1` successfully accessed `\\\\wk16-filesrv01\\IT` and performed the same modify actions.
- Public access was validated separately after updating Public share and NTFS permissions to support file creation and editing.

### Denied Access

- `corp\\staff.user1` was denied access to `\\\\wk16-filesrv01\\HR`.
- `corp\\staff.user1` was denied access to `\\\\wk16-filesrv01\\IT`.
- These denials confirmed that department shares were not open to unauthorized users.

## Screenshots

| Screenshot | Description |
|---|---|
| `12-hr-user-access-success.png` | `corp\\hr.user1` successfully accessed the HR share |
| `13-it-user-access-success.png` | `corp\\it.user1` successfully accessed the IT share |
| `14-staff-user-access-denied.png` | `corp\\staff.user1` denied access to restricted shares |
| `15-public-share-read-access.png` | Public share access validated |
| `16-event-viewer-audit-validation.png` | Security log showing object access auditing |

## Auditing Configuration

Object access auditing was enabled on the HR folder to monitor file activity. Windows Security logging can record object access events such as operations performed on folders and files when auditing is configured on the target object and the relevant policy category is active.

Auditing entries were added through the folder’s **Advanced Security Settings** on the **Auditing** tab. After `corp\\hr.user1` created and deleted a test file in the HR share, Security log events were visible in Event Viewer on `wk16-filesrv01` as object access events, including Event ID 4662 in the captured validation screenshot.

## Troubleshooting Notes

### HR share not visible in Shares list

Initially, the folder structure and share state were inconsistent. This was resolved by verifying the folder path, share definition, and both permission layers.

### Access denied even when user was in the right group

The main cause was share permissions set too low. A user can still be blocked from writing if the share allows only Read, even when NTFS permissions allow Modify, because effective access is the most restrictive result across both layers.

### Public share inaccessible

Public access required changes at both layers:
- Share permissions needed `Authenticated Users` with Change
- NTFS needed `Authenticated Users` or another inclusive group with Modify

## Key Lessons Learned

- Share permissions and NTFS permissions must be evaluated together.
- Group-based permission assignment is easier to manage than user-by-user access control.
- A Read-only share permission can silently block write operations even when NTFS looks correct.
- Auditing must be configured on the folder object and then validated through the Security log.

## Commands Used

Administrative tasks can also be completed through PowerShell, including folder creation, SMB share creation, and NTFS permission assignment. This is useful for documenting repeatable infrastructure changes in a lab environment.

## Conclusion

This lab successfully implemented a Windows file server with departmental shares, role-based access through Active Directory groups, validation of authorized and unauthorized access, and object access auditing through Event Viewer. The final configuration demonstrated practical administration of SMB shares using layered Windows security controls.
