import 'package:flutter/material.dart';
import '../models/song.dart';

class MiniPlayer extends StatelessWidget {
  final Song song;
  final VoidCallback onTap;

  MiniPlayer({required this.song, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        color: Colors.black87,
        height: 60.0,
        child: Row(
          children: [
            Image.asset(song.albumArt,
                width: 50, height: 50, fit: BoxFit.cover),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(song.title,
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  Text(song.artist,
                      style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.skip_previous, color: Colors.white),
              onPressed: () {
                // Implement previous functionality here
              },
            ),
            IconButton(
              icon: Icon(Icons.pause, color: Colors.white),
              onPressed: () {
                // Implement pause functionality here
              },
            ),
            IconButton(
              icon: Icon(Icons.skip_next, color: Colors.white),
              onPressed: () {
                // Implement skip functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
