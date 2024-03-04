
 There are several steps to easily obtain Polish text data from YouTube:
 1. Conduct a search on YouTube for content that is typically in the Polish language, ensuring the data pool is large enough. For instance, use terms like 'wywiad z' or 'rozmowa z'. An example URL might look like this, note the 'pl' indicating Polish language content:
```SQL
 https://www.youtube.com/results?search_query=wywiad++z+rozmowa=pl 
```
	YouTube will convert this to that form:
```Sql
https://www.youtube.com/results?search_query=wywiad++z+rozmowa%3Dpl
```
3. In your Python script (link here), paste the above address and run the script.
5. Once the script completes, it will return information about the number of addresses obtained and create a file named 'movies.txt'.
7. Use a second script designed to search for Polish content transcriptions. It will go through the addresses from 'movies.txt' and download the full transcriptions, storing them in 'transcriptions.txt'.
9. It's helpful to open the following in VSCode: the first script, the second script, 'movies.txt', and 'transcriptions.txt'. This setup facilitates easy management of the files.
10.  In the 'transcriptions.txt' file, use the find option for 'URL: https://' as a quick way to navigate between various addresses. If the following lines state: 'Transcription: No transcription available.', skip this address. Focus only on the addresses that have transcriptions.
11. You can use a Regex pattern to filter out these irrelevant addresses:```
 ```Search
 URL:\s(https?://(?:www\.)?youtube\.com/watch\?v=[\w-]+)\nTranscription:\nNo transcription available\.
```
12. Upon finding an address with a transcription, visit the URL to review the channel's videos. Then, copy this address to download the entire channel's transcriptions, starting from the point where you add the address to the script (step 2). Remember to rename 'transcriptions.txt' and 'movies.txt' to new names like 'transcription1.txt' and 'movies2.txt' to avoid overwriting the files. This is crucial, especially for 'transcription1.txt', to discover new Polish channels with transcriptions.


---

Scripts are located in this folder and are structured as follows:

Script 1
```Python
#file: getlistofmovies.py

# Write the video URLs to a file
with open("movies.txt", "w", encoding="utf-8") as file:
for url in video_urls:
file.write(url + "\n")

print(f"Saved {len(video_urls)} video URLs to movies.txt")

if __name__ == "__main__":
# Replace the placeholder URL with your specific YouTube channel URL
CHANNEL_URL = 'https://www.youtube.com/@7metrowpodziemia/videos'
get_channel_videos(CHANNEL_URL)
```

change: 'https://www.youtube.com/@7metrowpodziemia/videos' for address for YouTube channel of your choice

Script 2
```Python
#file:  gettranscriptionsAutomaticPL.py

from youtube_transcript_api import YouTubeTranscriptApi
import re

def extract_transcriptions(input_file, output_file):
	with open(input_file, 'r', encoding='utf-8') as file:
		video_urls = file.readlines()

	video_count = len(video_urls)
	print(f"Total videos to process: {video_count}")

	with open(output_file, 'w', encoding='utf-8') as out_file:
		for index, url in enumerate(video_urls, start=1):
			url = url.strip() # Remove any leading/trailing whitespace
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

if __name__ == "__main__":
	input_file = 'movies.txt'
	output_file = 'transcriptions.txt'
	extract_transcriptions(input_file, output_file)
```



