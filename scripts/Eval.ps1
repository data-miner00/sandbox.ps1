# Reference: https://matthewmanela.com/blog/quickly-moving-up-a-directory-tree/
for($index = 1; $index -le 5; $index++){
    $upFunctionName =  "u$index"
    $upDirectory =  "../" * $index

    # Create function with variable name on runtime
    Invoke-Expression "function $upFunctionName { Push-Location $upDirectory }"
}