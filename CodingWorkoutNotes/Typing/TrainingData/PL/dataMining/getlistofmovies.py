import yt_dlp as youtube_dl

def get_channel_videos(channel_url):
    # Configuration for yt_dlp
    ydl_opts = {
        'quiet': True,
        'extract_flat': True,
        'force_generic_extractor': True,
    }

    video_urls = []  # List to store video URLs

    # Create a yt_dlp instance
    with youtube_dl.YoutubeDL(ydl_opts) as ydl:
        # Fetch the info for the channel/playlist
        info_dict = ydl.extract_info(channel_url, download=False)
        
        # Check if 'entries' is in the info_dict
        if 'entries' in info_dict:
            # Iterate through each video in the channel/playlist
            for video in info_dict['entries']:
                # Append the video URL to the list
                video_urls.append(f'https://www.youtube.com/watch?v={video["id"]}')

    # Write the video URLs to a file
    with open("movies.txt", "w", encoding="utf-8") as file:
        for url in video_urls:
            file.write(url + "\n")

    print(f"Saved {len(video_urls)} video URLs to movies.txt")

if __name__ == "__main__":
    # Replace the placeholder URL with your specific YouTube channel URL
    CHANNEL_URL = 'https://www.youtube.com/@7metrowpodziemia/videos'
    get_channel_videos(CHANNEL_URL)
