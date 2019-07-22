    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.Application]::EnableVisualStyles()
    $ITTools = Import-Csv -Path "C:\temp\Poke\listbox_all.csv" -Header Tag,Name,Path

    $pathText = @("Software", "General IT", "VRTWEB01", "Backup Logs", "Reports", "Asset Management")
    $toolText = @("General Tools", "Computer Scripts", "AD User Scripts", "User Info Scripts", "Device Info Scripts", "GAM Scripts")
    $ciscoText = @("URLs - Servers", "Phone Documentation", "Hold Music", "General")
    $InstructsText = @("User Documentation", "General Documentation", "Power 8 Documentation", "Monthly Tasks Documentation")
    $URLsText = @("Servers" ,"Social Media", "JBN Misc.", "Misc.", "LOS/POS", "Google", "Vendors")



function listbox($listbox){

    $listbox.Location = New-Object System.Drawing.Point(165,70)
    $listbox.BringToFront()
    $listbox.size = '280,345'
    $listbox.BackColor = 'White'


}

function populateListBox($nodeSelect){
    $listbox.Items.Clear()
    $listbox.refresh()
    foreach($line in $ITTools){
        if($line.Tag -eq $nodeSelect){
            [void] $listbox.Items.Add($line.Name)
        }  
    }
}


function treeview($treeview){

    $treeview.location = New-Object System.Drawing.Point(10,80)
    $treeview.BringtoFront()
    $treeview.size = '150,340'
    $treeview.backcolor = 'LightBlue'

    $pathNode = New-Object System.Windows.Forms.TreeNode
    $toolNode = New-Object System.Windows.Forms.TreeNode
    $ciscoNode = New-Object System.Windows.Forms.TreeNode
    $instructsNode = New-Object System.Windows.Forms.TreeNode
    $URLsNode = New-Object System.Windows.Forms.TreeNode
    


    $pathNode.Text = 'IT Paths'
    $pathNode.Tag = 'IT Paths'
    $treeview.Nodes.Add($pathNode)

    $toolNode.Text = 'IT Tools'
    $toolNode.Tag = 'IT Tools'
    $treeview.Nodes.Add($toolNode)

    $ciscoNode.Text = 'Cisco'
    $ciscoNode.Tag = 'Cisco'
    $treeview.Nodes.Add($ciscoNode)

    $instructsNode.Text = 'IT Documentation'
    $instructsNode.Tag = 'IT Documentation'
    $treeview.Nodes.Add($instructsNode)

    $URLsNode.Text = 'URLs'
    $URLsNode.Tag = 'URLs'
    $treeview.Nodes.Add($URLsNode)

    #** Path Nodes **
    foreach($path in $pathText){
        $newNode = New-Object System.Windows.Forms.TreeNode
        $newNode.Text = $path

        if($pathNode.Nodes.Tag -contains $path){
            $HostNode = $pathNode.Nodes | ?{$_.Tag -eq $path}
        }
        else{
            $newHostNode = New-Object System.Windows.Forms.TreeNode
            $newHostNode.Text = $path
            $newHostNode.Tag = $path
            
            $null = $pathNode.Nodes.Add($newHostNode)
            $HostNode = $pathNode.Nodes | ?{$_.Tag -eq $path}
        }

        #$null = $HostNode.Nodes.Add($newNode)
    }

    #** Tool Nodes **
    foreach($tool in $toolText){
        $newNode = New-Object System.Windows.Forms.TreeNode
        $newNode.Text = $tool

        if($toolNode.Nodes.Tag -contains $tool){
            $HostNode = $toolNode.Nodes | ?{$_.Tag -eq $tool}
        }
        else{
            $newHostNode = New-Object System.Windows.Forms.TreeNode
            $newHostNode.Text = $tool
            $newHostNode.Tag = $tool
            
            $null = $toolNode.Nodes.Add($newHostNode)
            $HostNode = $toolNode.Nodes | ?{$_.Tag -eq $tool}
        }

        #$null = $HostNode.Nodes.Add($newNode)
    }


    #** Cisco Nodes **
    foreach($cisco in $ciscoText){
        $newNode = New-Object System.Windows.Forms.TreeNode
        $newNode.Text = $cisco

        if($ciscoNode.Nodes.Tag -contains $cisco){
            $HostNode = $ciscoNode.Nodes | ?{$_.Tag -eq $cisco}
        }
        else{
            $newHostNode = New-Object System.Windows.Forms.TreeNode
            $newHostNode.Text = $cisco
            $newHostNode.Tag = $cisco
            
            $null = $ciscoNode.Nodes.Add($newHostNode)
            $HostNode = $ciscoNode.Nodes | ?{$_.Tag -eq $cisco}
        }

        #$null = $HostNode.Nodes.Add($newNode)
    }

        #** Instruct Nodes **
    foreach($inst in $instructsText){
        $newNode = New-Object System.Windows.Forms.TreeNode
        $newNode.Text = $inst

        if($instructsNode.Nodes.Tag -contains $inst){
            $HostNode = $instructsNode.Nodes | ?{$_.Tag -eq $inst}
        }
        else{
            $newHostNode = New-Object System.Windows.Forms.TreeNode
            $newHostNode.Text = $inst
            $newHostNode.Tag = $inst
            
            $null = $instructsNode.Nodes.Add($newHostNode)
            $HostNode = $instructsNode.Nodes | ?{$_.Tag -eq $inst}
        }

        #$null = $HostNode.Nodes.Add($newNode)
    }

        #** URLs Nodes **
    foreach($url in $URLsText){
        $newNode = New-Object System.Windows.Forms.TreeNode
        $newNode.Text = $url

        if($URLsNode.Nodes.Tag -contains $url){
            $HostNode = $URLsNode.Nodes | ?{$_.Tag -eq $url}
        }
        else{
            $newHostNode = New-Object System.Windows.Forms.TreeNode
            $newHostNode.Text = $url
            $newHostNode.Tag = $url
            
            $null = $URLsNode.Nodes.Add($newHostNode)
            $HostNode = $URLsNode.Nodes | ?{$_.Tag -eq $url}
        }

        #$null = $HostNode.Nodes.Add($newNode)
    }

    #$treeview.ExpandAll()

}

