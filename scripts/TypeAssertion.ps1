$name = "Shaun"
$age = 100
$isRich = $true
$pi = 3.14159

Write-Host "Name is string? $($name -is [System.String])"
Write-Host "Name is not int? $($name -isnot [System.Int32])"
Write-Host "Age is int? $($age -is [System.Int32])"
Write-Host "IsRich is bool? $($isRich -is [System.Boolean])"
Write-Host "Pi is double? $($pi -is [System.Double])"

