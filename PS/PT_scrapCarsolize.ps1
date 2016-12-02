$datetime = get-date -f yyyy-MM-dd_HH-mm;
$logfile = "C:\Rocketmiles\PS\Transcripts\PSTranscript_$datetime.txt";
Start-transcript $logfile -NoClobber;

$files = gci "C:\Rocketmiles\AMAZON\2016-11-28_Errors\PT\Unzipped" -recurse 
foreach( $file in $files){
gc $file.FullName | Select-String -Context 3 -simplematch "CarsolizeService Error while refreshing room type data" | Tee-Object "C:\Rocketmiles\PT_2016-11-28_Errors.txt"
}
write-host "Done gathering Carsolize error lines."

Stop-Transcript
exit;