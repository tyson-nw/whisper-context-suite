$basename = (Get-Item $args[0]).Basename
$transcript = "$basename.text"

./faster-whisper-xxl.exe $args[0] --model large-v2 --task transcribe -f text

If( Test-Path $transcript)
{
    Get-Content $transcript | llm -s "Summarize this text" -m mistral-7b-instruct-v0 > $basename-summary.txt
    Rename-Item -Path $transcript -NewName "$basename.txt"
}else
{
    Write-Error "Faster-Whisper-XXL could not transcribe $s."
}

