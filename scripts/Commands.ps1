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
Get-Help -Name *DNS*

# Update help file as sudo
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
