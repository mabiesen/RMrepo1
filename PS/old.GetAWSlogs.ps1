$datetime = get-date -f yyyy-MM-dd_HH-mm;
$logfile = "C:\Rocketmiles\PS\Transcripts\PSTranscript_$datetime.txt";
Start-transcript $logfile -NoClobber;

Set-Location C:\rocketmiles\Amazon\
#set download directory [CWD].

$i = 1;
#Set Loop Counter.
#Request session IDs from user.

[System.Collections.ArrayList]$SESSIONS = @();
do {
 $input = (Read-Host "Please enter the sessionID(s)...")
 if ($input -ne '') {$SESSIONS.add("$input")}
}
until ($input -eq '')

write-host $SESSIONS

    ## Removed on 11-28-16 ##
    #    $SESSIONS = @("84EF010F625846FEBC54721FE66BC172-n1");
    #collapse session-IDs into an array.

  foreach ($Session in $SESSIONS){

    invoke-expression "aws s3 cp s3://rocketmiles-provider-logs/PRODUCTION/2016-11-28/$Session 2016-11-28_ERRORS/$Session --recursive --exclude '*' --include '*.xml.gz'";
  # Execute command for each URL session-ID
 
  write-host "Completed download #$i (SessionID: $Session)."
    $i++;
	Set-Location C:\rocketmiles\Amazon\2016-11-28_ERRORS\$Session
	 7z e *.gz -aou -oUNZIPPED * -r
  # Un-zip files into new folder with 7-zip.
  write-host "Unzipped all files for $Session!"

Set-Location C:\rocketmiles\Amazon\
#set download directory back again (for the next file in succession).  
  }

write-host "Done downloading! All files should be unzipped in a relative sub-directory.";
#Close for-each loop after all S3 downloads complete.

Stop-transcript;

exit;
#Loop should end after all files are downloaded and un-zipped.


### TODO: Implement copy-paste array of sessionID values.


