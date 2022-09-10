type `get-com`, then hit `TAB` for autocompletion - `Get-Command`

`Start-Transcript` : Starts recording the entire powershell session into file

`Get-Command -noun S*` : Gets the command that starts with S for noun.

`Get-Service` : Gets the list of services

`Get-Help <command>` : Gets help

`Get-Help <command> -Examples` : Gets help with examples

`Get-Help <command> -Online` : Gets help online Microsoft docs

`cls` : An alias

`Get-Alias` : Get whole list of aliases

`Get-Alias <alias>` : Get original command

`Get-Process` : Get list of running processes

`Get-Process -Name MicrosoftEdge` : Get only Microsoft Edge process

`Get-Member` : Gets all the properties associated to an object

`Get-Process -Name AnyDesk | select-object *` : Pipe to select object

`$var = <cmdlet>` : Assign object to variable

`Get-History` : Get command history

`Get-PSDrive` : Returns all the drives in the system

`?` : `Where-Object`

`$_` : Current object in the pipe

`Select-Object` : Select the properties

`Select-Object *` : See all the properties and check which one is important

`Foreach-Object` : Similar to `Select-Object`

`Write-Host` : Output to terminal

`1gb` == `1 * 1024 * 1024 * 1024`

`"{0:N0}" -f 100000000` : 100, 000, 000 [details](<https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-powershell-1.0/ee692795(v=technet.10)?redirectedfrom=MSDN>)

`($env:PSModulePath).Split(';')`
