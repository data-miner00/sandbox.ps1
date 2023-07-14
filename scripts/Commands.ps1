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