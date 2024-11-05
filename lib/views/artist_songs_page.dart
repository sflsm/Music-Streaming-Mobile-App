import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/song.dart';
import '../models/artist.dart';
import 'player_page.dart';

class ArtistSongsPage extends StatelessWidget {
  final Artist artist;
  final Function(Song) addToRecentSongs;

  ArtistSongsPage({
    required this.artist,
    required this.addToRecentSongs,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Blurred album art background
          Positioned.fill(
            child: Image.asset(
              artist.songs[0]
                  .albumArt, // Use the first song's album art for the background
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color:
                    Colors.black.withOpacity(0.5), // Semi-transparent overlay
              ),
            ),
          ),
          // Main content
          Column(
            children: [
              // AppBar with back and search buttons
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Implement search functionality if needed
                    },
                  ),
                ],
              ),
              // Artist name and album information
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      artist.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Single | 2020', // Replace with actual album or release year
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              // Album Art and Title
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(artist
                              .songs[0].albumArt), // Replace with album art
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Daydream', // Replace with song/album title
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    // Play and Shuffle buttons with increased size
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            icon: Icon(Icons.play_arrow,
                                color: Colors.green, size: 28),
                            label: Text("Play",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            onPressed: () {
                              // Play the song
                            },
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            icon: Icon(Icons.shuffle,
                                color: Colors.green, size: 28),
                            label: Text("Shuffle",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            onPressed: () {
                              // Shuffle songs
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // List of Songs with numbering and album art
              Expanded(
                child: ListView.builder(
                  itemCount: artist.songs.length,
                  itemBuilder: (context, index) {
                    final song = artist.songs[index];
                    final songNumber = (index + 1)
                        .toString()
                        .padLeft(2, '0'); // Format as 01, 02, etc.
                    return ListTile(
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            songNumber,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            song.albumArt,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      title: Text(
                        song.title,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '${song.duration.inMinutes}:${(song.duration.inSeconds % 60).toString().padLeft(2, '0')}', // Format mm:ss
                        style: TextStyle(color: Colors.white70),
                      ),
                      trailing: Icon(
                        Icons.drag_handle, // Two-line icon
                        color: Colors.white,
                      ),
                      onTap: () {
                        addToRecentSongs(song);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayerPage(song: song),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
