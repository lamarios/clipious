import 'package:better_player/better_player.dart';
import 'package:better_player/src/video_player/video_player_platform_interface.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/controllers/settingsController.dart';
import 'package:invidious/controllers/tvPlayerController.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/models/baseVideo.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:invidious/models/mediaEvent.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';
import 'package:wakelock/wakelock.dart';

import '../database.dart';
import '../globals.dart';
import '../main.dart';
import '../models/db/settings.dart';
import '../models/pair.dart';
import '../models/sponsorSegment.dart';
import '../models/sponsorSegmentTypes.dart';
import '../models/video.dart';
import '../views/tv/tvPlayerControls.dart';
import '../views/videoPlayer/playerControls.dart';
import 'interfaces/playerController.dart';
import 'miniPayerController.dart';

class VideoPlayerController extends PlayerController {
  static VideoPlayerController? to() => safeGet();

  final log = Logger('VideoPlayer');
  BetterPlayerController? videoController;
  bool useDash = db.getSettings(USE_DASH)?.value == 'true';
  AppLocalizations locals;
  final bool miniPlayer;
  final ColorScheme colors;
  final Color overFlowTextColor;
  final GlobalKey key;
  Duration? startAt;
  String selectedNonDashTrack = '';
  Duration? bufferPosition = Duration.zero;

  MiniPlayerController? get mpc => isTv ? TvPlayerController.to() : MiniPlayerController.to();

  VideoPlayerController(
      {required this.colors,
      required this.overFlowTextColor,
      required this.key,
      Video? video,
      DownloadedVideo? offlineVideo,
      required this.miniPlayer,
      required this.locals,
      bool? disableControls,
      this.startAt})
      : super(video: video, offlineVideo: offlineVideo, disableControls: disableControls);

  @override
  void onInit() {
    super.onInit();
    if (miniPlayer) {
      FBroadcast.instance().register(BROADCAST_STOP_MINI_PLAYER, (value, callback) {
        disposeControllers();
      });
    } else {
      FBroadcast.instance().register(BROADCAST_STOP_PLAYING, (value, callback) {
        disposeControllers();
      });
    }
  }

  @override
  onReady() async {
    log.fine("Ready, playing video");
    playVideo(offlineVideo != null, startAt: startAt);
  }

  @override
  onClose() {
    disposeControllers();
  }

  @override
  disposeControllers() {
    Wakelock.disable();
    log.fine("Disposing video controller");
    videoController?.removeEventsListener(onVideoListener);
    videoController?.dispose();
    videoController = null;
  }

  forwardEvent(BetterPlayerEvent event) {
    MediaEventType? type;
    MediaState state = MediaState.playing;

    switch (event.betterPlayerEventType) {
      case BetterPlayerEventType.setSpeed:
        type = MediaEventType.speedChanged;
        break;
      case BetterPlayerEventType.pause:
        type = MediaEventType.pause;
        break;
      case BetterPlayerEventType.setVolume:
        type = MediaEventType.volumeChanged;
        break;
      case BetterPlayerEventType.play:
        type = MediaEventType.play;
        break;
      case BetterPlayerEventType.progress:
        type = MediaEventType.progress;
        break;
      case BetterPlayerEventType.seekTo:
        type = MediaEventType.progress;
        break;
      case BetterPlayerEventType.bufferingEnd:
        state = MediaState.playing;
        break;
      case BetterPlayerEventType.bufferingStart:
        state = MediaState.buffering;
        break;
      case BetterPlayerEventType.bufferingUpdate:
        break;
      case BetterPlayerEventType.changedPlayerVisibility:
        break;
      case BetterPlayerEventType.changedPlaylistItem:
        break;
      case BetterPlayerEventType.setupDataSource:
        state = MediaState.loading;
        break;
      case BetterPlayerEventType.pipStop:
        break;
      case BetterPlayerEventType.pipStart:
        break;
      case BetterPlayerEventType.overflowOpened:
        break;
      case BetterPlayerEventType.overflowClosed:
        break;
      case BetterPlayerEventType.openFullscreen:
        break;
      case BetterPlayerEventType.initialized:
        state = MediaState.ready;
        break;
      case BetterPlayerEventType.hideFullscreen:
        break;
      case BetterPlayerEventType.finished:
        state = MediaState.completed;
        break;
      case BetterPlayerEventType.exception:
        state = MediaState.error;
        break;
      case BetterPlayerEventType.controlsVisible:
        break;
      case BetterPlayerEventType.controlsHiddenStart:
        break;
      case BetterPlayerEventType.controlsHiddenEnd:
        break;
      case BetterPlayerEventType.changedTrack:
        break;
      case BetterPlayerEventType.changedSubtitles:
        break;
      case BetterPlayerEventType.changedResolution:
        break;
      default:
        break;
    }

    mpc?.eventStream.add(MediaEvent(state: state, type: type));
  }

