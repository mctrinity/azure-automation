# bind-ssl-cert.ps1

## 📚 Table of Contents

- [Description](#-description)
- [Parameters](#-parameters)
- [Example Usage](#-example-usage)
- [Dependencies](#-dependencies)
- [What It Does](#-what-it-does)
- [Permissions](#-permissions)

## 🔍 Description

Enables an Azure-managed TLS/SSL certificate for a custom domain in Azure Front Door.

---

## 📂 Parameters

| Name               | Required | Description                                      |
| ------------------ | -------- | ------------------------------------------------ |
| `ResourceGroup`    | ✅       | Azure resource group where the Front Door exists |
| `ProfileName`      | ✅       | Name of the Front Door profile                   |
| `CustomDomainName` | ✅       | Custom domain to enable HTTPS on (must exist)    |

---

## ▶️ Example Usage

```powershell
pwsh ./scripts/ssl/bind-ssl-cert.ps1 `
  -ResourceGroup "client1-rg" `
  -ProfileName "client1-frontdoor" `
  -CustomDomainName "client1.yourdomain.com"
```

---

## 📅 Dependencies

- Azure CLI
- PowerShell 7+
- Azure login session (`az login`)

---

## 🛠 What It Does

- Enables HTTPS on an existing Front Door custom domain
- Uses Azure-managed TLS certificate (free & auto-renewed)

---

## 🔐 Permissions

Requires Contributor or Front Door Administrator role in the target subscription/resource group.
