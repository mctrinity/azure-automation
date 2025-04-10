Param (
    [string]$ConfigFile = "./config/client1-app.json"
)

$Config = Get-Content -Raw -Path $ConfigFile | ConvertFrom-Json

if (-not $Config.webAppName) { throw "Missing 'webAppName' in config file." }

Write-Host "🔧 Creating App Service: $($Config.webAppName)"

az group create --name $Config.resourceGroup --location $Config.location

az appservice plan create `
    --name $Config.appServicePlan `
    --resource-group $Config.resourceGroup `
    --sku $Config.sku

az webapp create `
    --name $Config.webAppName `
    --resource-group $Config.resourceGroup `
    --plan $Config.appServicePlan

Write-Host "✅ App Service '$($Config.webAppName)' created."
