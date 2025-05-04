# Video Transcoder for DaVinci Resolve

This Bash script batch transcodes video files in a folder into a format that is reliably supported by DaVinci Resolve. This script converts them into .mov files using MJPEG for video and PCM for audio, ensuring better compatibility during editing.

## Requirements
- FFmpeg must be installed and accessible in your system's PATH.

## Usage

```
./transcode.sh [input_folder] [extensions]
```
- __input_folder__: (optional) Path to the folder containing video files. Defaults to the current directory.
- __extensions__: (optional) Comma-separated list of file extensions to transcode (default: mp4,mov).

## Notes

- Transcoded files may be larger in size but are optimized for smooth playback and editing in DaVinci Resolve.

- Original files remain untouched.

## License

MIT License