Param (
    [string]$ConfigFile = "./config/client1-frontdoor.json"
)

$Config = Get-Content -Raw -Path $ConfigFile | ConvertFrom-Json

Write-Host "🚪 Configuring Azure Front Door for: $($Config.hostname)"

# Create Front Door Profile
az network front-door profile create `
    --name $Config.profileName `
    --resource-group $Config.resourceGroup `
    --sku Standard_AzureFrontDoor

# Create Origin Group
az network front-door origin-group create `
    --resource-group $Config.resourceGroup `
    --profile-name $Config.profileName `
    --name $Config.originGroupName `
    --probe-request-type GET `
    --probe-protocol Https `
    --probe-interval 120

# Add App/Function as Origin
az network front-door origin create `
    --resource-group $Config.resourceGroup `
    --profile-name $Config.profileName `
    --origin-group-name $Config.originGroupName `
    --name $Config.originName `
    --host-name $Config.hostname `
    --enabled true

# Create Route
az network front-door route create `
    --resource-group $Config.resourceGroup `
    --profile-name $Config.profileName `
    --endpoint-name $Config.endpointName `
    --name $Config.routeName `
    --origin-group $Config.originGroupName `
    --https-redirect Enabled `
    --route-type Forward `
    --accepted-protocols Https `
    --patterns-to-match '/*' `
    --custom-domain $Config.customDomain

Write-Host "✅ Front Door route '$($Config.routeName)' configured."
