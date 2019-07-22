Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'

function Show-Console
{
    $consolePtr = [Console.Window]::GetConsoleWindow()

    # Hide = 0,
    # ShowNormal = 1,
    # ShowMinimized = 2,
    # ShowMaximized = 3,
    # Maximize = 3,
    # ShowNormalNoActivate = 4,
    # Show = 5,
    # Minimize = 6,
    # ShowMinNoActivate = 7,
    # ShowNoActivate = 8,
    # Restore = 9,
    # ShowDefault = 10,
    # ForceMinimized = 11

    [Console.Window]::ShowWindow($consolePtr, 4)
}

function Hide-Console
{
    $consolePtr = [Console.Window]::GetConsoleWindow()
    #0 hide
    [Console.Window]::ShowWindow($consolePtr, 0)
}

function GenerateForm
{
    [reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
    [reflection.assembly]::LoadWithPartialName("System.Drawing") | Out-Null

    #Gen Form Objects Region
    $HelpDeskForm = New-Object System.Windows.Forms.Form
    $BoxLabel = New-Object System.Windows.Forms.Label

    $YesTextBox = New-Object System.Windows.Forms.TextBox
    $NoTestBox = New-Object System.Windows.Forms.TextBox

    $YesButton = New-Object System.Windows.Forms.Button
    $NoButton = New-Object System.Windows.Forms.Button

    $InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
    #End Gen Form Objects

    $handler_YesButton_Click=
    {
        #custom script here
        Write-Host "Happy Holidays"
    }
    $handler_NoButton_Click=
    {
        #end script here
        $HelpDeskForm.Close()
    }

    $OnLoadForm_StateCorrection = 
    {
        #Correct the initial state of the form to prevent the .Net maximized form issue
        $HelpDeskForm.WindowState = $InitialFormWindowState
    }

    #Gen Form Code Region
    #------FORM--------------
    $HelpDeskForm.text = "Our Help Desk"
    $HelpDeskForm.name = "HelpDeskForm"
    $HelpDeskForm.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 700
    $System_Drawing_Size.height = 700
    $HelpDeskForm.ClientSize = $System_Drawing_Size

    #-----------YES BUTTON-------------
    $YesButton.TabIndex = 0
    $YesButton.Name = "YesButton"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 100
    $System_Drawing_Size.Height = 23
    $YesButton.Size = $System_Drawing_Size
    $YesButton.UseVisualStyleBackColor = $True

    $YesButton.Text = "Yes"

    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 13
    $System_Drawing_Point.Y = 70
    $YesButton.Location = $System_Drawing_Point
    $YesButton.DataBindings.DefaultDataSourceUpdateMode = 0
    $YesButton.add_Click($handler_YesButton_Click)

    #-----------NO BUTTON-------------
    $NoButton.TabIndex = 0
    $NoButton.Name = "YesButton"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 100
    $System_Drawing_Size.Height = 23
    $NoButton.Size = $System_Drawing_Size
    $NoButton.UseVisualStyleBackColor = $True

    $NoButton.Text = "Cancel"

    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 125
    $System_Drawing_Point.Y = 70
    $NoButton.Location = $System_Drawing_Point
    $NoButton.DataBindings.DefaultDataSourceUpdateMode = 0
    $NoButton.add_Click($handler_NoButton_Click)

    #------------BoxLabel------------
    $BoxLabel.TabIndex = 0
    $BoxLabel.Name = "BoxLabel"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 300
    $System_Drawing_Size.Height = 60
    $BoxLabel.Size = $System_Drawing_Size

    $BoxLabel.text = "This will erase Backup Logs Dated 2 Months or older.

    Are you sure you would like to continue?"

    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 10
    $System_Drawing_point.Y = 10
    $BoxLabel.Location = $System_Drawing_Point

    $HelpDeskForm.Controls.Add($YesButton)
    $HelpDeskForm.Controls.Add($NoButton)
    $HelpDeskForm.Controls.Add($BoxLabel)


    $new = New-Object System.Windows.Documents.FlowDocument
    $new = Get-Content "\\<NETWORK PATH>\Monthly Statement Build_MC.docx"



    $run = New-Object System.Windows.Documents.Run('text hello there this is me i am you you are me we are you who is we why')
    $paragraph = New-Object System.Windows.Documents.Paragraph($run)
    $flowDocument = New-Object System.Windows.Documents.FlowDocument($paragraph)

    $textBox6 = New-Object 'System.Windows.Forms.RichTextBox'
    $textBox6.Multiline = $True
    $textBox6.Height = 630
    $textBox6.Width = 555
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 250
    $System_Drawing_Point.Y = 40
    $textBox6.Location = $System_Drawing_Point
    $textBox6.AppendText("Hello there we are you i am who you are me we are you")
    $textBox6.WordWrap = $True
    $textBox6.ScrollBars = "Both"
    $textBox6.BackColor = "Black"
    $textBox6.ForeColor = "White"
    $textBox6.ReadOnly = $True
    $HelpDeskForm.Controls.Add($textBox6)


     #endregion Generated Form Code




    #Save the initial state of the form 
    $InitialFormWindowState = $HelpDeskForm.WindowState 
    #Init the OnLoad event to correct the initial state of the form 
    $HelpDeskForm.add_Load($OnLoadForm_StateCorrection) 
    #Show the Form 
    $HelpDeskForm.ShowDialog()| Out-Null

} #End Function

Hide-Console
#Call the Function 
GenerateForm 