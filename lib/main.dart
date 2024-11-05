import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'views/home_page.dart';
import 'views/library_page.dart';
import 'views/explore_page.dart';
import 'views/search_page.dart';
import 'views/onboarding_screen.dart';
import 'models/song.dart';
import 'views/player_page.dart'; // Import PlayerPage
import 'views/mini_player.dart'; // Import MiniPlayer

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData.dark(),
      home: FutureBuilder<bool>(
        future: _checkOnboardingStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return snapshot.data == true ? MainScreen() : OnboardingScreen();
          }
        },
      ),
    );
  }

  Future<bool> _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_completed') ?? false;
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Song> recentSongs = [];
  Song? _currentSong; // Define the _currentSong variable

  final List<Widget> _pages = [
    HomePage(
      recentSongs: [],
      addToRecentSongs: (Song song) {},
    ),
    ExplorePage(),
    LibraryPage(),
    SearchPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addToRecentSongs(Song song) {
    setState(() {
      _currentSong = song; // Set the current song
      if (!recentSongs.contains(song)) {
        recentSongs.insert(0, song);
        if (recentSongs.length > 4) recentSongs.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _pages[0] = HomePage(
      recentSongs: recentSongs,
      addToRecentSongs: _addToRecentSongs,
    );

    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedIndex],
          if (_currentSong != null)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: MiniPlayer(
                song: _currentSong!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayerPage(song: _currentSong!),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note), label: 'Browse'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
