import 'package:flutter/material.dart';
import '../models/playlist.dart';
import '../services/music_service.dart';

class HomeViewModel extends ChangeNotifier {
  List<Playlist> playlists = [];

  HomeViewModel() {
    _loadPlaylists();
  }

  void _loadPlaylists() {
    playlists = MusicService.getPlaylists(); // Mengambil data playlist dari service
    notifyListeners();
  }
}
