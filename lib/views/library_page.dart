import 'package:flutter/material.dart';
import '../services/music_service.dart'; // Pastikan untuk mengimpor MusicService
import '../models/playlist.dart';

class LibraryPage extends StatelessWidget {
  final List<Playlist> playlists =
      MusicService.getPlaylists(); // Ambil playlist dari MusicService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Your Library'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          final playlist = playlists[index];
          return _buildPlaylistTile(context, playlist);
        },
      ),
    );
  }

  Widget _buildPlaylistTile(BuildContext context, Playlist playlist) {
    return ListTile(
      leading: Image.asset(
        playlist.songs.first
            .albumArt, // Menampilkan cover lagu pertama di playlist sebagai cover playlist
        width: 50,
        height: 50,
      ),
      title: Text(playlist.title, style: TextStyle(color: Colors.white)),
      subtitle:
          Text(playlist.description, style: TextStyle(color: Colors.white60)),
      trailing: Icon(Icons.arrow_forward, color: Colors.white),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlaylistDetailPage(playlist: playlist)),
        );
      },
    );
  }
}

class PlaylistDetailPage extends StatelessWidget {
  final Playlist playlist;

  PlaylistDetailPage({required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(playlist.title),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: playlist.songs.length,
        itemBuilder: (context, index) {
          final song = playlist.songs[index];
          return ListTile(
            leading: Image.asset(song.albumArt, width: 50, height: 50),
            title: Text(song.title, style: TextStyle(color: Colors.white)),
            subtitle:
                Text(song.artist, style: TextStyle(color: Colors.white60)),
            trailing: Text(
              "${song.duration.inMinutes}:${song.duration.inSeconds.remainder(60).toString().padLeft(2, '0')}",
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
