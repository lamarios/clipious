import '../../videos/models/video.dart';

enum MediaCommandType { play, pause, seek, mute, unmute, speed, switchVideo, switchToOfflineVideo }

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