  onVideoListener(BetterPlayerEvent event) {
    forwardEvent(event);

    switch (event.betterPlayerEventType) {
      case BetterPlayerEventType.bufferingUpdate:
        List<DurationRange> durations = event.parameters?['buffered'] ?? [];
        bufferPosition = durations.sortBy((e) => e.end).map((e) => e.end).last;
        break;
      case BetterPlayerEventType.play:
        double speed = 1.0;
        if (db.getSettings(REMEMBER_PLAYBACK_SPEED)?.value == 'true') {
          speed = double.parse(db.getSettings(LAST_SPEED)?.value ?? '1.0');

          log.fine("Setting playback speed to $speed");
          videoController?.setSpeed(speed);
        }
        break;
      case BetterPlayerEventType.changedSubtitles:
        db.saveSetting(SettingsValue(LAST_SUBTITLE, videoController?.betterPlayerSubtitlesSource?.name ?? ''));
        break;
      case BetterPlayerEventType.setSpeed:
        if (event.parameters?.containsKey("speed") ?? false) {
          db.saveSetting(SettingsValue(LAST_SPEED, event.parameters?["speed"].toString() ?? '1.0'));
        }
        break;
      default:
        break;
    }
  }

  @override
  toggleDash() {
    log.fine('toggle dash');
    // saving progress before we reload new video format
    // saveProgress(videoController?.videoPlayerController?.value.position.inSeconds ?? 0);
    mpc?.saveProgress(position().inSeconds);

    disposeControllers();

    db.saveSetting(SettingsValue(USE_DASH, (!useDash).toString()));
    useDash = !useDash;
    playVideo(false);
    update();
  }

  @override
  switchVideo(Video video, {Duration? startAt}) {
    videoController?.exitFullScreen();
    this.startAt = startAt;
    disposeControllers();
    this.video = video;
    playVideo(false, startAt: startAt);
  }

  @override
  togglePlaying() {
    if (videoController != null) {
      (videoController?.isPlaying() ?? false) ? videoController?.pause() : videoController?.play();
      update();
    }
  }

  @override
  toggleControls(bool visible) {
    videoController?.setControlsEnabled(visible);
  }

