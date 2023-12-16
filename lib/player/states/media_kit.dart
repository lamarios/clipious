import 'package:easy_debounce/easy_throttle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/player/states/interfaces/media_player.dart';
import 'package:invidious/videos/models/video.dart' as clipious_video;
import 'package:logging/logging.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

import '../models/media_command.dart';
import '../models/media_event.dart';

part 'media_kit.freezed.dart';

class MediaKitCubit extends MediaPlayerCubit<MediaKitState> {
  final log = Logger('media kit');
  final mediaKitPlayer = Player();
  late final controller = VideoController(mediaKitPlayer);

  MediaKitCubit(super.initialState, super.player) {
    onInit();
  }

  void onInit() {
    log.fine("Ready, playing video");
    mediaKitPlayer.stream.error.listen((event) {
      log.fine(event);
    });
    mediaKitPlayer.stream.playing.listen(onPlayingChanged);
    mediaKitPlayer.stream.position.listen(onPositionChanged);
    mediaKitPlayer.stream.volume.listen(onVolumeChanged);
    mediaKitPlayer.stream.rate.listen(onRateChanged);
    mediaKitPlayer.stream.buffering.listen(onBuffring);
    mediaKitPlayer.stream.completed.listen(onCompleted);
    playVideo(state.offlineVideo != null, startAt: state.startAt);
  }

  @override
  Future<void> playVideo(bool offline, {Duration? startAt}) async {
    final Future<Duration> duration = mediaKitPlayer.stream.duration.first;
    await mediaKitPlayer.open(Media(state.video!.dashUrl));
    // wait for everything to be ready before doing anything else
    await duration;

    if (startAt != null) {
      seek(startAt);
    }
    super.playVideo(offline);
  }

  @override
  Duration? bufferedPosition() {
    return mediaKitPlayer.state.buffer;
  }

  @override
  void disposeControllers() {
    mediaKitPlayer.dispose();
  }

  @override
  Duration duration() {
    return mediaKitPlayer.state.duration;
  }

  @override
  double getAspectRatio() {
    // TODO: implement getAspectRatio
    return 16 / 9;
  }

  @override
  List<String> getAudioTracks() {
    return [];
  }

  @override
  double getSpeed() {
    return mediaKitPlayer.state.rate;
  }

  @override
  List<String> getSubtitles() {
    // TODO: implement getSubtitles
    return [];
  }

  String videoTrackToString(VideoTrack track) {
    return '${track.h}${track.fps != null ? ' - (${track.fps!.ceil()}fps)' : ''}';
  }

  @override
  List<String> getVideoTracks() {
    var list = mediaKitPlayer.state.tracks.video
        .where((element) => element.h != null)
        .map(videoTrackToString)
        .toList();
    return list;
  }

  @override
  bool hasDashToggle() {
    // TODO: implement hasDashToggle
    return false;
  }

  @override
  bool isMuted() {
    return mediaKitPlayer.state.volume == 0;
  }

  @override
  bool isPlaying() {
    return mediaKitPlayer.state.playing;
  }

  @override
  bool isUsingDash() {
    // TODO: implement isUsingDash
    return true;
  }

  @override
  void pause() {
    mediaKitPlayer.pause();
  }

  @override
  void play() {
    mediaKitPlayer.play();
  }

  @override
  Duration position() {
    return mediaKitPlayer.state.position;
  }

  @override
  void seek(Duration position) {
    mediaKitPlayer.seek(position);
  }

  @override
  selectAudioTrack(int index) {
    // TODO: implement selectAudioTrack
    throw UnimplementedError();
  }

  @override
  selectSubtitle(int index) {
    // TODO: implement selectSubtitle
    throw UnimplementedError();
  }

  @override
  selectVideoTrack(int index) {
    // TODO: implement selectVideoTrack
    throw UnimplementedError();
  }

  @override
  int selectedAudioTrack() {
    // TODO: implement selectedAudioTrack
    throw UnimplementedError();
  }

  @override
  int selectedSubtitle() {
    // TODO: implement selectedSubtitle
    throw UnimplementedError();
  }

  @override
  int selectedVideoTrack() {
    // TODO: implement selectedVideoTrack
    return mediaKitPlayer.state.tracks.video
        .map(videoTrackToString)
        .toList()
        .indexOf(videoTrackToString(mediaKitPlayer.state.track.video));
  }

  @override
  void setSpeed(double d) {
    mediaKitPlayer.setRate(d);
  }

  @override
  double? speed() {
    return mediaKitPlayer.state.rate;
  }

  @override
  void switchToOfflineVideo(DownloadedVideo v) {
    // TODO: implement switchToOfflineVideo
  }

  @override
  void switchVideo(clipious_video.Video video, {Duration? startAt}) {
    // TODO: implement switchVideo
  }

  @override
  void toggleControls(bool visible) {
    // TODO: implement toggleControls
  }

  @override
  void toggleDash() {
    // TODO: implement toggleDash
  }

  @override
  void togglePlaying() {
    mediaKitPlayer.playOrPause();
  }

  @override
  void toggleVolume(bool soundOn) {
    mediaKitPlayer.setVolume(soundOn ? 100 : 0);
  }

  void onPlayingChanged(bool event) {
    player.setEvent(MediaEvent(
        state: MediaState.playing,
        type: event ? MediaEventType.play : MediaEventType.pause));
  }

  void onPositionChanged(Duration event) {
    EasyThrottle.throttle('video-player-progress', const Duration(seconds: 1),
        () {
      player.setEvent(MediaEvent(
          state: MediaState.playing,
          type: MediaEventType.progress,
          value: mediaKitPlayer.state.position));
    });
  }

  void onVolumeChanged(double event) {
    player.setEvent(MediaEvent(
        state: MediaState.playing,
        type: MediaEventType.volumeChanged,
        value: event));
  }

  void onRateChanged(double event) {
    player.setEvent(MediaEvent(
        state: MediaState.playing,
        type: MediaEventType.speedChanged,
        value: event));
  }

  void onBuffring(bool event) {
    player.setEvent(const MediaEvent(state: MediaState.buffering));
  }

  void onCompleted(bool event) {
    player.setEvent(const MediaEvent(state: MediaState.completed));
  }
}

@freezed
class MediaKitState extends MediaPlayerState with _$MediaKitState {
  const factory MediaKitState(Duration? startAt) = _MediaKitState;

  const MediaKitState._();
  // MediaKitState({super.video, super.offlineVideo, super.playNow, super.disableControls, this.startAt});
}
