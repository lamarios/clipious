import 'package:easy_debounce/easy_debounce.dart';
import 'package:invidious/controllers/interfaces/playerController.dart';
import 'package:invidious/controllers/miniPlayerProgressController.dart';
import 'package:invidious/videos/states/video_in_list.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/videos/models/video.dart';
import 'package:invidious/utils.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logging/logging.dart';

import '../videos/models/db/progress.dart' as dbProgress;
import '../videos/models/adaptive_format.dart';
import '../models/mediaEvent.dart';
import 'miniPayerController.dart';

class AudioPlayerController extends PlayerController {
  Logger log = Logger('AudioPlayerController');

  static AudioPlayerController? to() => safeGet();
  AudioPlayer? player;

  AudioPlayerController({Video? video, DownloadedVideo? offlineVideo}) : super(video: video, offlineVideo: offlineVideo);

  double get progress => audioPosition.inMilliseconds / audioLength.inMilliseconds;
  Duration audioLength = const Duration(milliseconds: 1);
  Duration audioPosition = const Duration(milliseconds: 0);
  int previousSponsorCheck = 0;

  bool get playing => player?.playing ?? false;
  bool loading = false;
  String? error;

  @override
  void onClose() {
    disposeControllers();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    initPlayer();
  }

  @override
  onReady() async {
    playVideo(offlineVideo != null);
  }

  @override
  void disposeControllers() {
    player?.dispose();
  }

  initPlayer() {
    player = AudioPlayer();
    player?.playerStateStream.listen(onStateStreamChange);
    player?.positionStream.listen(onPositionChanged);
    player?.durationStream.listen(onDurationChanged);
  }

  onStateStreamChange(PlayerState state) {
    log.fine('Player state event $state');
    switch (state.processingState) {
      case ProcessingState.idle:
        // looks like this is causing issues with the player control notification
        // MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.idle));
        break;
      case ProcessingState.loading:
        MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.loading));
        break;
      case ProcessingState.buffering:
        MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.buffering));
        break;
      case ProcessingState.ready:
        MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.ready));
        break;
      case ProcessingState.completed:
        MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.completed));
        break;
    }
  }

  onDurationChanged(Duration? duration) async {
    loading = false;
    update();
  }

  onPositionChanged(Duration position) {
    audioPosition = position;
    MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.playing, type: MediaEventType.progress));
  }

  @override
  playVideo(bool offline, {Duration? startAt}) async {
    if (video != null || offlineVideo != null) {
      disposeControllers();
      initPlayer();
      audioPosition = Duration.zero;
      audioLength = Duration(seconds: offline ? offlineVideo!.lengthSeconds : video!.lengthSeconds);
      loading = true;
      MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.loading));
      try {
        AudioSource? source;

        if (!offline) {
          AdaptiveFormat? audio = video?.adaptiveFormats.where((element) => element.type.contains("audio")).sortByReversed((e) => int.parse(e.bitrate ?? "0")).first;
          if (audio != null) {
            if (startAt == null) {
              double progress = db.getVideoProgress(video!.videoId);
              if (progress > 0 && progress < 0.90) {
                startAt = Duration(seconds: (video!.lengthSeconds * progress).floor());
              }
            }
            update();
            source = AudioSource.uri(Uri.parse(audio.url));
          }
        } else {
          String path = await offlineVideo!.mediaPath;
          source = AudioSource.file(path);
        }

        if (source == null) {
          throw Error();
        }

        player?.setAudioSource(source, initialPosition: startAt);
        player?.play();
      } catch (e) {
        log.severe("Couldn't play video", e);
        error = e.toString();
        loading = false;
        update();
      }
    }
  }

  @override
  void switchToOfflineVideo(DownloadedVideo v) {
    video = null;
    offlineVideo = v;
    playVideo(true);
  }

  @override
  void switchVideo(Video video, {Duration? startAt}) async {
    offlineVideo = null;
    this.video = video;
    playVideo(false, startAt: startAt);
  }

  @override
  void togglePlaying() {
    playing ? play() : pause();
    update();
  }

  void onScrubbed(double value) {
    Duration seekTo = Duration(milliseconds: value.toInt());
    seek(seekTo);
    audioPosition = seekTo;
    update();
  }

  void onScrubDrag(double value) {
    Duration seekTo = Duration(milliseconds: value.toInt());
    audioPosition = seekTo;
    update();
  }

  @override
  void toggleControls(bool visible) {
    disableControls = !visible;
    update();
  }

  @override
  bool isPlaying() {
    return playing;
  }

  @override
  void play() {
    player?.play();
    MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.ready, type: MediaEventType.play));
  }

  @override
  void seek(Duration position) {
    player?.seek(position);
    MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.ready, type: MediaEventType.seek));
  }

  @override
  void pause() {
    player?.pause();
    MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.ready, type: MediaEventType.pause));
  }

  @override
  Duration? bufferedPosition() {
    return player?.bufferedPosition;
  }

  @override
  Duration position() {
    return audioPosition;
  }

  @override
  double? speed() {
    return 1;
  }

  @override
  FullScreenState isFullScreen() {
    return FullScreenState.unsupported;
  }

  @override
  setFullScreen(bool bool) {
    throw UnimplementedError();
  }

  @override
  List<String> getVideoTracks() {
    return [];
  }

  @override
  List<String> getAudioTracks() {
    return [];
  }

  @override
  List<String> getSubtitles() {
    return [];
  }

  @override
  int selectedAudioTrack() {
    return 0;
  }

  @override
  int selectedSubtitle() {
    return 0;
  }

  @override
  int selectedVideoTrack() {
    return 0;
  }

  @override
  selectAudioTrack(int index) {
    return 0;
  }

  @override
  selectSubtitle(int index) {}

  @override
  selectVideoTrack(int index) {}

  @override
  bool supportsPip() {
    return false;
  }

  @override
  void enterPip() {}

  @override
  bool isMuted() {
    return (player?.volume ?? 0) == 0;
  }

  @override
  void toggleVolume(bool soundOn) {
    player?.setVolume(soundOn ? 1 : 0);
  }

  @override
  void setSpeed(double d) {
    player?.setSpeed(d);
  }

  @override
  double getSpeed() {
    return player?.speed ?? 1;
  }

  @override
  bool hasDashToggle() {
    return false;
  }

  @override
  void toggleDash() {
    // TODO: implement toggleDash
  }

  @override
  bool isUsingDash() {
    // TODO: implement isUsingDash
    throw UnimplementedError();
  }

  @override
  Duration duration() {
    return player?.duration ?? const Duration(milliseconds: 1);
  }
}
