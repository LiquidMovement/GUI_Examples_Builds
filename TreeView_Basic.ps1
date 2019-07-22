    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.Application]::EnableVisualStyles()

function listbox($listbox){

    $listbox.Location = New-Object System.Drawing.Point(165,10)
    $listbox.BringToFront()
    $listbox.size = '290,480'
    $listbox.BackColor = 'Red'


}

function treenodes($newNode){
    $newNode.Name = 'Test'
    $newNode.Text = 'Test'
}

function mainnode($mainnode){
    $mainnode.Text = 'Computer'
    
    treenodes($newNode)

    $mainnode.Nodes.Add($newNode)
}

function treeview($treeview){

    $treeview.location = New-Object System.Drawing.Point(10,10)
    $treeview.BringtoFront()
    $treeview.size = '150,480'
    $treeview.backcolor = 'LightBlue'

    mainnode($mainnode)

    $treeview.Nodes.Add($mainnode)

}

function GenForm{

    $pokedex = New-Object 'System.Windows.Forms.Form'
    $listbox = New-Object 'System.Windows.Forms.ListBox'
    $treeview = New-Object System.Windows.Forms.TreeView
    $mainnode = New-Object System.Windows.Forms.TreeNode -ArgumentList 'Computer'
    $mainnode.Tag = 'Computer'
    $newNode = New-Object System.Windows.Forms.TreeNode

    <#
    Other New-Objects
    #>

    $InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
    listbox($listbox)
    treeview($treeview)

    $pokedex_Load = {}

    <#
    Click Functions
    Click Actions
    #>
    $Form_StateCorrection_Load = {
        $pokedex.WindowState = $InitialFormWindowState
    }

    $pokedex.SuspendLayout()

    #pokedex
    #.Controls.Add()
    $pokedex.Controls.Add($listbox)
    $pokedex.Controls.Add($treeview)

    $pokedex.ClientSize = '450,500'
    $pokedex.AutoScaleDimensions = '6,13'
    $pokedex.AutoScaleMode = 'Font'
    $pokedex.FormBorderStyle = 'Sizable'
    $pokedex.BackColor = 'LightGray'#[System.Drawing.Color]::FromArgb(255,255,50,50)
    $pokedex.MaximizeBox = $True
    $pokedex.MinimizeBox = $True
    $pokedex.Name = 'Pokedex Form'
    $pokedex.StartPosition = 'CenterScreen'
    $pokedex.MinimumSize = '300,250'
    $pokedex.KeyPreview = $True
    $pokedex.AutoScroll = $True
    $pokedex.VerticalScroll.Enabled = $true
    $pokedex.VerticalScroll.Visible = $True
    $pokedex.add_Load($pokedex_Load)

    <#
    Define other stuff
    #>

    $pokedex.ResumeLayout()
    $InitialFormWindowState = $pokedex.WindowState
    $pokedex.add_Load($Form_StateCorrection_Load)
    $pokedex.ShowDialog()
}

GenForm