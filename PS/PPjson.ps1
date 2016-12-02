$datetime = get-date -f yyyy-MM-dd_HH-mm_ss;
 $input = (Read-Host "Please enter JSON string and strike [ENTER].")
    #Request JSON
   if ($input -ne '') {
     $json = $input
	 #collapse JSON object
   }

$outFile = new-item C:\Rocketmiles\JSON\$datetime.JSON -type file
$json | convertFrom-json | ConvertTo-Json | add-content $outFile;
write-host $json