  @override
  playVideo(bool offline, {Duration? startAt}) async {
    // only used if the player is currently close because it is onReady that will actually play the video
    // need better way of handling this
    this.startAt = startAt;
    if (video != null || offlineVideo != null) {
      IdedVideo idedVideo = offline ? offlineVideo! : video!;
      videoController?.dispose();
      videoController = null;
      bufferPosition = Duration.zero;

      if (startAt == null && !offline) {
        double progress = db.getVideoProgress(idedVideo.videoId);
        if (progress > 0 && progress < 0.90) {
          startAt = Duration(seconds: (offline ? offlineVideo!.lengthSeconds : video!.lengthSeconds * progress).floor());
        }
      }

      print('start at $startAt');

      late BetterPlayerDataSource betterPlayerDataSource;

      // getting data sources
      if (offline) {
        String videoPath = await offlineVideo!.mediaPath;

        betterPlayerDataSource = BetterPlayerDataSource(
          BetterPlayerDataSourceType.file,
          videoPath,
          videoFormat: BetterPlayerVideoFormat.other,
          liveStream: false,
        );
      } else {
        String baseUrl = db.getCurrentlySelectedServer().url;

        Map<String, String> resolutions = {};

        bool isHls = video!.hlsUrl != null;
        var formatStream = video!.formatStreams[video!.formatStreams.length - 1];
        String videoUrl = isHls
            ? '${video!.hlsUrl!}${service.useProxy() ? '?local=true' : ''}'
            : useDash
                ? '${video!.dashUrl}${service.useProxy() ? '?local=true' : ''}'
                : formatStream.url;
        if (!useDash) {
          selectedNonDashTrack = formatStream.resolution;
        }

        log.info('Playing url (dash ${useDash},  hasHls ? ${video!.hlsUrl != null})  ${videoUrl}');

        useDash = db.getSettings(USE_DASH)?.value == 'true';

        BetterPlayerVideoFormat format = isHls
            ? BetterPlayerVideoFormat.hls
            : useDash
                ? BetterPlayerVideoFormat.dash
                : BetterPlayerVideoFormat.other;

        if (format == BetterPlayerVideoFormat.other) {
          for (var value in video!.formatStreams) {
            resolutions[value.qualityLabel] = value.url;
          }
        }

        String lastSubtitle = '';
        if (db.getSettings(REMEMBER_LAST_SUBTITLE)?.value == 'true') {
          lastSubtitle = db.getSettings(LAST_SUBTITLE)?.value ?? '';
        }

        betterPlayerDataSource = BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          videoUrl,
          videoFormat: format,
          liveStream: video!.liveNow,
          subtitles: video!.captions
              .map((s) => BetterPlayerSubtitlesSource(type: BetterPlayerSubtitlesSourceType.network, urls: ['${baseUrl}${s.url}'], name: s.label, selectedByDefault: s.label == lastSubtitle))
              .toList(),
          resolutions: resolutions.isNotEmpty ? resolutions : null,
        );
      }

      Wakelock.enable();

      bool lockOrientation = db.getSettings(LOCK_ORIENTATION_FULLSCREEN)?.value == 'true';
      bool fillVideo = db.getSettings(FILL_FULLSCREEN)?.value == 'true';

      videoController = BetterPlayerController(
          BetterPlayerConfiguration(
              overlay: isTv ? null : PlayerControls(),
              deviceOrientationsOnFullScreen: [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight, DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
              deviceOrientationsAfterFullScreen: [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight, DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
              handleLifecycle: false,
              autoDetectFullscreenDeviceOrientation: lockOrientation,
              autoDetectFullscreenAspectRatio: true,
              startAt: startAt,
              autoPlay: true,
              allowedScreenSleep: false,
              fit: fillVideo ? BoxFit.cover : BoxFit.contain,
              subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
                fontSize: double.parse(db.getSettings(SUBTITLE_SIZE)?.value ?? subtitleDefaultSize),
              ),
              controlsConfiguration: BetterPlayerControlsConfiguration(
                showControls: false,
                // customControlsBuilder: (controller, onPlayerVisibilityChanged) => const PlayerControls(),
                // enablePlayPause: false,
                // overflowModalColor: colors.background,
                // overflowModalTextColor: overFlowTextColor,
                // overflowMenuIconsColor: overFlowTextColor,
                // overflowMenuCustomItems: [BetterPlayerOverflowMenuItem(useDash ? Icons.check_box_outlined : Icons.check_box_outline_blank, locals.useDash, toggleDash)])
              )),
          betterPlayerDataSource: betterPlayerDataSource);
      videoController!.addEventsListener(onVideoListener);
      videoController!.setBetterPlayerGlobalKey(key);
      // isPipSupported = await videoController?.isPictureInPictureSupported() ?? false;

      update();
    }
  }

  @override
  void switchToOfflineVideo(DownloadedVideo v) {
    videoController?.exitFullScreen();
    disposeControllers();
    offlineVideo = v;
    playVideo(true);
  }

  @override
  bool isPlaying() {
    return videoController?.isPlaying() ?? false;
  }

  @override
  void pause() {
    videoController?.pause();
  }

  @override
  void play() {
    videoController?.play();
  }

  @override
  void seek(Duration position) {
    videoController?.seekTo(position);
  }

  @override
  Duration? bufferedPosition() {
    return bufferPosition;
  }

  @override
  Duration position() {
    return videoController?.videoPlayerController?.value.position ?? Duration.zero;
  }

  @override
  double? speed() {
    videoController?.videoPlayerController?.value.speed ?? 1;
  }

  @override
  FullScreenState isFullScreen() {
    return (videoController?.isFullScreen ?? false) ? FullScreenState.fullScreen : FullScreenState.notFullScreen;
  }

  @override
  setFullScreen(bool fullScreen) {
    if (fullScreen) {
      videoController?.enterFullScreen();
    } else {
      videoController?.exitFullScreen();
    }
  }

