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
5. Import `whisper-associations.reg` to the registry.
