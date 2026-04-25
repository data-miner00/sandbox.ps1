$path = "cars.xml";
$xpath = "/cars/car"

$xml = Select-Xml -Path $path -XPath $xpath

# loop and print
$xml | ForEach-Object { $_.Node.Make }

# Using get-content
[xml]$fromContent = Get-Content -Path $path

$fromContent.Cars.Car.Model | ForEach-Object { $_ }
