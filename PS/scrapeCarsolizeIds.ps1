$datetime = get-date -f yyyy-MM-dd_HH-mm;
$logfile = "C:\Rocketmiles\PS\Transcripts\PSTranscript_$datetime.txt";
Start-transcript $logfile -NoClobber;

$files = gci "C:\Rocketmiles\AMAZON\2016-11-28_Errors\PT\Unzipped" -recurse 
foreach( $file in $files){
gc $file.FullName | Select-String -simplematch "Responded to request POST to /hss/book"  | Tee-Object "C:\Rocketmiles\PT_2016-11-28_SessionID2.txt"
}

write-host "Done gathering double-booking session ID error lines."

Stop-Transcript
exit;