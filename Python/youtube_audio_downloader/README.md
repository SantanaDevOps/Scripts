# YouTube Audio Downloader and Converter

This Python script allows users to download audio from YouTube videos and convert it to a standardized format.

## Features

- Downloads audio from YouTube videos
- Attempts to download high-quality AAC audio (128kbps)
- Falls back to default audio stream if desired quality is unavailable
- Converts audio to AAC format using pydub or FFmpeg
- Removes problematic characters from filenames

## Requirements

- Python 3.x
- Internet connection

The script will automatically install the following libraries if they're not present:
- pytube
- pydub

FFmpeg is required for fallback conversion method.

## Usage

1. Run the script:
```
python youtube_audio_downloader.py
```

2. When prompted, enter the URL of the YouTube video you want to download audio from.

3. The script will download the audio and convert it to AAC format.

4. The resulting file will be saved in the same directory as the script, with the name format: 
`[Video Title]_converted.m4a`

## Notes

- The script prioritizes 128kbps AAC audio. If unavailable, it will download the default audio stream.
- Conversion is done using pydub when possible, with FFmpeg as a fallback.
- Ensure you have the right to download and use the audio in compliance with YouTube's terms of service.

## Troubleshooting

- If you encounter issues with pytube, try updating it to the latest version:
pip install --upgrade pytube
- Make sure FFmpeg is installed and accessible in your system's PATH for the fallback conversion method.

## Disclaimer

This tool is for personal use only. Respect copyright laws and YouTube's terms of service when using downloaded content.