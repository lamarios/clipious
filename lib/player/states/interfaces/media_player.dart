import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/player/models/media_event.dart';

import '../../../videos/models/video.dart';
import '../../models/media_command.dart';
import '../player.dart';

enum FullScreenState {
  fullScreen,
  notFullScreen,
}

abstract class MediaPlayerCubit<T extends MediaPlayerState> extends Cubit<T> {
  final PlayerCubit player;

  MediaPlayerCubit(super.initialState, this.player);

  void disposeControllers();

  void switchVideo(Video video, {Duration? startAt});

  void togglePlaying();

  void toggleControls(bool visible);

  double getAspectRatio();

  @mustCallSuper
  void playVideo(bool offline) {
    var duration = Duration(seconds: state.offlineVideo?.lengthSeconds ?? state.video?.lengthSeconds ?? 1);
    player
        .setEvent(MediaEvent<Duration>(state: MediaState.ready, type: MediaEventType.durationChanged, value: duration));
    player.setEvent(
        MediaEvent<double>(state: MediaState.ready, type: MediaEventType.aspectRatioChanged, value: getAspectRatio()));
  }

  void switchToOfflineVideo(DownloadedVideo v);

  bool isPlaying();

  void handleCommand(MediaCommand command) {
    switch (command.type) {
      case MediaCommandType.speed:
        setSpeed(command.value);
        player.setEvent(MediaEvent(state: MediaState.playing, type: MediaEventType.speedChanged, value: command.value));
        break;
      case MediaCommandType.switchVideo:
        SwitchVideoValue val = command.value;
        switchVideo(val.video, startAt: val.startAt);
        break;
      case MediaCommandType.switchToOfflineVideo:
        DownloadedVideo offlineVideo = command.value;
        switchToOfflineVideo(offlineVideo);
        break;
      case MediaCommandType.play:
        play();
        player.setEvent(const MediaEvent(state: MediaState.playing, type: MediaEventType.play));
        break;
      case MediaCommandType.pause:
        pause();
        player.setEvent(const MediaEvent(state: MediaState.playing, type: MediaEventType.pause));
        break;
      case MediaCommandType.mute:
        toggleVolume(false);
        player.setEvent(const MediaEvent(state: MediaState.playing, type: MediaEventType.volumeChanged, value: false));
        break;
      case MediaCommandType.unmute:
        toggleVolume(true);
        player.setEvent(const MediaEvent(state: MediaState.playing, type: MediaEventType.volumeChanged, value: true));
        break;
      case MediaCommandType.seek:
        seek(command.value);
        player.setEvent(MediaEvent(state: MediaState.playing, type: MediaEventType.seek, value: command.value));
        break;
      case MediaCommandType.enterFullScreen:
        onEnterFullScreen();
        break;
      case MediaCommandType.exitFullScreen:
        onExitFullScreen();
        break;
    }
  }

  void play();

  void pause();

  void seek(Duration position);

  Duration position();

  Duration? bufferedPosition();

  double? speed();

  List<String> getVideoTracks();

  List<String> getAudioTracks();

  List<String> getSubtitles();

  int selectedVideoTrack();

  int selectedAudioTrack();

  int selectedSubtitle();

  selectVideoTrack(int index);

  selectAudioTrack(int index);

  selectSubtitle(int index);

  bool isMuted();

  void toggleVolume(bool soundOn);

  void setSpeed(double d);

  double getSpeed();

  bool hasDashToggle();

  bool isUsingDash();

  void toggleDash();

  Duration duration();

  void onEnterFullScreen() {}

  void onExitFullScreen() {}
}

abstract class MediaPlayerState {
  Video? video;
  DownloadedVideo? offlineVideo;
  bool? playNow;
  bool? disableControls;

  MediaPlayerState({this.video, this.offlineVideo, this.playNow, this.disableControls});
}
