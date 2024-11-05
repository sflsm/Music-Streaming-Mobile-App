import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Tambahkan ini
import '../views/genre_artist_selection_page.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Center(
              child: Column(
                children: [
                  Icon(Icons.music_note, color: Colors.greenAccent, size: 100),
                  SizedBox(height: 16),
                  Text(
                    'Welcome to the World of Music',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.library_music,
                            color: Colors.greenAccent),
                        title: Text(
                          'Discover Limitless Music',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        subtitle: Text(
                          'Dive into a vast collection of songs from various genres, artists, and eras.',
                          style: TextStyle(color: Colors.white60),
                        ),
                      ),
                      ListTile(
                        leading:
                            Icon(Icons.headphones, color: Colors.greenAccent),
                        title: Text(
                          'Personalized Music Experience',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        subtitle: Text(
                          'Our music app puts you at the center of your musical journey.',
                          style: TextStyle(color: Colors.white60),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('onboarding_completed',
                    true); // Set status onboarding selesai

                // Pindah ke halaman GenreArtistSelectionPage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GenreArtistSelectionPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent, // Warna hijau
                padding: EdgeInsets.all(16),
              ),
              child: Text(
                'Next Step',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
