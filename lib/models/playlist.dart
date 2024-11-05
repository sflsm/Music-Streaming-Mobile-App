import 'package:web/models/song.dart';

class Playlist {
  final String title;
  final String description;
  final List<Song> songs;

  Playlist({
    required this.title,
    required this.description,
    required this.songs,
  });
}
