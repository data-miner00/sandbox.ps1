$ServicesFilePath = "./data/Services.csv"
$ServicesList = Import-Csv -Path $ServicesFilePath -Delimiter ','
$LogPath = "./logs"
$LogFile = "Services-$(Get-Date -Format "yyyy-MM-dd hh-mm").txt"

function Set-OutputLog {
    param (
        [Parameter(Mandatory=$true)]
        [Object]$Log
    )

    Write-Output $Log
    Out-File -FilePath "$LogPath/$LogFile" -Append -InputObject $Log
}

foreach ($Service in $ServicesList) {
    $CurrentServiceStatus = (Get-Service -Name $Service.Name).Status

    if ($Service.Status -ne $CurrentServiceStatus) {
        $Log = "Service $($Service.Name) is currently $CurrentServiceStatus, should be $($Service.Status)"
        Set-OutputLog $Log

        $Log = "Setting $($Service.Name) to $($Service.Status)"
        Set-OutputLog $Log

        Set-Service -Name $Service.Name -Status $Service.Status

        $AfterServiceStatus = (Get-Service -Name $Service.Name).Status
        if ($Service.Status -eq $AfterServiceStatus) {
            $Log = "Action succeddeed Service $($Service.Name) is now $AfterServiceStatus"
            Set-OutputLog $Log
        } else {
            $Log = "Action failed Service $($Service.Name) is still $CurrentServiceStatus"
            Set-OutputLog $Log
        }
    } else {
        $Log = "$($Service.Name) seems fine"
        Set-OutputLog $Log
    }
}
