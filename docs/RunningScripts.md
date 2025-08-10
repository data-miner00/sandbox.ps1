Running Powershell scripts are disabled by default.

```ps1
Get-ExecutionPolicy <# Restricted #>
```

We need to enable by using [`Set-ExecutionPolicy`](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.4) in elevated shell.

```ps1
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

We set the execution policy to `RemoteSigned` so that we can:

1. Run local scripts
2. Run signed scripts from the internet

If an error was encountered due to insufficient privilege, try adding `-Scope CurrentUser` to the command.
