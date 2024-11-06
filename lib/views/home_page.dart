import 'package:flutter/material.dart';
import '../services/music_service.dart';
import '../models/song.dart';
import 'player_page.dart';
import 'artist_songs_page.dart';

class HomePage extends StatefulWidget {
  final List<Song> recentSongs;
  final Function(Song) addToRecentSongs;

  HomePage({required this.recentSongs, required this.addToRecentSongs});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _trendingScrollController = ScrollController();
  final ScrollController _artistScrollController = ScrollController();
  final ScrollController _recentSongsScrollController = ScrollController();

  bool _showTrendingArrow = true;
  bool _showArtistArrow = true;
  bool _showRecentArrow = true;

  @override
  void initState() {
    super.initState();

    _trendingScrollController.addListener(() {
      setState(() {
        _showTrendingArrow = _trendingScrollController.position.pixels <
            _trendingScrollController.position.maxScrollExtent;
      });
    });

    _artistScrollController.addListener(() {
      setState(() {
        _showArtistArrow = _artistScrollController.position.pixels <
            _artistScrollController.position.maxScrollExtent;
      });
    });

    _recentSongsScrollController.addListener(() {
      setState(() {
        _showRecentArrow = _recentSongsScrollController.position.pixels <
            _recentSongsScrollController.position.maxScrollExtent;
      });
    });
  }

  void _scrollTrendingRight() {
    _trendingScrollController.animateTo(
      _trendingScrollController.offset + 200.0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollArtistsRight() {
    _artistScrollController.animateTo(
      _artistScrollController.offset + 200.0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRecentSongsRight() {
    _recentSongsScrollController.animateTo(
      _recentSongsScrollController.offset + 200.0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/profile.jpg"),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Epoeeeelll',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      'Enjoy your music',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    print("Search button tapped");
                  },
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert, color: Colors.white),
                  onSelected: (String value) {
                    print(value);
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        value: 'Setting',
                        child: Text('Settings'),
                      ),
                      PopupMenuItem(
                        value: 'Logout',
                        child: Text('Logout'),
                      ),
                    ];
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            "New single + Pre-Side",
            style: TextStyle(
              color: const Color.fromARGB(255, 120, 120, 120),
              fontSize: 11,
            ),
          ),
          _buildSectionTitle('Trending Now',
              onTapArrow: _showTrendingArrow ? _scrollTrendingRight : null),
          SizedBox(height: 12),
          _buildMusicGrid(context, _trendingScrollController),
          SizedBox(height: 20),
          Text(
            "Listen Again",
            style: TextStyle(
              color: const Color.fromARGB(255, 120, 120, 120),
              fontSize: 11,
            ),
          ),
          _buildSectionTitle('Recent Song',
              onTapArrow: _showRecentArrow ? _scrollRecentSongsRight : null),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CategoryButton(
                  label: 'Music',
                  isSelected: true), // isSelected is true for 'Music'
              SizedBox(width: 10),
              CategoryButton(
                  label: 'Podcast',
                  isSelected: false), // isSelected is false for 'Podcast'
              SizedBox(width: 10),
              CategoryButton(
                  label: 'Event',
                  isSelected: false), // isSelected is false for 'Event'
              SizedBox(width: 10),
              CategoryButton(
                  label: 'Artist',
                  isSelected: false), // isSelected is false for 'Artist'
            ],
          ),
          SizedBox(height: 13),
          _buildRecentSongs(_recentSongsScrollController),
          SizedBox(height: 20),
          Text(
            "Listen Again",
            style: TextStyle(
              color: const Color.fromARGB(255, 120, 120, 120),
              fontSize: 11,
            ),
          ),
          _buildSectionTitle('Popular Artist',
              onTapArrow: _showArtistArrow ? _scrollArtistsRight : null),
          SizedBox(height: 12),
          _buildArtistList(context, _artistScrollController),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, {VoidCallback? onTapArrow}) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (onTapArrow != null)
            GestureDetector(
              onTap: onTapArrow,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.greenAccent, width: 1.5),
                ),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.greenAccent,
                  size: 18,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMusicGrid(BuildContext context, ScrollController controller) {
    return Container(
      height: 200, // Adjust the height for a landscape view
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: MusicService.trendingSongs.length,
        itemBuilder: (context, index) {
          final song = MusicService.trendingSongs[index];
          return GestureDetector(
            onTap: () {
              widget.addToRecentSongs(song);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayerPage(song: song),
                ),
              );
            },
            child: Container(
              width: 400, // Wider width for landscape
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      song.leftImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.local_fire_department,
                              color: Colors.orange, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Trending',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              song.albumArt, // Image on the left side
                              width: 40, // Set the size of the image
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 8), // Space between image and text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                song.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                song.artist,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildArtistList(BuildContext context, ScrollController controller) {
    final popularArtists = MusicService.getPopularArtists();

    return Container(
      height: 169,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: popularArtists.length,
        itemBuilder: (context, index) {
          final artist = popularArtists[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArtistSongsPage(
                    artist: artist,
                    addToRecentSongs: widget.addToRecentSongs,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(artist.image),
                  ),
                  SizedBox(height: 8),
                  Text(
                    artist.name,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecentSongs(ScrollController controller) {
    return Container(
      height: 220,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: widget.recentSongs.length,
        itemBuilder: (context, index) {
          final song = widget.recentSongs[index];
          return GestureDetector(
            onTap: () {
              widget.addToRecentSongs(song);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayerPage(song: song),
                ),
              );
            },
            child: Container(
              width: 200,
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      song.albumArt,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            song.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(
                            song.artist,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  CategoryButton({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add your button action here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Colors.green.withOpacity(0.5)
            : Colors.black, // Set background color
        side: BorderSide(
          color: Colors.green, // Set border color
          width: 1, // Set a thinner border width
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 26, vertical: 15), // Increase padding for larger button
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal, // Set font weight to normal
          fontSize: 15, // Maintain the font size
        ),
      ),
    );
  }
}
