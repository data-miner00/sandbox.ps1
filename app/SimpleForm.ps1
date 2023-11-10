Add-Type -AssemblyName System.Windows.Forms

$FormObject = [System.Windows.Forms.Form]
$LabelObject = [System.Windows.Forms.Label]

$Form = New-Object $FormObject
$Form.ClientSize = '500,300'
$Form.Text = 'Hello World- Tutorial'
$Form.BackColor = '#ffffff'


$LblTitle = New-Object $LabelObject
$LblTitle.Text = 'Hello World!'
$LblTitle.AutoSize = $true
$LblTitle.Font = 'Verdana,24,style=Bold'
$LblTitle.Location = New-Object System.Drawing.Point(120, 110)

$Form.Controls.AddRange(@($LblTitle))

# Display form
$Form.ShowDialog()

# Cleans up the form
$Form.Dispose()
