import 'song.dart';

class Artist {
  final String name;
  final String image;
  final List<Song> songs;

  Artist({
    required this.name,
    required this.image,
    this.songs = const [],
  });
}
