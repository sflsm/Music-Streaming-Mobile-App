import 'package:flutter/material.dart';

class UpcomingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.music_note, color: Colors.white, size: 28),
            onPressed: () {
              // Music icon functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.list, color: Colors.white, size: 28),
            onPressed: () {
              // List icon functionality
            },
          ),
          SizedBox(width: 8),
        ],
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_blur.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/album_art_main.png'),
                      radius: 30,
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Loneliness",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Putri Ariani",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Upcoming Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Playing from Interest",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon:
                              Icon(Icons.repeat, color: Colors.white, size: 28),
                          onPressed: () {
                            // Repeat functionality
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.shuffle,
                              color: Colors.green, size: 28),
                          onPressed: () {
                            // Shuffle functionality
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 144, 143, 143)
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      children: [
                        _buildSongItem(
                          context,
                          "Whispering Embers",
                          "Luna Nova",
                          'assets/album_art1.png',
                        ),
                        _buildSongItem(
                          context,
                          "Serenade of Solitude",
                          "Pluto",
                          'assets/album_art2.png',
                        ),
                        _buildSongItem(
                          context,
                          "Dancing in Moonlight",
                          "ABCD",
                          'assets/album_art3.png',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Playback Controls
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.skip_previous,
                              color: Colors.white, size: 60),
                          onPressed: () {
                            // Previous song
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.play_arrow,
                              color: Colors.white, size: 64),
                          onPressed: () {
                            // Play or pause
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.skip_next,
                              color: Colors.white, size: 60),
                          onPressed: () {
                            // Next song
                          },
                        ),
                      ],
                    ),
                    Slider(
                      value: 0.17, // Current playback position
                      onChanged: (value) {
                        // Update playback position
                      },
                      activeColor: Colors.green,
                      inactiveColor: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("0:17", style: TextStyle(color: Colors.white70)),
                        Text("3:13", style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.devices, color: Colors.green, size: 28),
                  Icon(Icons.download_outlined, color: Colors.white, size: 28),
                  Icon(Icons.music_note, color: Colors.white, size: 28),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSongItem(
      BuildContext context, String title, String artist, String albumArt) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child:
                Image.asset(albumArt, width: 50, height: 50, fit: BoxFit.cover),
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          subtitle: Text(
            artist,
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          trailing: Icon(Icons.menu, color: Colors.white),
          onTap: () {
            // Handle tap event if necessary
          },
        ),
      ),
    );
  }
}
