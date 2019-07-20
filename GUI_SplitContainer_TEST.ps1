function form{
$form = New-Object System.Windows.Forms.Form
$form.Size = '800,600'
$form.text = "Test"

$menu = New-Object System.Windows.Forms.MenuStrip
$fileMenu = New-Object System.Windows.Forms.ToolStripMenuItem('File')
$tools = New-Object System.Windows.Forms.ToolStripMenuItem('Tools')

$splitcontainer = New-Object System.Windows.Forms.SplitContainer
$split2 = New-Object System.Windows.Forms.SplitContainer
$split3 = New-Object System.Windows.Forms.SplitContainer

$gBox = New-Object System.Windows.Forms.GroupBox
$gBox2 = New-Object System.Windows.Forms.GroupBox
$gBox3 = New-Object System.Windows.Forms.GroupBox
$gBox4 = New-Object System.Windows.Forms.GroupBox

$label = New-Object System.Windows.Forms.Label
$label2 = New-Object System.Windows.Forms.Label

$splitContainer.Panel1.SuspendLayout()
$splitContainer.Panel2.SuspendLayout()
$splitContainer.SuspendLayout()

$menu.items.Add($fileMenu)
$menu.Items.Add($tools)

$menu.Location = '0,0'
$menu.size = '1151,24'
$menu.text = "Main Menu"

#$splitcontainer.BorderStyle = [System.Windows.Forms.BorderStyle]::Fixed3D
#$splitcontainer.Dock = [System.Windows.Forms.DockStyle]::Fill
$splitcontainer.Location = '0,24'
$splitcontainer.Size = '1151,545'
$splitcontainer.Panel1.Controls.Add($split2)
$splitcontainer.Panel2.Controls.Add($split3)
$splitcontainer.SplitterDistance = 372

$split2.BorderStyle = [System.Windows.Forms.BorderStyle]::Fixed3D
$split2.Dock = [System.Windows.Forms.DockStyle]::Fill
$split2.Location = '0,0'
$split2.Orientation = [System.Windows.Forms.Orientation]::Horizontal
$split2.Panel1.BackColor = 'Control'
$split2.Panel1.Controls.Add($gBox)
$split2.panel2.Controls.Add($gBox2)
$split2.Size = '372,545'
$split2.SplitterDistance = 302

$split3.BorderStyle = [System.Windows.Forms.BorderStyle]::Fixed3D
$split3.Dock = [System.Windows.Forms.DockStyle]::Fill
$split3.Location = '0,0'
$split3.Size = '775,545'
$split3.Orientation = [System.Windows.Forms.Orientation]::Horizontal
$split3.SplitterDistance = 303

$split3.panel1.controls.Add($label)
$split3.panel2.controls.add($label2)

$label.text = "Label 1"
$label.size = '50,50'
$label.Location = '5,5'

$label2.text = "Label 2"
$label2.size = '50,50'
$label2.Location = '5,5'

$gBox.Anchor = "top, left, right"
$gBox.Location = '12,3'
$Gbox.Size = '340,57'
$gBox.Text = "Computer"

$gBox2.Anchor = "top, left, right"
$gBox2.Location = '12,3'
$Gbox2.Size = '340,57'
$gBox2.Text = "Other"

$form.Controls.Add($menu)
$form.controls.add($splitcontainer)

$form.AutoScaleDimensions = '6,13'
$form.AutoScaleMode = 'Font'
$form.ClientSize = '1151,591'
$form.MainMenuStrip = $menu

$menu.ResumeLayout($false)
$menu.PerformLayout()
$splitcontainer.Panel1.ResumeLayout($false)
$splitcontainer.Panel2.ResumeLayout($false)
$splitcontainer.ResumeLayout($false)
$split2.panel1.ResumeLayout($false)
$split2.panel2.ResumeLayout($false)
$split2.ResumeLayout($false)
$split3.Panel1.ResumeLayout($false)
$split3.Panel2.ResumeLayout($false)
$split3.ResumeLayout($false)

$gbox.ResumeLayout($false)
$gBox.PerformLayout()

$form.ResumeLayout($false)
$form.PerformLayout()

$form.ShowDialog()
}

form