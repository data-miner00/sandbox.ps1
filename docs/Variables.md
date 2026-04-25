Declaring a variable

```ps1
$hello = "World" # string type
$one = "1" # string type
$birthday = "January 1, 2001" # string type
```

Declare with specific type.

```ps1
[string]$hello = "World"
[Int]$one = 1
[DateTime]$birthday = "January 1, 2001"
```

## Casting

From str to int

```ps1
$oneStr = "1"
$oneInt = $oneStr -as [Int]
```

From bool to int

```ps1
$boolInt = $true -as [Int]
```

From str to DateTime

```ps1
$birthday = "January 1, 2001" -as [DateTime]
```

Check for type

```ps1
$oneStr -Is [Int]
$oneStr -IsNot [Int]
```

## Formatting

Show specific decimal places.

```ps1
$numeric = 123.4561233
"{0:n3}" -f $numeric # 123.456
```

Show phone number format.

```ps1
$phone = 1234567890
"{0:###-###-####}" -f $phone
```

Show year from date

```ps1
"{0:yyyy}" -f (Get-Date)
```

Get type of a variable

```ps1
$unknownType.GetType().Name
```

## Replacement

```ps1
$str = "The Solar Council has neutralised your intent to break the rules."
$replaced = $str -replace "Solar", "Lunar"
```

Replace with regex

```ps1
$name = "Shaun Chong"
$formal = $name -replace "(\w+)\s(\w+)", '$2, $1' # notice to use single quotes here. Double quote will not treat the former as regex, but plain string, which not match the criteria for replacement.
```

Remove spaces

```ps1
$str = "The Solar Council has neutralised your intent to break the rules."
$unspaced = $str -replace '[^a-z]'
```

## Arrays

```ps1
$arr = @("hello", "world")

$arr | ForEach-Object { "The string is $PSItem" }
foreach ($item in $arr) { "The string is $item" }
$arr.ForEach({ "The string is $PSItem" })
for ($item = 0; $item -lt $arr.count; $item++) {
    "The string is $($arr[$item])"
}
```

## Hash Tables

```ps1
$normal = @{ Hello = "World"; Bye = "Bye" }
$ordered = [ordered]@{ Key1 = "1"; Key5 = "5"; Key4 = "4" }
```

Using custom object

```ps1
# create empty object
$custom = [PSCustomObject]@{}
# or
$custom = New-Object -TypeName PSObject
```
