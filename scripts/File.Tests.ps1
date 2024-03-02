Describe "Example Unit Test" {
    It "Check results file is present" {
        Test-Path somefile.txt | Should -Be $true
    }
}
