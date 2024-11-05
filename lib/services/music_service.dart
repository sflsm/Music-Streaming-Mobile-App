import '../models/playlist.dart';
import '../models/song.dart';
import '../models/artist.dart'; // Import kelas Artist

class MusicService {
  // Daftar playlist
  static List<Playlist> getPlaylists() {
    return [
      Playlist(
        title: "Upbeat Song",
        description: "12 Tracks",
        songs: [
          Song(
            title: "Disenchanted",
            artist: "My Chemical Romance",
            albumArt: "assets/dscntd.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 4, seconds: 2),
            audioFile: "assets/mp3/Disenchanted.mp3",
          ),
          Song(
            title: "Lonely Boy",
            artist: "Sex Pistols",
            albumArt: "assets/sxpstl.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 3, seconds: 50),
            audioFile: "assets/mp3/lonely_boy.mp3",
          ),
        ],
      ),
      // Tambahkan playlist lainnya
    ];
  }

  // Daftar trending songs
  static List<Song> trendingSongs = [
    Song(
      title: "Disenchanted",
      artist: "My Chemical Romance",
      albumArt: "assets/dscntd.jpg",
      leftImage: "assets/mcr.jpg",
      duration: Duration(minutes: 4, seconds: 55),
      audioFile: "assets/mp3/Disenchanted.mp3",
    ),
    Song(
      title: "Lonely Boy",
      artist: "Sex Pistols",
      albumArt: "assets/sxpstl.jpg",
      leftImage: "assets/Sex-Pistols.jpg",
      duration: Duration(minutes: 3, seconds: 50),
      audioFile: "assets/mp3/lonely_boy.mp3",
    ),
    Song(
      title: "Malfunction",
      artist: "KILMS",
      albumArt: "assets/kilms.jpg",
      leftImage: "assets/kilmss.jpg",
      duration: Duration(minutes: 3, seconds: 44),
      audioFile: "assets/mp3/malfunction.mp3",
    ),
    Song(
      title: "Main Serong",
      artist: "The Changcuters",
      albumArt: "assets/tcg.jpg",
      leftImage: "assets/chang.jpg",
      duration: Duration(minutes: 4, seconds: 6),
      audioFile: "assets/mp3/main_serong.mp3",
    ),
  ];

  // Daftar popular artists
  static List<Artist> getPopularArtists() {
    return [
      Artist(
        name: "Bob Marley",
        image: "assets/bobmarley.jpg",
        songs: [
          Song(
            title: "No Woman No Cry",
            artist: "Bob Marley",
            albumArt: "assets/bobmarley.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 3, seconds: 36),
            audioFile: "assets/mp3/no_woman_no_cry.mp3",
          ),
          Song(
            title: "One Love",
            artist: "Bob Marley",
            albumArt: "assets/bobmarley.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 2, seconds: 23),
            audioFile: "assets/mp3/one_love.mp3",
          ),
          Song(
            title: "Three Little Bird",
            artist: "Bob Marley",
            albumArt: "assets/bobmarley.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 3, seconds: 1),
            audioFile: "assets/mp3/three_little_bird.mp3",
          ),
          Song(
            title: "Buffalo Soldier",
            artist: "Bob Marley",
            albumArt: "assets/bobmarley.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 4, seconds: 18),
            audioFile: "assets/mp3/buffalo_soldier.mp3",
          ),
        ],
      ),
      Artist(
        name: "Alpha Blondy",
        image: "assets/artist/alphablondy.jpg",
        songs: [
          Song(
            title: "Peace In Liberia",
            artist: "Alpha Blondy",
            albumArt: "assets/artist/alphablondy.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 3, seconds: 46),
            audioFile: "assets/mp3/peace_in_liberia.mp3",
          ),
          Song(
            title: "Jerussalem",
            artist: "Alpha Blondy",
            albumArt: "assets/artist/alphablondy.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 7, seconds: 49),
            audioFile: "assets/mp3/jerussalem.mp3",
          ),
        ],
      ),
      Artist(
        name: "Onadio Leonardo",
        image: "assets/artist/onad.jpg",
        songs: [
          Song(
            title: "Biarlah",
            artist: "Killing Me Inside",
            albumArt: "assets/killims.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 4, seconds: 14),
            audioFile: "assets/mp3/Biarlah.mp3",
          ),
          Song(
            title: "Jangan Pergi",
            artist: "Killing Me Inside",
            albumArt: "assets/killims.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 4, seconds: 20),
            audioFile: "assets/mp3/jangan_pergi.mp3",
          ),
          Song(
            title: "Torment",
            artist: "Killing Me Inside",
            albumArt: "assets/killims.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 4, seconds: 46),
            audioFile: "assets/mp3/Torment.mp3",
          ),
          Song(
            title: "Never Go Back",
            artist: "Killing Me Inside",
            albumArt: "assets/killims.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 4, seconds: 35),
            audioFile: "assets/mp3/never_go_back.mp3",
          ),
          Song(
            title: "For One Last Time",
            artist: "Killing Me Inside",
            albumArt: "assets/killims.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 4, seconds: 48),
            audioFile: "assets/mp3/for_one_last_time.mp3",
          ),
        ],
      ),
      Artist(
        name: "Ariana Grande",
        image: "assets/artist/ariana.jpg",
        songs: [
          Song(
            title: "Side To Side",
            artist: "Ariana Grande",
            albumArt: "assets/artist/ariana.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 3, seconds: 46),
            audioFile: "assets/mp3/side_to_side.mp3",
          ),
        ],
      ),
      Artist(
        name: "Bruno Mars",
        image: "assets/artist/Bruno.jpg",
        songs: [
          Song(
            title: "Grenade",
            artist: "Bruno Mars",
            albumArt: "assets/artist/Bruno.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 3, seconds: 45),
            audioFile: "assets/mp3/grenade.mp3",
          ),
          Song(
            title: "It Will Rain",
            artist: "Bruno Mars",
            albumArt: "assets/artist/Bruno.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 4, seconds: 48),
            audioFile: "assets/mp3/it_will_rain.mp3",
          ),
          Song(
            title: "The Lazy Song",
            artist: "Bruno Mars",
            albumArt: "assets/artist/Bruno.jpg",
            leftImage: "assets/ogg.jpg",
            duration: Duration(minutes: 3, seconds: 19),
            audioFile: "assets/mp3/the_lazy_song.mp3",
          ),
        ],
      ),
    ];
  }
}
