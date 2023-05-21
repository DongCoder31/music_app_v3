import 'package:audioplayers/audioplayers.dart';
import '../../base/base_viewmodel.dart';

enum PlayerState { stopped, playing, paused, STOPPED }

class AudioProvider extends BaseViewModel {
  late AudioPlayer _audioPlayer;
  late AudioCache _audioCache;
  PlayerState _audioPlayerState = PlayerState.stopped;
  Duration _duration = const Duration();
  Duration _position = const Duration();

  AudioProvider() {
    _audioPlayer = AudioPlayer();
    _audioCache = AudioCache(
      prefix: 'audio/',
      fixedPlayer: _audioPlayer..setReleaseMode(ReleaseMode.STOP),
    );
    _audioPlayer.onDurationChanged.listen((Duration d) {
      _duration = d;
      notifyListeners();
    });
    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      _position = p;
      notifyListeners();
    });
    _audioPlayer.onPlayerStateChanged.listen((playerState) {
      if (playerState == PlayerState.STOPPED) {
        _audioPlayerState = PlayerState.stopped;
      }
      notifyListeners();
    });
  }

  PlayerState get audioPlayerState => _audioPlayerState;

  Duration get position => _position;

  int get totalDurationInSeconds => _duration.inSeconds;

  Future<void> playPause(String x) async {
    if (_audioPlayerState == PlayerState.playing) {
      await _audioPlayer.stop();
      _audioPlayerState = PlayerState.paused;
      notifyListeners();
    } else {
      await _audioCache.play(x);
      _audioPlayerState = PlayerState.playing;
      notifyListeners();
    }
  }

  void seek(Duration duration) {
    _audioPlayer.seek(duration);
  }

  void stop() async {
    await _audioPlayer.stop();
    _audioPlayerState = PlayerState.paused;
    notifyListeners();
  }

  void resum() async {
    await _audioPlayer.resume();
    _audioPlayerState = PlayerState.playing;
  }

  void pause() async {
    await _audioPlayer.pause();
    _audioPlayerState = PlayerState.paused;
  }

  @override
  void dispose() {
    _audioPlayer.release();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    AudioProvider();
  }
}
