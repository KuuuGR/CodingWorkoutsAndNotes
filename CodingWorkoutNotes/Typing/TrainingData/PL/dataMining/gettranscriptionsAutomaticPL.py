from youtube_transcript_api import YouTubeTranscriptApi
import re

def extract_transcriptions(input_file, output_file):
    with open(input_file, 'r', encoding='utf-8') as file:
        video_urls = file.readlines()

    video_count = len(video_urls)
    print(f"Total videos to process: {video_count}")

    with open(output_file, 'w', encoding='utf-8') as out_file:
        for index, url in enumerate(video_urls, start=1):
            url = url.strip()  # Remove any leading/trailing whitespace
            video_id = re.search('(?:v=|\/)([0-9A-Za-z_-]{11}).*', url).group(1)
            print(f"Processing video {index} of {video_count}: {video_id}")
            try: 
                transcript = YouTubeTranscriptApi.get_transcript(video_id, languages=['pl'])
    # Convert transcript list to a plain text string
                transcription_text = '\n'.join([item['text'] for item in transcript])
                out_file.write(f"URL: {url}\nTranscription:\n{transcription_text}\n\n")
            except Exception as e:
                print(f"Failed to process {url}: {e}")
                out_file.write(f"URL: {url}\nTranscription:\nNo transcription available.\n\n")
"""  english
            try:
                transcript = YouTubeTranscriptApi.get_transcript(video_id)
                # Convert transcript list to a plain text string
                transcription_text = '\n'.join([item['text'] for item in transcript])
                out_file.write(f"URL: {url}\nTranscription:\n{transcription_text}\n\n")
            except Exception as e:
                print(f"Failed to process {url}: {e}")
                out_file.write(f"URL: {url}\nTranscription:\nNo transcription available.\n\n")
                continue
"""
if __name__ == "__main__":
    input_file = 'movies.txt'
    output_file = 'transcriptions.txt'
    extract_transcriptions(input_file, output_file)
