$datetime = get-date -f yyyy-MM-dd_HH-mm;
$logfile = "C:\Rocketmiles\PS\Transcripts\PSTranscript_$datetime.txt";
Start-transcript $logfile -NoClobber;

Set-Location C:\rocketmiles\Amazon\
#set download directory [CWD].

$i = 1;
#Set Loop Counter.

$SESSIONS = @("D077F5849626B5F5AEAB2B06C66B52E2-n1");

  foreach ($Session in $SESSIONS){

    invoke-expression "aws s3 cp s3://rocketmiles-provider-logs/PRODUCTION/2016-12-01/$Session 2016-12-01_Errors/$Session --recursive --exclude '*' --include '*PRICELINE_MERCHANT*'";
  # Execute command for each URL session-ID
 
  write-host "Completed download #$i (SessionID: $Session)."
    $i++;
	Set-Location C:\rocketmiles\Amazon\2016-12-01_Errors\$Session
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
