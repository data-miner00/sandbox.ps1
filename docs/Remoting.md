- WMI
- Windows Remote Management (WinRM)
- SSH
- RPC (Powershell and not Powershell Core)

WS-Management

## Setting Up Sessions for Remoting

```
Enable-PSRemoting -Force

Set-PSSessionConfiguration

Install-PowerShellRemoting.ps1
```

```
Get-Service -ComputerName Client02
Enter-PSSession -ComputerName Client02
Set-PSSessionConfiguration -Name Microsoft.PowerShell -ShowSecurityDescriptorUI
Get-NetfirewallRule | Where Displayname -Like "*Windows Management Instrumentation*" | Set-NetFirewallRule -Enable True -Verbose
Get-NetfirewallRule | Where DisplayGroup -Eq 'Remote Service Management' | Set-NetFirewallRule -Enable True -Verbose
```

## Variables

```
Get-ChildItem ENV: | more
```

```
Get-Variable | more
```

```
$PSVersionTable
```

```
$credential = Get-Credential
```

```
Invoke-Command -ComputerName $ComputerName -Credential $Credential -ScriptBlock { Get-SErvice -ComputerName $using:ComputerName }
```

```
$CimSession = New-CimSession -ComputerName $ComputerName -Credential $Credential

Get-DNSClientServerAddress -CimSession $CimSession
```
