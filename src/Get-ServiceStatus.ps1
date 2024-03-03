param (
    [Parameter(Mandatory = $true)]
    [string[]] $ComputerNames
)

$Services = Get-Service -ComputerName $ComputerNames

foreach ($Service in $Services) {
    $ServiceStatus = $Service.Status
    $ServiceDisplayName = $Service.DisplayName

    if ($ServiceStatus -EQ 'Running') {
        Write-Output "Service OK - $ServiceDisplayName"
    }
    else {
        Write-Output "Service DOWN - $ServiceDisplayName"
    }
}