  String _videoTrackToString(BetterPlayerAsmsTrack? track) {
    return '${track?.height}p' ?? '';
  }

  String _audioTrackToString(BetterPlayerAsmsAudioTrack? track) {
    return '${track?.label} ${track?.language != null ? '- ${track?.language}' : ''}';
  }

  String _subtitleToString(BetterPlayerSubtitlesSource? source) {
    return '${source?.name}';
  }

  @override
  List<String> getVideoTracks() {
    // TODO: implement getVideoTracks
    if (video != null) {
      if (videoController?.betterPlayerAsmsTracks.isNotEmpty ?? false) {
        return videoController?.betterPlayerAsmsTracks.map(_videoTrackToString).toList() ?? [];
      } else {
        return video?.formatStreams.map((e) => e.resolution).toList() ?? [];
      }
    }
    // for offline video we don't offer video track selection
    return [];
  }

  @override
  int selectedVideoTrack() {
    if (video != null) {
      if (useDash) {
        var tracks = getVideoTracks();
        var track = _videoTrackToString(videoController?.betterPlayerAsmsTrack);
        log.fine("Current track: $track");
        return tracks.indexOf(track);
      } else {
        var tracks = getVideoTracks();

        return tracks.indexOf(selectedNonDashTrack);
      }
    }
    // for offline video we don't offer video track selection
    return -1;
  }

  @override
  List<String> getAudioTracks() {
    // TODO: implement getVideoTracks
    if (video != null) {
      if (videoController?.betterPlayerAsmsAudioTracks?.isNotEmpty ?? false) {
        return videoController?.betterPlayerAsmsAudioTracks?.map(_audioTrackToString).toList() ?? [];
      }
    }
    // for offline video we don't offer video track selection
    return [];
  }

  @override
  int selectedAudioTrack() {
    if (video != null) {
      if (useDash) {
        var tracks = getAudioTracks();
        var track = _audioTrackToString(videoController?.betterPlayerAsmsAudioTrack);
        log.fine("Current audio track: $track");
        return tracks.indexOf(track);
      }
    }
    // for offline video we don't offer video track selection
    return -1;
  }

  @override
  List<String> getSubtitles() {
    return videoController?.betterPlayerSubtitlesSourceList.map(_subtitleToString).toList() ?? [];
  }

  @override
  int selectedSubtitle() {
    var tracks = getSubtitles();
    var track = _subtitleToString(videoController?.betterPlayerSubtitlesSource);
    log.fine("Current subtitle track: $track");
    return tracks.indexOf(track);
  }

  @override
  selectAudioTrack(int index) {
    var betterPlayerAsmsTrack = videoController?.betterPlayerAsmsAudioTracks?[index];
    log.fine("Selected audio track, ${betterPlayerAsmsTrack?.label}");
    if (betterPlayerAsmsTrack != null) {
      videoController?.setAudioTrack(betterPlayerAsmsTrack);
    }
  }

  @override
  selectSubtitle(int index) {
    var sub = videoController?.betterPlayerSubtitlesSourceList[index];
    if (sub != null) {
      videoController?.setupSubtitleSource(sub, sourceInitialize: true);
    }
  }

  @override
  selectVideoTrack(int index) {
    var betterPlayerAsmsTrack = videoController?.betterPlayerAsmsTracks[index];
    if (betterPlayerAsmsTrack != null) {
      videoController?.setTrack(betterPlayerAsmsTrack);
    }
  }

  @override
  bool supportsPip() {
    return true;
  }

  @override
  void enterPip() {
    videoController?.enablePictureInPicture(key);
  }

  @override
  bool isMuted() {
    return videoController?.videoPlayerController?.value.volume == 0;
  }

  @override
  void toggleVolume(bool soundOn) {
    videoController?.setVolume(soundOn ? 1 : 0);
  }

  @override
  void setSpeed(double d) {
    videoController?.setSpeed(d);
  }

  @override
  double getSpeed() {
    return videoController?.videoPlayerController?.value.speed ?? 1;
  }

  @override
  bool hasDashToggle() {
    return true;
  }

  @override
  bool isUsingDash() {
    return useDash;
  }

  @override
  Duration duration() {
    return videoController?.videoPlayerController?.value.duration ?? const Duration(milliseconds: 1);
  }
}
