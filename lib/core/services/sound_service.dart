import 'package:audioplayers/audioplayers.dart';
import 'package:find_that_emoji/constants/audio_assets.dart';

class SoundService {
  AudioCache? audioCache;
  AudioCache? loopingCache;
  AudioPlayer? audioPlayer;
  AudioPlayer? backgroundPlayer;

  initAudioCache() {
    audioPlayer = AudioPlayer();
    backgroundPlayer = AudioPlayer();
    audioCache = AudioCache()
      ..load(AudioAssets.BUTTON_SOUNDS)
      ..load(AudioAssets.LIFE_LOST)
      ..load(AudioAssets.NEW_LIFE);
    loopingCache = AudioCache()..load(AudioAssets.GAME_MUSIC);
  }

  playButtonSound() {
    audioPlayer!.play(
      AssetSource(AudioAssets.BUTTON_SOUNDS),
      mode: PlayerMode.lowLatency,
    );
  }

  playWrongAnswer() {
    audioPlayer!
        .play(AssetSource(AudioAssets.LIFE_LOST), mode: PlayerMode.lowLatency);
  }

  playSuccessSound() {
    audioPlayer!
        .play(AssetSource(AudioAssets.NEW_LIFE), mode: PlayerMode.lowLatency);
  }

  playBackgroundMusic() {
    backgroundPlayer!.play(
      AssetSource(AudioAssets.GAME_MUSIC),
      mode: PlayerMode.lowLatency,
    );
  }

  stopBackgroundMusic() {
    backgroundPlayer!.stop();
  }
}
