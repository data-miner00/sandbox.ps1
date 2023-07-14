$data = Get-Service | Where-Object Status -EQ 'Stopped' | Select-Object Name, Status

$data | Out-File .\data\ServicesFiltered.txt

$data | Export-Csv .\data\ServicesFiltered.csv

Get-Content .\data\ServicesFiltered.csv | more
