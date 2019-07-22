$myarray = 1, 2, 3, 4
$count = $myarray.Length
$i = 1
foreach($file in $myarray){
    Write-host $file
    }
    


Add-Type -AssemblyName System.Windows.Forms

$Form = New-Object system.Windows.Forms.Form
$Form.Text = "Form"
$Form.TopMost = $true
$Form.Width = 398
$Form.Height = 423

$textBox1 = New-Object system.windows.Forms.TextBox
$textBox1.Text = $myarray[0]
$textBox1.Width = 100
$textBox1.Height = 20
$textBox1.location = new-object system.drawing.point(17,39)
$textBox1.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($textBox1)

$textBox2 = New-Object system.windows.Forms.TextBox
$textBox2.Text = $myarray[1]
$textBox2.Width = 100
$textBox2.Height = 20
$textBox2.location = new-object system.drawing.point(18,73)
$textBox2.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($textBox2)

$textBox3 = New-Object system.windows.Forms.TextBox
$textBox3.Text = $myarray[2]
$textBox3.Width = 100
$textBox3.Height = 20
$textBox3.location = new-object system.drawing.point(19,104)
$textBox3.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($textBox3)

$textBox4 = New-Object system.windows.Forms.TextBox
$textBox4.Text = $myarray[3]
$textBox4.Width = 100
$textBox4.Height = 20
$textBox4.location = new-object system.drawing.point(20,140)
$textBox4.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($textBox4)

[void]$Form.ShowDialog()