# Your account access key - must have read access to your S3 Bucket
$accessKey = "AKIAIU7TZEP2Z5XWXILQ"
# Your account secret access key
$secretKey = "ac8YQJycAUE4yCfv79urqCFrGQNABlOpC8tNv2LU"
# The region associated with your bucket e.g. eu-west-1, us-east-1 etc. (see http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-regions)
$region = "us-east-1"
# The name of your S3 Bucket
$bucket = "rocketmiles-provider-logs/PRODUCTION/2016-11-03/"
# The folder in your bucket to copy, including trailing slash. Leave blank to copy the entire bucket

$Sessions = @(CC85CE39D6AFFE014EFF9D9B4E0DF94C-n1,325AA50E5D45048E6EEF3BBBE4297128-n1,46F6A5A690A07C52D5239763E0813D81-n1,53322F0C1CFD663A5AE145539A32DCBE-n1,53193B4D9066A609F5AC5CBF323DF195-n1,33069BB3428A13F245B76FECBB7897D9-n1,D824C1166B514826D428570C5D0E2E43-n1,0F39A0D7F5602DDFC4C9EC1DC46642B6-n1,4993529B6082676C8F6D0FDA682E697F-n1,4993529B6082676C8F6D0FDA682E697F-n1,2876655D9A5EA9C8721E356076544166-n1,758C80697E2572A7261D3044B687431E-n1,B78382787F24623C3B9C46C1991B2570-n1,02A4F486115A0F645C5C5ADC74ED707A-n1,8D6F46ACCAD8AF24AF5C29930ABAA2A5-n1,5C9018E38C46B8170347F597BCFEFE91-n1,1456DE20CA39F31EF1F546CBB8D996B7-n1,5C9018E38C46B8170347F597BCFEFE91-n1,EE019188F1213DB45D8565453D2F5066-n1,8D6F46ACCAD8AF24AF5C29930ABAA2A5-n1,2FE9FFC4AC0EC229606BB6EDCEF6552C-n1,75CAEA013458A7D2B779B7E69C8BD46D-n1,4FEB31D6CFC05C445E8D5CF35FD76573-n1,C07CB364D8101F83D4313EF1E37D0214-n1,09C8C03B0A7962243DDA1A0721302457-n1)

$keyPrefix = "$Session"
# The local file path where files should be copied
$localPath = "C:\Rocketmiles\AMAZON\Amazon_errors_11-2-16"

$objects = Get-S3Object -BucketName $bucket -KeyPrefix $keyPrefix -AccessKey $accessKey -SecretKey $secretKey -Region $region

foreach($object in $objects) {
	$localFileName = $object.Key -replace $keyPrefix, ''
	if ($localFileName -ne '') {
		$localFilePath = Join-Path $localPath $localFileName
		Copy-S3Object -BucketName $bucket -Key $object.Key -LocalFile $localFilePath -AccessKey $accessKey -SecretKey $secretKey -Region $region
	}
}

#
#
#AccessKey: AKIAIU7TZEP2Z5XWXILQ
#SecretKey: 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
#Path: rocketmiles-provider-logs
#
#User Name,Access Key Id,Secret Access Key
#"jim",AKIAIU7TZEP2Z5XWXILQ,ac8YQJycAUE4yCfv79urqCFrGQNABlOpC8tNv2LU
#
#