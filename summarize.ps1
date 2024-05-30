$param = $args[0]

$basename = (Get-Item $param).Basename
$targetpath = (Get-Item $param).DirectoryName
$transcript = "$targetpath$basename.text"
$summary = "$targetpath$basename-summary.txt"

If( !(Test-Path "$basename.txt")){
    & "C:\Program Files\Faster-Whisper-XXL\faster-whisper-xxl.exe" $param --model large-v2 --task transcribe -f text -o $targetpath
}ElseIf(Test-Path "$basename.txt"){
    Rename-Item -Path "$basename.txt" -NewName "$basename.text"
}

If( Test-Path $transcript)
{
    Get-Content $transcript | llm -s "Summarize this text" -m mistral-7b-instruct-v0 -n > $summary
    Rename-Item -Path $transcript -NewName "$basename.txt"
}else
{
    Write-Error "Faster-Whisper-XXL could not transcribe $basename.txt."
}