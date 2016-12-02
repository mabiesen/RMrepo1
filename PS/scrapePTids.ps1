$datetime = get-date -f yyyy-MM-dd_HH-mm;
$logfile = "C:\Rocketmiles\PS\Transcripts\PSTranscript_$datetime.txt";
Start-transcript $logfile -NoClobber;

$file = "C:\Rocketmiles\PT_2016-11-28_SessionIDs.txt"
gc $file | Select-String -pattern "([\d\D]{31,33}-n1)" -AllMatches | %{$_.Matches} | %{$_.Value} > "C:\Rocketmiles\PT_SessionIDs.txt"


write-host "Done gathering double-booking session ID error lines."

Stop-Transcript
exit;
