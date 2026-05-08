Signing script can be done by using

1. A code-signing certificate that can be purchased from trusted vendors
2. Self-signed

## Self-signing Steps

`Import-Module PKI` to make sure the module required exist.

```ps1
# Declare the script path of the script to be signed
$script = "MyScript.ps1"

# If not having already, create a new self-signed certificate to the registry
New-SelfSignedCertificate `
    -DNSName "example.com" `
    -CertStoreLocation Cert:\CurrentUser\My `
    -Type CodeSigningCert `
    -Subject "PowerShell Code Signing Certificate"

# Get the certificate that was created above
$certificate = (Get-ChildItem Cert:\CurrentUser\My -CodeSigningCert)[0] # refers to the cert that created above

# Actually signing
Set-AuthenticodeSignature $script -Certificate $certificate;

# Validate the code signing certificate
Get-AuthenticodeSignature $script | Format-Table -AutoSize
```

## Status: UnknownError

When u try to validate the script using the `Get-AuthenticodeSignature` command, you will most likely see the status to be `UnknownError`. It's fine, the script will still work, but if you want to be nice and looks legit, perform the following so that it will change to `Valid`.

1. Go to Console Root
2. Go to `Personal/Certificates`
3. Find the certs newly added.
4. Copy to `Trusted Root Certification Authorities/Certificates`
5. Click OK to install the cert
6. Check again, status should be `Valid`
