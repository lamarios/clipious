import 'dart:io';

import 'package:dio/dio.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:invidious/models/video.dart' as videoModel;
import 'package:logging/logging.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wakelock/wakelock.dart';

import '../database.dart';
import '../globals.dart';
import '../models/baseVideo.dart';
import '../utils.dart';
import 'interfaces/playerController.dart';
import 'miniPayerController.dart';

class MediaKitPlayerController extends PlayerController {
  static MediaKitPlayerController? to() => safeGet();

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

  setListeners() {
    player?.stream.tracks.listen((event) {
      print('Tracks: ${event.video.length}');
    });
    player?.stream.buffering.listen((event) {
      print('buffering $event');
    });
    player?.stream.error.listen((event) {
      print('error $event');
    });
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

/*
        Directory dir = await getApplicationDocumentsDirectory();
        Dio dio = Dio();
        var path = '${dir.path}/dash.mpd';
        await dio.download(videoUrl, path);
        print(path);
        for (var l in File(path).readAsLinesSync()) {
          print(l);
        }
        media = Media('file://$path');
*/
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
      setListeners();
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
