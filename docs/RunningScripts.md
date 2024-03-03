Running Powershell scripts are disabled by default.

```ps1
Get-ExecutionPolicy <# Restricted #>
```

We need to enable by using `Set-ExecutionPolicy`

```ps1
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

We set the execution policy to `RemoteSigned` so that we can:

1. Run local scripts
2. Run signed scripts from the internet
