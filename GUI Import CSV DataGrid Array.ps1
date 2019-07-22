function GenerateForm{
$form1 = New-Object System.Windows.Forms.Form
$dataGridView = New-Object System.Windows.Forms.DataGridView

$form1.Name = 'form1'
$form1.Text = 'Display Computer Status'
$form1.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 890
$System_Drawing_Size.Height = 359
$form1.ClientSize = $System_Drawing_Size
$form1.StartPosition = 1
$form1.BackColor = [System.Drawing.Color]::FromArgb(255,185,209,234)

$source = import-csv "C:\temp\CompInfo.csv"

#create an array for griddata
        Write-Debug "Create `$griddata"
        $griddata=@()
        #create a custom object
        
        foreach ($file in $source) {
          Write-Debug "Creating `$obj"
          $obj=New-Object PSobject
          Write-Debug "Adding Computername property"
          $obj | Add-Member Noteproperty Computername $file
          
          
        
        	#Add the object to griddata
            	
            	$griddata+=$obj

		
        } #end foreach
        
        Write-Debug "Creating ArrayList"   
        $array= New-Object System.Collections.ArrayList
        
        Write-Debug "Adding `$griddata to `$arry"
        $array.AddRange($griddata)
        $DataGridView.DataSource = $array
        #find unpingable computer rows
        Write-Debug "Searching for non-pingable computers"
        $c=$dataGridView.RowCount
        for ($x=0;$x -lt $c;$x++) {
            for ($y=0;$y -lt $dataGridView.Rows[$x].Cells.Count;$y++) {
                $value = $dataGridView.Rows[$x].Cells[$y].Value
                if ($value -eq "No") {
                #if Pinged cell = No change the row font color
                Write-Debug "Changing color on row $x"
                $dataGridView.rows[$x].DefaultCellStyle.Forecolor=[System.Drawing.Color]::FromArgb(255,255,0,0)
                }
             }
         }
        
        Write-Debug "Setting status bar text"
        

    
   
   



$dataGridView.RowTemplate.DefaultCellStyle.ForeColor = [System.Drawing.Color]::FromArgb(255,0,128,0)
$dataGridView.Name = 'dataGridView'
$dataGridView.DataBindings.DefaultDataSourceUpdateMode = 0
$dataGridView.ReadOnly = $False
$dataGridView.AllowUserToDeleteRows = $False
$dataGridView.RowHeadersVisible = $False
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 870
$System_Drawing_Size.Height = 260
$dataGridView.Size = $System_Drawing_Size
$dataGridView.TabIndex = 8
$dataGridView.Anchor = 15
$dataGridView.AutoSizeColumnsMode = 16



$dataGridView.AllowUserToAddRows = $False
$dataGridView.ColumnHeadersHeightSizeMode = 2
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 13
$System_Drawing_Point.Y = 70
$dataGridView.Location = $System_Drawing_Point
$dataGridView.AllowUserToOrderColumns = $True
$dataGridView.add_CellContentDoubleClick($LaunchCompMgmt)
#$dataGridView.AutoResizeColumns([System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells]::AllCells)
#$DataGridViewAutoSizeColumnsMode.AllCells

$form1.Controls.Add($dataGridView)

$form1.ShowDialog()| Out-Null
} #End Function

#Call the Function
GenerateForm


