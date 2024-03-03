$ComputerName = Read-Host 'Enter name of host'

$StoppedService = Get-Service -ComputerName $ComputerName `
    | Where-Object -Property Status -EQ 'Stopped'

Write-Output $StoppedService

Get-CimInstance -Class Win32_OperatingSystem -ComputerName $ComputerName `
    | Select-Object -Property CSName,LastBootUpTime
