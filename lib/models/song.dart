class Song {
  final String title;
  final String artist;
  final String albumArt;
  final String leftImage; // New property for the left image
  final Duration duration;
  final String audioFile;

  Song({
    required this.title,
    required this.artist,
    required this.albumArt,
    required this.leftImage, // Include the new property in the constructor
    required this.duration,
    required this.audioFile,
  });
}
