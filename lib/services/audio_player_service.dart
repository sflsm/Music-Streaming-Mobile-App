import 'package:audioplayers/audioplayers.dart';

class AudioPlayerService {
  static final AudioPlayerService _instance = AudioPlayerService._internal();
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool isPlaying = false;
  Duration currentPosition = Duration.zero;

  factory AudioPlayerService() {
    return _instance;
  }

  AudioPlayerService._internal() {
    _audioPlayer.onAudioPositionChanged.listen((position) {
      currentPosition = position;
    });

    _audioPlayer.onPlayerCompletion.listen((event) {
      isPlaying = false;
    });
  }

  Future<void> play(String url) async {
    await _audioPlayer.setUrl(url);
    await _audioPlayer.resume();
    isPlaying = true;
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
    isPlaying = false;
  }

  Future<void> resume() async {
    await _audioPlayer.resume();
    isPlaying = true;
  }

  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
    currentPosition = position;
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
