[CmdletBinding()]
param (
    [string]$tag = "auto"
)

if ($tag -eq "auto") {
    $tag = (Get-Content package.json) -join "`n" | ConvertFrom-Json | Select -ExpandProperty "version"
}
Write-Output "tag: $tag"

az acr login --name fortheneworder

docker build --rm -f "Dockerfile" -t my-d1-c3:$tag .
docker tag my-d1-c3:$tag fortheneworder.azurecr.io/my-d1-c3:$tag
docker push fortheneworder.azurecr.io/my-d1-c3:$tag

az container create --resource-group for-the-new-order --name my-d1-c3-container --image fortheneworder.azurecr.io/my-d1-c3:$tag --dns-name-label my-d1-c3 --ports 80
az container show --resource-group for-the-new-order --name my-d1-c3-container --query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" --out table



