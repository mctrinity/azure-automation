# Azure Automation Scripts

This repository contains modular PowerShell scripts and JSON configuration files for automating the creation of Azure resources such as:

- Azure App Services
- Azure Function Apps

All scripts are designed to be reusable and easily triggered via command line or CI/CD tools like GitHub Actions.

---

## 📂 Project Structure

```
azure-automation/
├── scripts/
│   ├── create-appservice.ps1         # Script to create Azure App Service
│   └── create-functionapp.ps1        # Script to create Azure Function App
├── config/
│   ├── client1-app.json              # Config for App Service creation
│   └── client1-function.json         # Config for Function App creation
└── README.md
```

---

## 🔧 Prerequisites

- PowerShell 7+
- Azure CLI installed and logged in (`az login`)
- Proper Azure permissions (Contributor or higher)

---

## ✅ Usage

### Run App Service Script

```powershell
pwsh ./scripts/create-appservice.ps1 -ConfigFile ./config/client1-app.json
```

### Run Function App Script

```powershell
pwsh ./scripts/create-functionapp.ps1 -ConfigFile ./config/client1-function.json
```

> You can duplicate and modify config files in the `config/` folder to create resources for other clients or environments.

---

## 🚧 Customization

- Scripts are parameterized via JSON files for easy extension
- Add additional properties to JSON configs as needed (e.g., environment tags, subdomain name, etc.)

---

## 🔄 Future Improvements

- GitHub Actions integration
- Azure DNS + SSL binding automation
- Environment-based deployment templates

---

## 🎓 License

This project is provided as-is under the MIT License.

---

## 📝 Scripts

### scripts/create-appservice.ps1

```powershell
Param (
    [string]$ConfigFile = "./config/client1-app.json"
)

$Config = Get-Content -Raw -Path $ConfigFile | ConvertFrom-Json

if (-not $Config.webAppName) { throw "Missing webAppName in config file." }

Write-Host "🔧 Creating App Service for: $($Config.webAppName)"

az group create --name $Config.resourceGroup --location $Config.location

az appservice plan create `
  --name $Config.appServicePlan `
  --resource-group $Config.resourceGroup `
  --sku $Config.sku

az webapp create `
  --name $Config.webAppName `
  --resource-group $Config.resourceGroup `
  --plan $Config.appServicePlan

Write-Host "✅ Web App '$($Config.webAppName)' created successfully."
```

### scripts/create-functionapp.ps1

```powershell
Param (
    [string]$ConfigFile = "./config/client1-function.json"
)

$Config = Get-Content -Raw -Path $ConfigFile | ConvertFrom-Json

if (-not $Config.functionAppName) { throw "Missing functionAppName in config." }

Write-Host "⚡ Creating Azure Function App: $($Config.functionAppName)"

az group create --name $Config.resourceGroup --location $Config.location

az storage account create `
  --name $Config.storageAccount `
  --location $Config.location `
  --resource-group $Config.resourceGroup `
  --sku Standard_LRS

az functionapp create `
  --name $Config.functionAppName `
  --resource-group $Config.resourceGroup `
  --storage-account $Config.storageAccount `
  --consumption-plan-location $Config.location `
  --runtime $Config.runtime `
  --functions-version $Config.version

Write-Host "✅ Function App '$($Config.functionAppName)' created successfully."
```

---

## 📃 Sample Config Files

### config/client1-app.json

```json
{
  "resourceGroup": "client1-rg",
  "location": "eastus",
  "appServicePlan": "client1-plan",
  "webAppName": "client1-webapp",
  "sku": "B1"
}
```

### config/client1-function.json

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
