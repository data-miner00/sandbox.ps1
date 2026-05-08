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

## Scope

1. Process: The execution policy is only available on that session; closed terminal and it is gone.
2. CurrentUser: Set the execution policy for the user level. This is persisted in registry when shutdown.
3. LocalMachine: Set the execution globally for all users. This is persisted as well.

## Running Scripts

1. Use the path directly.
   ```
   ./path/Script.ps1
   ```
2. Use `&` against a string path.
   ```
   & "./path/Script.ps1"
   # or
   $path = "./path/Script.ps1";
   & path
   ```
