# Week 6 — Azure Static Website (Blob Storage)

![Azure](https://img.shields.io/badge/Cloud-Microsoft%20Azure-0078D4?logo=microsoftazure&logoColor=white)
![Blob Storage](https://img.shields.io/badge/Service-Azure%20Blob%20Storage-0078D4?logo=microsoftazure&logoColor=white)
![HTML](https://img.shields.io/badge/Language-HTML%20%2F%20JavaScript-E34F26?logo=html5&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-success)
![License](https://img.shields.io/badge/License-Private-inactive)

## 📌 Objective

Demonstrate how to host a static website using Azure Blob Storage, showing how Azure Storage Accounts can serve static web content directly without requiring a traditional web server or VM.

---

## 🛠️ Tools & Technologies

- Microsoft Azure
- Azure Storage Account
- Azure Blob Storage
- Static Website Hosting
- HTML
- JavaScript
- Azure Portal

---

## 🧱 Architecture

```
User Browser → Azure Storage Account → Blob Container ($web) → Static Website
```

---

## ⚙️ Steps Performed

1. Created an Azure Resource Group
2. Deployed an Azure Storage Account
3. Enabled Static Website hosting on the storage account
4. Created a static HTML website
5. Uploaded website files to the `$web` container
6. Verified the public endpoint and confirmed website accessibility

---

## 📸 Screenshots

| Screenshot | Description |
|-----------|-------------|
| ![Storage Account Overview](screenshots/storage-account-overview.png) | Storage Account Overview |
| ![Static Website Enabled](screenshots/static-website-enabled.png) | Static Website Enabled |
| ![Blob Upload](screenshots/web-container-upload.png) | Blob Container Upload |
| ![Website Live](screenshots/website-live.png) | Website Live |

---

## 🧠 Key Concepts Learned

- Azure Blob Storage can host static websites without requiring a VM
- Static website hosting uses the `$web` container as the origin
- Public endpoints enable direct browser access to hosted content
- Blob Storage is a cost-effective alternative to full web server deployments for static content

---

## ✅ Outcome

Successfully deployed a static website hosted entirely through Azure Blob Storage, demonstrating a serverless, low-cost approach to web hosting on Azure.
