Param (
    [string]$ConfigFile = "./config/client1-function.json"
)

$Config = Get-Content -Raw -Path $ConfigFile | ConvertFrom-Json

if (-not $Config.functionAppName) { throw "Missing 'functionAppName' in config." }

Write-Host "⚡ Creating Function App: $($Config.functionAppName)"

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

Write-Host "✅ Function App '$($Config.functionAppName)' created."
