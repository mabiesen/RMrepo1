$datetime = get-date -f yyyy-MM-dd_HH-mm;
$logfile = "C:\Rocketmiles\PS\Transcripts\PSTranscript_$datetime.txt";
Start-transcript $logfile -NoClobber;

Set-Location C:\rocketmiles\Amazon\
#set download directory [CWD].

$i = 1;
#Set Loop Counter.


[System.Collections.ArrayList]$SESSIONS = @();
do {
 $input = (Read-Host "Please enter sessionID(s), one at a time, and strike [ENTER].")
    #Request session IDs from user.
   if ($input -ne '') {
     $SESSIONS.add("$input")
	 #Add session-ID to array.
   }
}
until ($input -eq '')
    #collapse session-IDs array after empty submission.
	
$Date = (Read-host "Please enter the session(s) date (ex 2016-12-01): ");
if ($Date -eq '') {
  $Date = get-date -f yyyy-MM-dd;
}
    # assume date is for today if no date is supplied.

write-host -foregroundcolor Yellow "Acquiring the following sessions for" -noNewLine
write-host -foregroundcolor Cyan " $Date :" -noNewLine
write-host -foregroundcolor Green "$SESSIONS";

  foreach ($Session in $SESSIONS){

    invoke-expression "aws s3 cp s3://rocketmiles-provider-logs/PRODUCTION/$Date/$Session $Date/$Session --recursive --exclude '*' --include '*.xml.gz'";
  # Execute command for each URL session-ID
 
  write-host "Completed download #$i (SessionID: $Session)."
    $i++;
	Set-Location C:\rocketmiles\Amazon\$Date\$Session
	 7z e *.gz -aou -oUNZIPPED * -r
  # Un-zip files into new folder with 7-zip.
  write-host "Unzipped all files for $Session!"

Set-Location C:\rocketmiles\Amazon\
#set download directory back again (for the next file in succession).  
  }

write-host -foregroundcolor DarkCyan "Done downloading! All files should be unzipped in a relative sub-directory.";
#Close for-each loop after all S3 downloads complete.

Stop-transcript;

Set-Location C:\rocketmiles\PS\
#set location back to script directory.

exit;
#Loop should end after all files are downloaded and un-zipped.
