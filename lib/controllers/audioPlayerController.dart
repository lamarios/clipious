import 'package:easy_debounce/easy_debounce.dart';
import 'package:invidious/controllers/interfaces/playerController.dart';
import 'package:invidious/controllers/miniPlayerProgressController.dart';
import 'package:invidious/controllers/videoInListController.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/utils.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logging/logging.dart';

import '../../models/db/progress.dart' as dbProgress;
import '../models/adaptiveFormat.dart';
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
    int currentPosition = position.inSeconds;
    if (currentPosition > previousSponsorCheck + 1) {
      audioPosition = position;
      if (audioPosition.inMilliseconds > audioLength.inMilliseconds) {
        audioPosition = audioLength;
      }
      saveProgress(currentPosition);
      MiniPlayerProgressController.to()?.setProgress(progress);
      update();
      previousSponsorCheck = currentPosition;
    } else if (currentPosition + 2 < previousSponsorCheck) {
      // if we're more than 2 seconds behind, means we probably seek backward manually far away
      // so we reset the position
      previousSponsorCheck = currentPosition;
    }
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
  void saveProgress(int timeInSeconds) {
    if (video != null) {
      MiniPlayerController.to()?.saveProgress(video!.videoId, video!.lengthSeconds, timeInSeconds);
    }
  }

  @override
  void setSponsorBlock() {
    // TODO: implement setSponsorBlock
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
    // TODO: implement getVideoTracks
    throw UnimplementedError();
  }

  @override
  List<String> getAudioTracks() {
    // TODO: implement getAudioTracks
    throw UnimplementedError();
  }

  @override
  List<String> getSubtitles() {
    // TODO: implement getSubtitles
    throw UnimplementedError();
  }

  @override
  int selectedAudioTrack() {
    // TODO: implement selectedAudioTrack
    throw UnimplementedError();
  }

  @override
  int selectedSubtitle() {
    // TODO: implement selectedSubtitleTrack
    throw UnimplementedError();
  }

  @override
  int selectedVideoTrack() {
    // TODO: implement selectedVideoTrack
    throw UnimplementedError();
  }

  @override
  selectAudioTrack(int index) {
    // TODO: implement selectAudioTrack
    throw UnimplementedError();
  }

  @override
  selectSubtitle(int index) {
    // TODO: implement selectSubtitleTrack
    throw UnimplementedError();
  }

  @override
  selectVideoTrack(int index) {
    // TODO: implement selectVideoTrack
    throw UnimplementedError();
  }

  @override
  bool supportsPip() {
    return false;
  }

  @override
  void enterPip() {
    // TODO: implement enterPip
  }
}
