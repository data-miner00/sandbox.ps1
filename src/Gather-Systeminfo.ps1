param (
    [Parameter(Mandatory=$true)]
    [string[]] $ComputerNames
)
$OS = (Get-CimInstance Win32_OperatingSystem -ComputerName $ComputerNames).Caption

$OS

$Drive = Get-WmiObject -Class Win32_logicaldisk |
    Where-Object DeviceId -EQ 'C:'
$FreeSpace = (($Drive.FreeSpace) / 1gb)

$Drive
$FreeSpace

# Get total physical memory installed
$MemoryInGB = ((((Get-CimInstance Win32_PhysicalMemory -ComputerName $ComputerNames).Capacity | Measure-Object -Sum).Sum) / 1gb)
$MemoryInGB

$LastReboot = (Get-CimInstance -Class Win32_OperatingSystem -ComputerName $ComputerNames).LastBootUpTime
$LastReboot

$DNS = Resolve-DnsName -Name $ComputerNames |
    Where-Object Type -Eq "A"
$DNSName = $DNS.Name
$DNSIP = $DNS.IPaddress

$DNSName
$DNSIP

$CimSession = New-CimSession -ComputerName $ComputerNames -Credential (Get-Credential)

$DNSClientObject = Get-DnsClientServerAddress -CimSession $CimSession -InterfaceAlias "ethernet" -AddressFamily IPv4
$DNSClientObject.ServerAddresses