$path = "cars.json"

# Import
$json = Get-Content -Path $path | ConvertFrom-Json

# Export
$json | ConvertTo-Json | Out-File -FilePath $path

# Test
Get-Content -Path $path -Raw | Test-Json # only available on PS 6.1+