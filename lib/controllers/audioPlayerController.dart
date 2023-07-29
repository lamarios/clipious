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
    video != null ? playVideo() : playOfflineVideo();
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

  @override
  void playOfflineVideo() {
    // TODO: implement playOfflineVideo
  }

  onStateStreamChange(PlayerState state){
    log.fine('Player state event $state');
    if (state.playing) {

    } else {
      switch (state.processingState) {
      case ProcessingState.idle:
        MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.idle));
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
  }

  onDurationChanged(Duration? duration) async {
    audioLength = duration ?? const Duration(milliseconds: 1);
    loading = false;
    update();
  }

  onPositionChanged(Duration position) {
    int currentPosition = position.inSeconds;
    if (currentPosition > previousSponsorCheck + 1) {
      audioPosition = position;
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
  Future<void> playVideo() async {
    if (video != null) {
      disposeControllers();
      initPlayer();
      loading = true;
      MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.loading));
      AdaptiveFormat? audio = video?.adaptiveFormats.where((element) => element.type.contains("audio")).sortByReversed((e) => int.parse(e.bitrate ?? "0")).first;
      if (audio != null) {
        double progress = db.getVideoProgress(video!.videoId);
        Duration? startAt;
        if (progress > 0 && progress < 0.90) {
          startAt = Duration(seconds: (video!.lengthSeconds * progress).floor());
        }
        update();

        try {
          await player?.setAudioSource(AudioSource.uri(Uri.parse(audio.url)), initialPosition: startAt);
          player?.play();
        } catch (e) {
          log.severe("Couldn't play video", e);
          error = e.toString();
          loading = false;
          update();
        }
      }
    }
    // TODO: implement playVideo
  }

  @override
  void saveProgress(int timeInSeconds) {
    if (playing) {
      int currentPosition = timeInSeconds;
      // saving progress
      int max = audioLength.inSeconds;
      var progress = dbProgress.Progress.named(progress: currentPosition / max, videoId: video!.videoId);
      db.saveProgress(progress);

      VideoInListController.to(progress.videoId)?.updateProgress();
    }
  }

  @override
  void setSponsorBlock() {
    // TODO: implement setSponsorBlock
  }

  @override
  void switchToOfflineVideo(DownloadedVideo v) {}

  @override
  void switchVideo(Video video) async {
    offlineVideo = null;
    audioPosition = Duration.zero;
    audioLength = const Duration(milliseconds: 1);
    this.video = video;
    playVideo();
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
    MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.completed, type: MediaEventType.play));
  }

  @override
  void seek(Duration position) {
    player?.seek(position);
    MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.ready, type: MediaEventType.seek));
  }

  @override
  void pause() {
    player?.pause();
    MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.completed, type: MediaEventType.pause));
  }

  @override
  Duration? bufferedPosition() {
    return null;
  }

  @override
  Duration position() {
    return audioPosition;
  }

  @override
  double? speed() {
    return 1;
  }
}
