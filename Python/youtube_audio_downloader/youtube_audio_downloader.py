import sys
import subprocess
import re

try:
    from pytube import YouTube
except ImportError:
    print("Installing PyTube library...")
    subprocess.check_call([sys.executable, "-m", "pip", "install", "pytube"])
    from pytube import YouTube

try:
    from pydub import AudioSegment
except ImportError:
    print("Installing pydub library...")
    subprocess.check_call([sys.executable, "-m", "pip", "install", "pydub"])
    from pydub import AudioSegment

url = input('Enter the url of the YouTube Video to download the audio: ')
yt = YouTube(url)

# Filter audio streams by desired codec and quality
desired_codec = 'mp4a.40.2'  # AAC audio codec
desired_abr = 128  # Desired audio bitrate in kbps

audio_streams = yt.streams.filter(only_audio=True, audio_codec=desired_codec, abr=str(desired_abr)+'kbps')

if len(audio_streams) > 0:
    # Get the audio stream with the highest bitrate
    audio_stream = audio_streams.order_by('abr').desc().first()
    
    print(f"Downloading audio with {audio_stream.abr} bitrate...")
    # After obtaining the video title (yt.title)
    filename = re.sub(r'[\\/*?:"<>|]', "", yt.title)  # Regular expression to remove problematic characters
    audio_stream.download(filename=filename)
    
    print("Audio downloaded successfully!")
    
    # Recode the audio using pydub
    input_file = filename
    output_file = filename + '_converted.m4a'

    print("Recoding audio...")
    audio = AudioSegment.from_file(input_file, format="mp4")
    audio.export(output_file, format="ipod", codec="aac", bitrate="128k")
    print("Audio successfully recoded!")
    
else:
    print("No se encontró ningún stream de audio con el codec y bitrate deseados.")
    print("Descargando el stream de audio predeterminado...")
    audio_stream = yt.streams.filter(only_audio=True).first()
    filename = re.sub(r'[\\/*?:"<>|]', "", yt.title)  # Regular expression to remove problematic characters
    audio_stream.download(filename=filename)
    
    print("Audio downloaded successfully!")
    
    # Recode the audio using FFmpeg
    input_file = filename
    output_file = filename + '_converted.m4a'
    
    print("Recoding the audio...")
    command = f'ffmpeg -i "{input_file}" -c:a aac -b:a 128k "{output_file}"'
    subprocess.call(command, shell=True)
    print("Audio successfully recoded!")