function GenForm{

    $pokedex = New-Object System.Windows.Forms.Form
    $listbox = New-Object System.Windows.Forms.ListBox
    $treeview = New-Object System.Windows.Forms.TreeView
    $textBox = New-Object System.Windows.Forms.TextBox
    $infoLabel = New-Object System.Windows.Forms.label
    $searchBox = New-Object System.Windows.Forms.TextBox
    $searchBtn = New-Object System.Windows.Forms.Button

    $splitcontainer1 = 
    $splitcontainer2 = 
    $searchGroup = New-Object System.Windows.Forms.GroupBox
    $groupBox = New-Object System.Windows.Forms.GroupBox
    
    $menu = New-Object System.Windows.Forms.MenuStrip
    $fileMenu = New-Object System.Windows.Forms.ToolStripMenuItem('File')
    $tools = New-Object System.Windows.Forms.ToolStripMenuItem('Tools')
    $help = New-Object System.Windows.Forms.ToolStripMenuItem('Help')
    $quit = New-Object System.Windows.Forms.ToolStripMenuItem('Quit')
    $logs = New-Object System.Windows.Forms.ToolStripMenuItem('Logs')
    $ADUC = New-Object System.Windows.Forms.ToolStripMenuItem('ADUC')

    $font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.5,[System.Drawing.FontStyle]::Bold)
    $font2 = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.5)
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

    $treeview.add_AfterSelect({
        $nodeSelect = $this.SelectedNode.Tag
        populateListBox($nodeSelect)
    })


    $Form_StateCorrection_Load = {
        $pokedex.WindowState = $InitialFormWindowState
    }

    $pokedex.SuspendLayout()

    #pokedex
    #.Controls.Add()
    $pokedex.Controls.Add($listbox)
    $pokedex.Controls.Add($treeview)
    $pokedex.Controls.Add($menu)
    $pokedex.Controls.Add($textBox)
    $pokedex.Controls.add($infoLabel)
    $pokedex.Controls.Add($groupBox)
    $pokedex.Controls.Add($searchGroup)
    $groupBox.BringToFront()
    $searchGroup.BringToFront()
    $menu.BringToFront()
    $textBox.BringToFront()
    $searchBox.BringToFront()

    $pokedex.ClientSize = '450,500'
    $pokedex.AutoScaleDimensions = '6,13'
    $pokedex.AutoScaleMode = 'Font'
    $pokedex.FormBorderStyle = 'FixedDialog'
    $pokedex.BackColor = 'Gray'#[System.Drawing.Color]::FromArgb(255,255,50,50)
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
    $menu.items.Add($fileMenu)
    $menu.Items.Add($tools)
    $menu.Items.Add($help)

    $menu.Location = '0,0'
    $menu.size = '280,24'
    $menu.text = "Main Menu"
    
    $Logs.Add_Click($logBtn_Click)
    $quit.Add_Click($closeBtn_Click)
    $ADUC.Add_Click($ADBtn_Click)

    $fileMenu.DropDownItems.Add($Logs)
    $fileMenu.DropDownItems.Add($quit)
    $tools.DropDownItems.Add($ADUC)
    
    $menu.TabIndex = 2


    $groupBox.Size
    $groupBox.Location
    $groupBox.



    #** INFO TEXT BOX
    $textBox.Size = '280,80'
    $textBox.Multiline = $True
    $textBox.location = '165,415'
    $textBox.backcolor = 'black'
    $textBox.ReadOnly = $True


    $searchGroup.Size = '435,50'
    $searchGroup.Location = '10,25'
    $searchGroup.Text = 'Search'
    $searchGroup.Controls.Add($searchBox)
    $searchGroup.Controls.Add($searchBtn)
    #** SEARCH TEXT BOX
    $searchBox.Size = '140,20'
    $searchBox.TabIndex = 0
    $searchBox.location = '10,20'
    $searchBox.Text = "Search"
    $searchBox.BringtoFront()

    $searchBtn.size = '60,25'
    $searchBtn.text = 'Search'
    $searchBtn.location = '155,18'
    $searchBtn.TabIndex = 1
    $searchBtn.UseVisualStyleBackColor = $True
    $searchBtn.BackColor = "White"
    $searchBtn.Font = $font
    $searchBtn.BringtoFront()


    $pokedex.ResumeLayout()
    $InitialFormWindowState = $pokedex.WindowState
    $pokedex.add_Load($Form_StateCorrection_Load)
    $pokedex.ShowDialog()
}

GenForm