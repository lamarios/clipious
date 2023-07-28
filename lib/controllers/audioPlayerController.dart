import 'package:audioplayers/audioplayers.dart';
import 'package:invidious/controllers/interfaces/playerController.dart';
import 'package:invidious/controllers/miniPlayerProgressController.dart';
import 'package:invidious/controllers/videoInListController.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';
import '../../models/db/progress.dart' as dbProgress;

import '../models/adaptiveFormat.dart';

class AudioPlayerController extends PlayerController {
  Logger log = Logger('AudioPlayerController');

  static AudioPlayerController? to() => safeGet();
  AudioPlayer player = AudioPlayer();

  AudioPlayerController({Video? video, DownloadedVideo? offlineVideo}) : super(video: video, offlineVideo: offlineVideo);

  double get progress => audioPosition.inMilliseconds / audioLength.inMilliseconds;
  Duration audioLength = const Duration(milliseconds: 1);
  Duration audioPosition = const Duration(milliseconds: 0);
  int previousSponsorCheck = 0;
  bool playing = false;
  bool loading = false;

  @override
  void onClose() {
    disposeControllers();
    super.onClose();
  }

  @override
  void onReady() {
    player.onDurationChanged.listen(onDurationChanged);
    player.onPositionChanged.listen(onPositionChanged);
    player.onPlayerStateChanged.listen(onPlayerStateChanged);
    super.onReady();
  }

  @override
  void disposeControllers() {
    player.dispose();
  }

  @override
  void playOfflineVideo() {
    // TODO: implement playOfflineVideo
  }

  onDurationChanged(Duration duration) async {
    audioLength = duration;
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
  void playVideo() {
    if (video != null) {
      loading = true;
      playing = false;
      AdaptiveFormat? audio = video?.adaptiveFormats.where((element) => element.type.contains("audio")).sortByReversed((e) => int.parse(e.bitrate ?? "0")).first;
      if (audio != null) {
        player.setSourceUrl(audio.url);
      }
      update();
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
    await player.release();
    this.video = video;
    playVideo();
  }

  @override
  void togglePlaying() {
    playing ? player.pause() : player.resume();
    update();
  }

  void onScrubbed(double value) {
    Duration seekTo = Duration(milliseconds: value.toInt());
    player.seek(seekTo);
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

  void onPlayerStateChanged(PlayerState event) {
    log.fine("Player state changed: ${event.name}");
    switch (event.name) {
      case "playing":
        playing = true;
        break;
      case "paused":
        playing = false;
        break;
    }

    update();
  }

  @override
  bool isPlaying() {
    return playing;
  }
}
