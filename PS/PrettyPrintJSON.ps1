[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  

$Form = New-Object System.Windows.Forms.Form    
$Form.Size = New-Object System.Drawing.Size(650,400)  

############################################## Start functions

function jsonPaste {
 $json=$InputBox.text;
 $datetime = get-date -f yyyy-MM-dd_HH-mm_ss;
 $outFile = new-item C:\Rocketmiles\JSON\$datetime.JSON -type file
   #capture pretty-print JSON but also log to flat-file for backup.
 $jsonResult = $json | convertFrom-json | ConvertTo-Json | Clip | add-content $outFile;
    #output pretty-printed JSON
 $outputBox.text=$json | convertFrom-json | convertTo-json
}
#end jsonPaste

############################################## end functions

############################################## Start text fields

$InputBox = New-Object System.Windows.Forms.TextBox 
$InputBox.Location = New-Object System.Drawing.Size(20,50) 
$InputBox.Size = New-Object System.Drawing.Size(450,50) 
$Form.Controls.Add($InputBox) 

$outputBox = New-Object System.Windows.Forms.TextBox 
$outputBox.Location = New-Object System.Drawing.Size(10,100) 
$outputBox.Size = New-Object System.Drawing.Size(600,250) 
$outputBox.MultiLine = $True 
$outputBox.ScrollBars = "Vertical"
$outputBox.Font = New-Object System.Drawing.Font("Lucida Console",8,[System.Drawing.FontStyle]::Regular) 
$Form.Controls.Add($outputBox) 

############################################## end text fields

############################################## Start buttons

$Button = New-Object System.Windows.Forms.Button 
$Button.Location = New-Object System.Drawing.Size(555,10) 
$Button.Size = New-Object System.Drawing.Size(75,25) 
$Button.Text = "Pretty!" 
$Button.Add_Click({jsonPaste}) 
$Form.Controls.Add($Button) 


#Cancel button
$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Size(555,55)
$CancelButton.Size = New-Object System.Drawing.Size(75,25)
$CancelButton.Text = "Cancel"
$CancelButton.Add_Click({$Form.Close()})
$Form.Controls.Add($CancelButton)
############################################## end buttons

$Form.Add_Shown({$Form.Activate()})
[void] $Form.ShowDialog()