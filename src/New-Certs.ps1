param(
    [Parameter(Mandatory=$true)]
    [string]$rootCertName,

    [Parameter(Mandatory=$true)]
    [string]$clientCertName,

    [Parameter(Mandatory=$true)]
    [SecureString]$password
)

Write-Host "Creating Certificates for Self-Signed Testing"

$certLocation = "Cert:\CurrentUser\My"

Write-Host "Creating Root Certificate"
$rootCert = New-SelfSignedCertificate `
    -Type Custom `
    -KeySpec Signature `
    -Subject "CN=$rootCertName" `
    -FriendlyName $rootCertName `
    -KeyExportPolicy Exportable `
    -HashAlgorithm sha256 `
    -KeyLength 4096 `
    -CertStoreLocation $certLocation `
    -KeyUsageProperty Sign `
    -KeyUsage CertSign `
    -NotAfter (Get-Date).AddYears(5)

Write-Host "Creating Client Certificate"
$clientCert = New-SelfSignedCertificate `
    -Type Custom `
    -KeySpec Signature `
    -Subject "CN=$clientCertName" `
    -FriendlyName $clientCertName `
    -KeyExportPolicy Exportable `
    -HashAlgorithm sha256 `
    -KeyLength 2048 `
    -CertStoreLocation $certLocation `
    -Signer $rootCert `
    -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.2")
    -NotAfter (Get-Date).AddYears(2)

Export-PfxCertificate `
    -Cert $clientCert `
    -Password $password `
    -FilePath clientcert.pfx
