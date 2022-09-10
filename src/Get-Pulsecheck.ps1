$ServerListFilePath = "./data/EnvCheckList.csv"
$ServerList = Import-Csv -Path $ServerListFilePath -Delimiter ','

# Create empty array list
$Export=[System.Collections.ArrayList]@()

foreach ($Server in $ServerList) {
    $ServerName = $Server.Name
    $LastIpAddress = $Server.IPV4Address
    $DownSince = $Server.DownSince
    $LastDownAlert = $Server.LastDownAlertTime

    $Connection = Test-Connection $ServerName -Count 1
    
    $Now = [DateTime]::UtcNow # or Get-Date

    if ($Connection.IPV4Address) {
        if (!$LastIpAddress) {
            $Server.DownSince = $null
            $Server.LastDownAlertTime = $null

            Write-Output "$($ServerName) is online"
        }
    } else {
        if ($LastIpAddress) {
            $Server.DownSince = $Now
            $Server.LastDownAlertTime = $Now

            Write-Output "$ServerName is now offline"
        } else {
            $DownFor = $((Get-Date -Date $Now) - (Get-Date -Date $DownSince)).Day
            $SinceLastDownAlert = $((Get-Date -Date $Now) - (Get-Date -Date $LastDownAlert)).Day
            
            if (($DownFor -ge 1) -and ($SinceLastDownAlert -ge 1)) {
                Write-Output "It has been $SinceLastDownAlert days since last alert"
                Write-Output "$($ServerName) is offline for $DownFor days"

                $Server.LastDownAlertTime = $Now
            }
        }
    }

    $Server.IPV4Address = $Connection.IPV4Address
    $Server.LastCheckTime = $Now
    [void]$Export.add($Server)
}

$Export | Export-Csv -Path $ServerListFilePath -Delimiter ',' -NoTypeInformation
