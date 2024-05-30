$param = $args[0]



$basename = (Get-Item $param).Basename
$targetpath = (Get-Item $param).DirectoryName
$transcript = "$targetpath$basename.text"
$summary = "$targetpath$basename-summary.txt"
write-host $basename 
write-host $targetpath 
write-host $transcript 
write-host $summary 


& "C:\Program Files\Faster-Whisper-XXL\faster-whisper-xxl.exe" $param --model large-v2 --task transcribe -f text -o $targetpath

If( Test-Path $transcript)
{
    Get-Content $transcript | llm -s "Summarize this text" -m mistral-7b-instruct-v0 > $summary
    Rename-Item -Path $transcript -NewName "$basename.txt"
}else
{
    Write-Error "Faster-Whisper-XXL could not transcribe $s."
}

Read-Host -Prompt "Press Enter to exit"