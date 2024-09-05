param (
    [Parameter(Mandatory=$true)]
    [String]$SecretName,
    [Parameter(Mandatory=$true)]
    [String]$SecretValue
)

Write-Host $("-" * 100)

Write-Host "Secret for $SecretName is $($SecretValue.Substring(0, 1)) $($SecretValue.Substring(1))"

Write-Host $("-" * 100)