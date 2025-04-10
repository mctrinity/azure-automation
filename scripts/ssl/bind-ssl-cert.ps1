Param (
    [string]$ResourceGroup,
    [string]$ProfileName,
    [string]$CustomDomainName        # e.g. client1.yourdomain.com
)

if (-not $ResourceGroup -or -not $ProfileName -or -not $CustomDomainName) {
    throw "Missing required parameters."
}

Write-Host "🔐 Enabling managed TLS on Front Door for $CustomDomainName"

az network front-door custom-domain enable-https `
    --resource-group $ResourceGroup `
    --profile-name $ProfileName `
    --name $CustomDomainName `
    --certificate-type ManagedCertificate

Write-Host "✅ TLS certificate enabled for '$CustomDomainName'."
