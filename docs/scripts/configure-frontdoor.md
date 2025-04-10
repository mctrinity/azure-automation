# configure-frontdoor.ps1

## Table of Contents

- [Description](#description)
- [Parameters](#parameters)
- [Sample Config](#sample-config)
- [Example Usage](#example-usage)
- [Dependencies](#dependencies)
- [What It Does](#what-it-does)
- [Permissions](#permissions)

## Description

Automates the configuration of Azure Front Door to route traffic to a backend App Service or Function App, using a JSON config.

---

## Parameters

| Name         | Required | Description                  |
| ------------ | -------- | ---------------------------- |
| `ConfigFile` | ✅       | Path to the JSON config file |

---

## Sample Config

```json
{
  "resourceGroup": "client1-rg",
  "profileName": "client1-frontdoor",
  "originGroupName": "client1-origin-group",
  "originName": "client1-origin",
  "hostname": "client1-webapp.azurewebsites.net",
  "endpointName": "client1-endpoint",
  "routeName": "client1-route",
  "customDomain": "client1.yourdomain.com"
}
```

---

## Example Usage

```powershell
pwsh ./scripts/frontdoor/configure-frontdoor.ps1 -ConfigFile ./config/client1-frontdoor.json
```

---

## Dependencies

- Azure CLI (requires Front Door extension)
- PowerShell 7+
- Logged in with sufficient Azure permissions

---

## What It Does

1. Creates a Front Door profile (if not already existing)
2. Adds an origin group and origin (pointing to the backend hostname)
3. Creates a route to the origin group under the custom domain

---

## Permissions

Requires Contributor access to the resource group and Front Door profile management.
