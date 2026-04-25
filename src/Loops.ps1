$number = 1;
while ($number -le 5) {
    Write-Host "The number is: $number";
    $number++;
}

Do {
    Write-Host "The number is: $number";
    $number--;
} while ($number -ge 1);

Do {
    Write-Host "The number is: $number";
    $number++;
} until ($number -gt 5);

$number2 = 4;
Switch ($number, $number2) {
    1 { Write-Host "The number is one"; break }
    2 { Write-Host "The number is two"; break }
    3 { Write-Host "The number is three"; break }
    4 { Write-Host "The number is four"; break }
    5 { Write-Host "The number is five"; break }
    Default { Write-Host "The number is greater than five" }
}
