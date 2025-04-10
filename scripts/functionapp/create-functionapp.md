# create-functionapp.ps1

## 📚 Table of Contents

- [Description](#-description)
- [Parameters](#-parameters)
- [Sample Config](#-sample-config)
- [Example Usage](#-example-usage)
- [Dependencies](#-dependencies)
- [What It Does](#-what-it-does)
- [Permissions](#-permissions)

## 🔍 Description

Creates an Azure Function App with an associated storage account and consumption plan, using values provided in a JSON config.

---

## 📂 Parameters

| Name         | Required | Description                |
| ------------ | -------- | -------------------------- |
| `ConfigFile` | ✅       | Path to a JSON config file |

---

## 🗃 Sample Config

```json
{
  "resourceGroup": "client1-rg",
  "location": "eastus",
  "functionAppName": "client1-funcapp",
  "storageAccount": "client1storage01",
  "runtime": "node",
  "version": "4"
}
```

---

## ▶️ Example Usage

```powershell
pwsh ./scripts/functionapp/create-functionapp.ps1 -ConfigFile ./config/client1-function.json
```

---

## 📅 Dependencies

- Azure CLI
- PowerShell 7+
- Must be logged in via `az login`

---

## 🛠️ What It Does

1. Creates a resource group (if needed)
2. Creates a storage account
3. Deploys a Function App to the specified region with runtime and version

---

## 🔒 Permissions

Requires Contributor or higher role in the specified Azure subscription.
