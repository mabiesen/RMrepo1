$datetime = get-date -f yyyy-MM-dd_HH-mm;
$logfile = "C:\Rocketmiles\PS\Transcripts\PSTranscript_$datetime.txt";
Start-transcript $logfile -NoClobber;

$files = gci "C:\Rocketmiles\AMAZON\2016-11-28_Errors\PT\Unzipped" -recurse 
foreach( $file in $files){
gc $file.FullName | Select-String -simplematch '"status":"SUCCESS"' | out-file -width 9999 -append "C:\Rocketmiles\PT_2016-11-28_SessionIDs.txt"
}

write-host "Done gathering double-booking session ID error lines."

Stop-Transcript
exit;