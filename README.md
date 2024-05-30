# whisper-context-suite

This project uses [whisper standalone](https://github.com/Purfview/whisper-standalone-win), [simon/llm](https://github.com/simonw/llm) and [simonw/llm](https://github.com/simonw/llm-gpt4all) to allow you to transcribe, translate, and summarize audio content. Using registry keys and the `summarize.ps1` powershell script you can add commands to the context menu in windows to analize files.

## Usage

Once faster-whisper and llm are installed, the powershell script in place, and the Registry keys are added you can right click on a file and under `Show More Options` you should see the whisper options.

This 

## Installation

1. Install Python
2. Install faster-whisper
	1. Download from [Releases · Purfview/whisper-standalone-win (github.com)](https://github.com/Purfview/whisper-standalone-win/releases)
	2. Extract using 7zip, not Windows. Extract Faster-Whisper-XXL to `C:\Program Files\Faster-Whisper-XXL`
3. Install llm
    1. In admin cmd `pip install llm`
	2. In admin cmd  `llm install llm-gpt4all`
4. Add `whisper-summarize.ps1` to `C:\Program Files\Faster-Whisper-XXL`

## Add Whisper to the Context Menu
Create the in the following keys
- `Computer\HKEY_CLASSES_ROOT\SystemFileAssociations\.m4a\`
- `Computer\HKEY_CLASSES_ROOT\SystemFileAssociations\.mp3\`
- `Computer\HKEY_CLASSES_ROOT\SystemFileAssociations\.mp4\`
- `Computer\HKEY_CLASSES_ROOT\SystemFileAssociations\.mpga\`
- `Computer\HKEY_CLASSES_ROOT\SystemFileAssociations\.wav\`
- `Computer\HKEY_CLASSES_ROOT\SystemFileAssociations\.webm\`

1. create `shell` key
2. inside `shell` key create `WhisperSubtitle`
3. Add Whisper Subtitle
	1. Add Key named `WhisperSubtitle`
	2. Set the Default for the Key to `Whisper Subtitle`
	3. Add Key named `command` 
	4. Set the Default for command to `"C:\Program Files\Faster-Whisper-XXL\faster-whisper-xxl.exe" --language English --output_format srt --model large-v2 -o . "%1"`
6. Add Whisper Transcribe
	1. Add Key named `WhisperTranscribe`
	2. Set the Default for the Key to `Whisper Transcribe`
	3. Add Key named `command` 
	4. Set the Default for command to `""C:\Program Files\Faster-Whisper-XXL\faster-whisper-xxl.exe" --language English --output_format text --model large-v2 -o . "%1"`
7. Add Whisper Translate
	1. Add Key named `WhisperTranslate`
	2. Set the Default for the Key to `Whisper Translate`
	3. Add Key named `command` 
	4. Set the Default for command to `"C:\Program Files\Faster-Whisper-XXL\faster-whisper-xxl.exe" --task translate --output_format srt --model large-v2 -o . "%1"`
8. Add Whisper Summarize
	1. Add Key named `WhisperSummarize`
	2. In the Default for the key to `Whisper Summarize`
	3. Add Key named `command` 
	4. Set the Default for command to `powershell -file "C:\Program Files\Faster-Whisper-XXL\summarize.ps1" "%1"`