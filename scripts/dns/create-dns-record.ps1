Param (
    [string]$ResourceGroup,
    [string]$DnsZoneName, # yourdomain.com
    [string]$Subdomain, # client1
    [string]$TargetHostname          # client1-webapp.azurewebsites.net or Front Door endpoint
)

if (-not $ResourceGroup -or -not $DnsZoneName -or -not $Subdomain -or -not $TargetHostname) {
    throw "Missing required parameters."
}

$RecordName = $Subdomain -replace ("." + $DnsZoneName + "$"), ""

Write-Host "🌐 Creating CNAME: $Subdomain -> $TargetHostname"

az network dns record-set cname set-record `
    --resource-group $ResourceGroup `
    --zone-name $DnsZoneName `
    --record-set-name $RecordName `
    --cname $TargetHostname

Write-Host "✅ DNS record '$Subdomain' created."
