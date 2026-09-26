[`Tee-Object`](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/tee-object?view=powershell-7.4) saves the output of a command to a file or a variable **and** passes it down the pipeline at the same time.

The name comes from a T-shaped pipe fitting: the input flows in one end and splits into two directions.

```
Get-Process ──► Tee-Object ──► (next command / console)
                    │
                    ▼
               file or variable
```

Without `Tee-Object`, you would have to choose between seeing the output and saving it.

```ps1
Get-Process | Out-File -FilePath .\processes.txt # saved, but nothing on screen
Get-Process | Tee-Object -FilePath .\processes.txt # saved AND shown on screen
```

## Saving to a File

Use `-FilePath` to write the output to a file. The file is overwritten if it already exists.

```ps1
Get-Process | Tee-Object -FilePath .\processes.txt
```

Add `-Append` to add to the end of the file instead of overwriting.

```ps1
Get-Date | Tee-Object -FilePath .\log.txt -Append
```

Use `-LiteralPath` when the path contains wildcard characters like `[` or `]` that should not be interpreted.

```ps1
Get-Process | Tee-Object -LiteralPath '.\logs[2026].txt'
```

The file contains the **formatted** text, the same as what you see on the console, not the raw objects. To keep the objects, save to a variable or use `Export-Csv` / `Export-Clixml` instead.

## Saving to a Variable

Use `-Variable` to store the output in a variable. Pass the variable name **without** the `$`.

```ps1
Get-Process | Tee-Object -Variable procs | Select-Object -First 5

$procs.Count # all processes, not just the first 5
```

Unlike a file, the variable holds the actual objects, so you can still use their properties later.

```ps1
$procs | Where-Object CPU -gt 100
```

## Capturing Intermediate Results

`Tee-Object` can be placed in the middle of a pipeline to take a snapshot at that step, while the rest of the pipeline continues.

```ps1
Get-ChildItem -Path .\src -Recurse |
    Tee-Object -Variable allFiles |
    Where-Object Extension -eq '.ps1' |
    Tee-Object -Variable scripts |
    Measure-Object

$allFiles.Count # every file
$scripts.Count # only .ps1 files
```

This is handy for debugging a long pipeline.

## Using `-InputObject`

Instead of piping, the input can be passed with `-InputObject`. Note that a collection is treated as **one** object, not enumerated item by item.

```ps1
$numbers = 1..3

(Tee-Object -InputObject $numbers -Variable copy | Measure-Object).Count # 1, the array is passed as one object
($numbers | Tee-Object -Variable copy | Measure-Object).Count # 3, each number is passed separately
```

Piping is usually what you want.

## Encoding

The file encoding depends on the PowerShell version.

| Version                 | Default encoding       |
| ----------------------- | ---------------------- |
| Windows PowerShell 5.1  | UTF-16 LE (`Unicode`)  |
| PowerShell 7+           | UTF-8 without BOM      |

In PowerShell 7.2+, the encoding can be set with `-Encoding`.

```ps1
Get-Process | Tee-Object -FilePath .\processes.txt -Encoding utf8
```

In Windows PowerShell 5.1 there is no `-Encoding` parameter. Use `Out-File -Encoding` or `Add-Content` instead if the encoding matters.

## Alias

On Windows, `tee` is an alias of `Tee-Object`.

```ps1
Get-Process | tee .\processes.txt
```

On Linux and macOS, `tee` runs the native `tee` command instead, so use the full `Tee-Object` name in cross-platform scripts.

## Common Use Cases

1. Logging a script's output while still watching it run.
   ```ps1
   .\Deploy.ps1 | Tee-Object -FilePath .\deploy.log -Append
   ```
2. Keeping a copy of results for later without running the command twice.
   ```ps1
   Get-Service | Tee-Object -Variable services | Where-Object Status -eq 'Running'
   ```
3. Debugging a pipeline by inspecting what each step produces.

## Tee-Object vs `-OutVariable`

Every cmdlet supports the common parameter `-OutVariable` (alias `-ov`), which does a similar job for variables.

```ps1
Get-Process -OutVariable procs | Select-Object -First 5
```

| Feature                          | `Tee-Object` | `-OutVariable`              |
| -------------------------------- | ------------ | --------------------------- |
| Save to a file                   | Yes          | No                          |
| Save to a variable               | Yes          | Yes                         |
| Append to an existing variable   | No           | Yes (`-OutVariable +procs`) |
| Works after any pipeline step    | Yes          | Only on cmdlets / advanced functions |
