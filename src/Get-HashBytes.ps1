param (
    [Parameter(Mandatory=$true)]
    [String]$Name,
    [Parameter(Mandatory=$true)]
    [String]$Value
)

$HashAlgorithm = [System.Security.Cryptography.HashAlgorithm]::Create("md5")
$HashDigest = $HashAlgorithm.ComputeHash([System.Text.Encoding]::UTF8.GetBytes("$Value"))

# BitConverter: https://learn.microsoft.com/en-us/dotnet/api/system.bitconverter?view=net-8.0
$ByteArray = [System.BitConverter]::ToString($HashDigest)
$Sanatized = $ByteArray.Replace('-', '')

Write-Host "The hash for $Name is '$Sanatized'"