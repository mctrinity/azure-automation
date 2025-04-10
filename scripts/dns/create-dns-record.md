# create-dns-record.ps1

## 📚 Table of Contents

- [Description](#-description)
- [Parameters](#-parameters)
- [Example Usage](#-example-usage)
- [Dependencies](#-dependencies)
- [What It Does](#-what-it-does)
- [Permissions](#-permissions)

## 🔍 Description

Creates a CNAME DNS record for a subdomain using Azure DNS.

---

## 📂 Parameters

| Name             | Required | Description                                             |
| ---------------- | -------- | ------------------------------------------------------- |
| `ResourceGroup`  | ✅       | Name of the resource group that hosts the DNS zone      |
| `DnsZoneName`    | ✅       | DNS zone name, e.g. `yourdomain.com`                    |
| `Subdomain`      | ✅       | Full subdomain to create, e.g. `client1.yourdomain.com` |
| `TargetHostname` | ✅       | Destination host, e.g. `client1.azurewebsites.net`      |

---

## ▶️ Example Usage

```powershell
pwsh ./scripts/dns/create-dns-record.ps1 `
  -ResourceGroup "dns-rg" `
  -DnsZoneName "yourdomain.com" `
  -Subdomain "client1.yourdomain.com" `
  -TargetHostname "client1.azurewebsites.net"
```

---

## 📅 Dependencies

- Azure CLI
- PowerShell 7+
- You must be logged into Azure (`az login`)

---

## 🛠️ What It Does

- Finds or creates a CNAME record in Azure DNS
- Points the record to the target App Service or Front Door endpoint

---

## 🔒 Permissions

Requires Contributor or DNS Zone Contributor access to the Azure DNS resource group.
