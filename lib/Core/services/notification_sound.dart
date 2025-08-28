import 'package:audioplayers/audioplayers.dart';
import 'package:visit_syria/Core/utils/assets.dart';

class NotificationSound {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> play() async {
    await _player.play(AssetSource(Assets.soundNotify));
  }
}
