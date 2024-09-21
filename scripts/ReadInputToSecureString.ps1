$Password1 = ConvertTo-SecureString -String "P@ssw0rd!" -Force -AsPlainText
$Password2 = Read-Host -Prompt "EnterPassword" -AsSecureString

# Interesting blog post: https://www.pdq.com/blog/secure-password-with-powershell-encrypting-credentials-part-1/