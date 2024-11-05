import 'package:flutter/material.dart';
import 'package:web/main.dart';
import 'package:web/views/home_page.dart';

class GenreArtistSelectionPage extends StatefulWidget {
  @override
  _GenreArtistSelectionPageState createState() =>
      _GenreArtistSelectionPageState();
}

class _GenreArtistSelectionPageState extends State<GenreArtistSelectionPage> {
  List<String> selectedGenres = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Choose your genre or artist',
            style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose 3 genre',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      _buildGenreChip('Pop'),
                      _buildGenreChip('Rock'),
                      _buildGenreChip('Alternative'),
                      _buildGenreChip('Hip-hop'),
                      _buildGenreChip('Jazz'),
                      _buildGenreChip('Country'),
                      _buildGenreChip('R&B'),
                      _buildGenreChip('Electronic'),
                      _buildGenreChip('Reggae'),
                      _buildGenreChip('Classical'),
                      _buildGenreChip('Experimental'),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Choose Artist You Might Like',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildArtistAvatar('Sara Mersil', 'assets/sara.jpg'),
                      _buildArtistAvatar('Pranoto S', 'assets/pranoto.jpg'),
                      _buildArtistAvatar('Tompy S', 'assets/tompy.jpg'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildArtistAvatar('Aisha A', 'assets/aisha.jpg'),
                      _buildArtistAvatar('Diana M', 'assets/diana.jpg'),
                      _buildArtistAvatar('Nina K', 'assets/nina.jpg'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildArtistAvatar('Aisha A', 'assets/aisha.jpg'),
                      _buildArtistAvatar('Diana M', 'assets/diana.jpg'),
                      _buildArtistAvatar('Nina K', 'assets/nina.jpg'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  // Navigasi ke MainScreen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenreChip(String genre) {
    final isSelected = selectedGenres.contains(genre);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedGenres.remove(genre);
          } else {
            if (selectedGenres.length < 3) {
              selectedGenres.add(genre);
            }
          }
        });
      },
      child: Chip(
        label: Text(
          genre,
          style: TextStyle(
            color: isSelected ? Colors.greenAccent : Colors.white,
          ),
        ),
        backgroundColor:
            isSelected ? Colors.greenAccent.withOpacity(0.2) : Colors.black,
        shape: StadiumBorder(
          side: BorderSide(
            color: isSelected ? Colors.greenAccent : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildArtistAvatar(String artistName, String assetPath) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(assetPath),
          radius: 50,
        ),
        SizedBox(height: 8),
        Text(artistName, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
