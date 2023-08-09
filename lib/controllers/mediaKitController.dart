import 'package:invidious/models/db/downloadedVideo.dart';

import 'package:invidious/models/video.dart' as videoModel;
import 'package:logging/logging.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:wakelock/wakelock.dart';

import '../database.dart';
import '../globals.dart';
import '../models/baseVideo.dart';
import 'interfaces/playerController.dart';
import 'miniPayerController.dart';

class MediaKitPlayerController extends PlayerController {
  Player? player;
  VideoController? controller;
  Duration? startAt;
  bool useDash = db.getSettings(USE_DASH)?.value == 'true';

  final log = Logger('MediaKitPlayerController');

  MediaKitPlayerController({videoModel.Video? video, DownloadedVideo? offlineVideo, bool? disableControls, this.startAt})
      : super(video: video, offlineVideo: offlineVideo, disableControls: disableControls);

  @override
  Duration? bufferedPosition() {
    // TODO: implement bufferedPosition
    throw UnimplementedError();
  }

  @override
  onReady() async {
    playVideo(offlineVideo != null, startAt: startAt);
  }

  @override
  void disposeControllers() {
    player?.dispose();
  }

  @override
  bool isPlaying() {
    return player?.state.playing ?? false;
  }

  @override
  void pause() {
    player?.pause();
  }

  @override
  void play() {
    player?.play();
  }

  @override
  playVideo(bool offline, {Duration? startAt}) async {
    this.startAt = startAt;
    if (video != null || offlineVideo != null) {
      IdedVideo idedVideo = offline ? offlineVideo! : video!;
      disposeControllers();
      // we get segments if there are any, no need to wait.
      setSponsorBlock();

      if (startAt == null && !offline) {
        double progress = db.getVideoProgress(idedVideo.videoId);
        if (progress > 0 && progress < 0.90) {
          startAt = Duration(seconds: (offline ? offlineVideo!.lengthSeconds : video!.lengthSeconds * progress).floor());
        }
      }

      print('start at $startAt');

      late Media media;
      // getting data sources
      if (offline) {
        String videoPath = await offlineVideo!.mediaPath;
      } else {
        String baseUrl = db.getCurrentlySelectedServer().url;

        Map<String, String> resolutions = {};

        bool isHls = video!.hlsUrl != null;
        String videoUrl = isHls
            ? '${video!.hlsUrl!}${service.useProxy() ? '?local=true' : ''}'
            : useDash
                ? '${video!.dashUrl}${service.useProxy() ? '?local=true' : ''}'
                : video!.formatStreams[video!.formatStreams.length - 1].url;

        log.info('Playing url (dash ${useDash},  hasHls ? ${video!.hlsUrl != null})  ${videoUrl}');

        media = Media(videoUrl);

        String lastSubtitle = '';
        if (db.getSettings(REMEMBER_LAST_SUBTITLE)?.value == 'true') {
          lastSubtitle = db.getSettings(LAST_SUBTITLE)?.value ?? '';
        }
      }

      Wakelock.enable();

      bool lockOrientation = db.getSettings(LOCK_ORIENTATION_FULLSCREEN)?.value == 'true';
      bool fillVideo = db.getSettings(FILL_FULLSCREEN)?.value == 'true';

      player = Player();
      controller = VideoController(player!);
      player?.open(media);
      update();
    }
  }

  @override
  Duration position() {
    return player?.state.position ?? Duration.zero;
    ;
  }

  @override
  void saveProgress(int timeInSeconds) {
    if (video != null) {
      MiniPlayerController.to()?.saveProgress(video!.videoId, video!.lengthSeconds, timeInSeconds);
    }
  }

  @override
  void seek(Duration position) {
    player?.seek(position);
  }

  @override
  void setSponsorBlock() {
    // TODO: implement setSponsorBlock
  }

  @override
  double? speed() {
    return player?.state.rate;
  }

  @override
  void switchToOfflineVideo(DownloadedVideo v) {
    // TODO: implement switchToOfflineVideo
  }

  @override
  void switchVideo(videoModel.Video video, {Duration? startAt}) {
    this.startAt = startAt;
    disposeControllers();
    this.video = video;
    playVideo(false, startAt: startAt);
  }

  @override
  void toggleControls(bool visible) {
    // TODO: implement toggleControls
  }

  @override
  void togglePlaying() {
    player?.playOrPause();
  }
}
