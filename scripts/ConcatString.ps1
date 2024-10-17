Write-Host (-join("Hello", " ", "world"))

# ---

$world = "world"
Write-Host "Hello $world"

# ---

$hello = "hello"
Write-Host ($hello + " " + $world)

# ---

Write-Host ("{0} {1}" -f $hello, $world)

# ---

$str = $hello
$str += " "
$str += $world

Write-Host $str

# ---

Write-Host $([string]::Join(" ", @($hello, $world)))

# ---

Write-Host $([string]::Join(" ", $hello, $world))

# ---

$values = @(
    "hello"
    "world"
    "yay"
)
Write-Host ('First: {0} second: {1} third: {2}' -f $values)

# ---

Write-Host $([string]::Concat($values))