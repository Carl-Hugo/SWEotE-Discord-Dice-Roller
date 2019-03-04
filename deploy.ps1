[CmdletBinding()]
param (
    [string]$tag = "auto"
)

if ($tag -eq "auto") {
    $tag = (Get-Content package.json) -join "`n" | ConvertFrom-Json | Select -ExpandProperty "version"
}
Write-Output "tag: $tag"

docker login -u carlhugo

docker build --rm -f "Dockerfile" -t my-d1-c3:$tag .
docker tag my-d1-c3:$tag carlhugo/my-d1-c3:$tag
docker push carlhugo/my-d1-c3:$tag
