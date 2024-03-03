# Get powershell version
$PSVersionTable

# Get commands
(Get-Command).count
Get-Command -Name Get*

# Get verbs
Get-Verb | more
Get-Verb -Verb Set | Format-List
Get-Verb -Group Common | Format-List

# Get alias
Get-Alias | more
Get-Alias -Definition *service*

# Understand verbs
Start-Process https://aka.ms/psverbs

# Get helps
Get-Command -Verb Get -Noun *DNS*
Get-Command -Name *Fire* -CommandType Function

Get-Help -Name Get-Command -Detailed
Get-Help -Name Get-Command -Online
Get-Help -Name *DNS*

# Update help file as sudo (run as administrator)
Update-Help

# Retrieve examples to familiarize with the command
Get-Help -Name Get-Service -Examples

# Useful About files
Get-Help *about*

# Get the total count that is a function command
Get-Command -CommandType Function | Measure-Object

# Scope the search command with name and module
Get-Command -Name *Ip* -Module Net*

# Get the list of history
Get-History

# Invoke command on history
Invoke-History -Id 24

# Clear history
Clear-History

# Start and stop transcript to a text file
Start-Transcript -Path .\foldr\hist.txt -Append
Stop-Transcript

# Get the member of a command object
Get-Service | Get-Member

# Get some property only
Get-Service | Select-Object Name,MachineName,Status | Get-Member

# With Sort and filtering
Get-Service | Where-Object Status -EQ "Stopped" | Select-Object Name,MachineName,Status | Sort-Object -Property MachineName | Get-Member

# Whatif for dry run
Get-NetFirewallRule -Name *RemoteDesktop* | Set-NetFirewallRule -Enabled 'True' -WhatIf

# Gathering OS information
# Windows Management Instrumentation (WMI)
Get-WmiObject

# Common Information MOdel (CIM)
Get-CimInstance

# Get the counter for os health
Get-Counter

# Memory
Get-Counter -ListSet Memory | Select-Object -ExpandProperty Counter

# Check if system is paging out
Get-Counter -Counter "\Memory\Pages/Sec", "\Memory\% Committed Bytes In Use" | Format-Table

# Get physical memory info
Get-WmiObject -Class Win32_PhysicalMemory
Get-CmiInstance -ClassName Win32_PhysicalMemory

# Show Tag and Capacity
Get-WmiObject -Class Win32_PhysicalMemory | Select-Object Tag,Capacity

# Get all Ip info
Get-NetIPAddress # ipconfig /all
Get-NetIPConfiguration

# Get dns client
Get-DnsClient
Get-DnsClientCache
Get-DnsClientServerAddress

# Get simple message block
Get-SmbMapping

# Utilize event logs to find the time when the system rebooted
Get-EventLog -List
Get-EventLog -LogName System | Get-Member
Get-EventLog -LogName System -Newest 1000 | Where-Object {
    $_.EventID -eq '1074'
} | Format-Table MachineName,UserName,TimeGenerated

# Get computer info
Get-ComputerInfo
Get-ComputerInfo -Property *memory*

# Get png files
Get-ChildItem -Path w:\ -Recurse | Where-Object Extension -EQ '.png'

# Working with file system
Copy-Item w:\ -Destination d:\destination -Recurse -Verbose
Move-Item d:\destination -Destination d:\finaldestination -Verbose
Rename-Item d:\finaldestination -NewName d:\obsolete

# Undo latest Git commit
git reset HEAD~
