# create-appservice.ps1

## 📚 Table of Contents

- [Description](#-description)
- [Parameters](#-parameters)
- [Sample Config](#-sample-config)
- [Example Usage](#-example-usage)
- [Dependencies](#-dependencies)
- [What It Does](#-what-it-does)
- [Permissions](#-permissions)

## 🔍 Description

This script provisions an Azure App Service and App Service Plan using a configuration provided in a JSON file.

---

## 📂 Parameters

| Name         | Required | Description                           |
| ------------ | -------- | ------------------------------------- |
| `ConfigFile` | ✅       | Path to a JSON file containing values |

---

## 🗃 Sample Config

```json
{
  "resourceGroup": "client1-rg",
  "location": "eastus",
  "appServicePlan": "client1-plan",
  "webAppName": "client1-webapp",
  "sku": "B1"
}
```

---

## ▶️ Example Usage

```powershell
pwsh ./scripts/appservice/create-appservice.ps1 -ConfigFile ./config/client1-app.json
```

---

## 📅 Dependencies

- Azure CLI (`az`)
- PowerShell 7+
- Logged in via `az login`

---

## 🛠️ What It Does

1. Creates a Resource Group (if it doesn't exist)
2. Creates an App Service Plan
3. Deploys a Web App

---

## 🔒 Permissions

Make sure the executing identity (user or service principal) has at least **Contributor** access to the target subscription.
