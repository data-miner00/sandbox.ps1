try {
    throw [System.Exception] "This is an exception."
}
catch {
    Write-Host "Caught an exception: $($_.Exception.Message)"
}

# Catch multiple specific exceptions
try {
    throw [System.ArgumentNullException] "Parameter cannot be null."
}
catch [System.ArgumentNullException], [System.ArgumentException] {
    Write-Host "Caught an argument exception: $($_.Exception.Message)"
}
catch [System.Exception] {
    Write-Host "Caught a general exception: $($_.Exception.Message)"
}