import '../../videos/models/video.dart';

enum MediaCommandType {
  play,
  pause,
  seek,
  mute,
  unmute,
  speed,
  switchVideo,
  switchToOfflineVideo,
  // those are more to let the player know if they need to do anything when the full screen status changes
  enterFullScreen,
  exitFullScreen
}

class MediaCommand<T> {
  MediaCommandType type;
  T? value;

  MediaCommand(this.type, {this.value});
}

class SwitchVideoValue {
  Video video;
  Duration? startAt;

  SwitchVideoValue({required this.video, this.startAt});
}
