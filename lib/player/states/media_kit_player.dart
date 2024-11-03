// This file is "main.dart"
import 'package:clipious/player/states/interfaces/media_player.dart';
import 'package:clipious/player/states/video_player.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:media_kit/media_kit.dart' as mk;
import 'package:media_kit_video/media_kit_video.dart'
    as mkv; // Provides [VideoController] & [Video] etc.
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../downloads/models/downloaded_video.dart';
import '../../globals.dart';
import '../../settings/states/settings.dart';
import '../../videos/models/ided_video.dart';
import '../../videos/models/video.dart';

part 'media_kit_player.freezed.dart';

final _log = Logger('MediaKitPlayer');

class MediaKitPlayerCubit extends MediaPlayerCubit<MediaKitPlayerState> {
  // Create a [Player] to control playback.
  mk.Player? mkPlayer;

  // Create a [VideoController] to handle video output from [Player].
  mkv.VideoController? mkController;
  final SettingsCubit settings;

  MediaKitPlayerCubit(super.initialState, super.player, this.settings) {
    onInit();
  }

  void onInit() {
    _log.fine("Ready, playing video");
    playVideo(state.offlineVideo != null, startAt: state.startAt);
  }

  @override
  playVideo(bool offline, {Duration? startAt}) async {
    if (player.state.isAudio) {
      return;
    }

    var newState = state.copyWith();

    // only used if the player is currently close because it is onReady that will actually play the video
    // need better way of handling this
    newState = newState.copyWith(startAt: startAt);
    if (newState.video != null || newState.offlineVideo != null) {
      IdedVideo idedVideo = offline ? newState.offlineVideo! : newState.video!;
      // videoController?.dispose();
      // videoController = null;
      newState = newState.copyWith(bufferPosition: Duration.zero);

      if (startAt == null && !offline) {
        double progress = db.getVideoProgress(idedVideo.videoId);
        if (progress > 0 && progress < 0.90) {
          startAt = Duration(
              seconds: (offline
                      ? newState.offlineVideo!.lengthSeconds
                      : (newState.video!.lengthSeconds ?? 0) * progress)
                  .floor());
        }
      }

      late final mk.Media media;
      // getting data sources
      if (offline) {
        String videoPath = await newState.offlineVideo!.effectivePath;

        media = mk.Media(videoPath);
      } else {
        assert(newState.video!.formatStreams != null);
        assert(newState.video!.adaptiveFormats != null);

        var server = await db.getCurrentlySelectedServer();
        String baseUrl = (server).url;

        Map<String, String> resolutions = {};

        bool isHls = newState.video!.hlsUrl != null;

        var formatStream = isHls
            ? null
            : newState.video!
                .formatStreams![newState.video!.formatStreams!.length - 1];

        var useProxy = service.useProxy();

        String videoUrl = isHls
            ? '${newState.video!.hlsUrl!}${useProxy ? '?local=true' : ''}'
            : isUsingDash()
                ? '${newState.video!.dashUrl}${useProxy ? '?local=true' : ''}'
                : formatStream?.url ?? '';
        if (!isUsingDash() && formatStream != null) {
          newState =
              newState.copyWith(selectedNonDashTrack: formatStream.resolution);
        }

        // somehow invidious is sending google url even when using local proxy when not using dash
        if (!isUsingDash() && useProxy) {
          // we replace google's cdn by invidious server url.
          videoUrl = videoUrl.replaceFirst(googleCdnRegex, '${(server).url}/');
        }

        log.info(
            'Playing url (dash ${isUsingDash()},  hasHls ? ${newState.video!.hlsUrl != null})  $videoUrl');

/*
        BetterPlayerVideoFormat format = isHls
            ? BetterPlayerVideoFormat.hls
            : isUsingDash()
                ? BetterPlayerVideoFormat.dash
                : BetterPlayerVideoFormat.other;

        if (format == BetterPlayerVideoFormat.other) {
          for (var value in (newState.video!.formatStreams ?? [])) {
            resolutions[value.qualityLabel] = value.url;
          }
        }
*/

        String lastSubtitle = '';
        if (settings.state.rememberSubtitles) {
          lastSubtitle = settings.state.lastSubtitles;
        }

        media = mk.Media(videoUrl);
/*
        betterPlayerDataSource = BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          videoUrl,
          headers: !offline ? server.headersForUrl(videoUrl) : {},
          videoFormat: format,
          liveStream: newState.video!.liveNow,
          subtitles: newState.video!.captions
              .map((s) => BetterPlayerSubtitlesSource(type: BetterPlayerSubtitlesSourceType.network, urls: ['$baseUrl${s.url}'], name: s.label, selectedByDefault: s.label == lastSubtitle))
              .toList(),
          resolutions: resolutions.isNotEmpty ? resolutions : null,
        );
*/
      }

      WakelockPlus.enable();

      bool fillVideo = settings.state.fillFullscreen;

      mkPlayer ??= mk.Player();

      if (mkPlayer != null && mkController == null) {
        mkController = mkv.VideoController(mkPlayer!);
/*
        mkController = BetterPlayerController(
            BetterPlayerConfiguration(
                overlay: isTv ? const TvPlayerControls() : PlayerControls(mediaPlayerCubit: this),
                deviceOrientationsOnFullScreen: [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight, DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
                deviceOrientationsAfterFullScreen: [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight, DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
                handleLifecycle: false,
                startAt: startAt,
                autoPlay: true,
                allowedScreenSleep: false,
                fit: fillVideo ? BoxFit.cover : BoxFit.contain,
                subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
                    backgroundColor: settings.state.subtitlesBackground ? Colors.black.withOpacity(0.8) : Colors.transparent,
                    fontSize: settings.state.subtitleSize,
                    outlineEnabled: true,
                    outlineColor: Colors.black,
                    outlineSize: 1),
                controlsConfiguration: const BetterPlayerControlsConfiguration(showControls: false
                    // customControlsBuilder: (controller, onPlayerVisibilityChanged) => PlayerControls(mediaPlayerCubit: this),
                    // customControlsBuilder: (controller, onPlayerVisibilityChanged) => const PlayerControls(),
                    // enablePlayPause: false,
                    // overflowModalColor: colors.surface,
                    // overflowModalTextColor: overFlowTextColor,
                    // overflowMenuIconsColor: overFlowTextColor,
                    // overflowMenuCustomItems: [BetterPlayerOverflowMenuItem(useDash ? Icons.check_box_outlined : Icons.check_box_outline_blank, locals.useDash, toggleDash)])
                    )),
            betterPlayerDataSource: betterPlayerDataSource);
        videoController!.addEventsListener(onVideoListener);
        videoController!.setBetterPlayerGlobalKey(newState.key);
        // isPipSupported = await videoController?.isPictureInPictureSupported() ?? false;
*/
        mkPlayer?.open(media);
      } else {
        mkPlayer?.open(media);
        // await videoController?.setupDataSource(betterPlayerDataSource);
        seek(startAt ?? Duration.zero);
      }

      super.playVideo(offline);
    }
  }

  @override
  Duration? bufferedPosition() {
    return mkPlayer?.state.buffer;
  }

  @override
  void disposeControllers() {
    mkPlayer?.dispose();
  }

  @override
  Duration duration() {
    return mkPlayer?.state.duration ?? const Duration(seconds: 1);
  }

  @override
  double getAspectRatio() {
    return (mkPlayer?.state.width ?? 0) / (mkPlayer?.state.height ?? 1);
  }

  @override
  List<String> getAudioTracks() {
    return [];
  }

  @override
  double getSpeed() {
    return mkPlayer?.state.rate ?? 1;
  }

  @override
  List<String> getSubtitles() {
    return [];
  }

  @override
  List<String> getVideoTracks() {
    return [];
  }

  @override
  bool hasDashToggle() {
    return true;
  }

  @override
  bool isMuted() {
    return mkPlayer?.state.volume == 0;
  }

  @override
  bool isPlaying() {
    return mkPlayer?.state.playing ?? false;
  }

  @override
  bool isUsingDash() {
    return settings.state.useDash;
  }

  @override
  void pause() {
    mkPlayer?.pause();
  }

  @override
  void play() {
    mkPlayer?.play();
  }

  @override
  Duration position() {
    return mkPlayer?.state.position ?? Duration.zero;
  }

  @override
  void seek(Duration position) {
    mkPlayer?.seek(position);
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
    throw UnimplementedError();
  }

  @override
  void setSpeed(double d) {
    mkPlayer?.setRate(d);
  }

  @override
  double? speed() {
    return mkPlayer?.state.rate;
  }

  @override
  void switchToOfflineVideo(DownloadedVideo v) {
    // TODO: implement switchToOfflineVideo
  }

  @override
  void switchVideo(Video video, {Duration? startAt}) {
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
    mkPlayer?.playOrPause();
  }

  @override
  void toggleVolume(bool soundOn) {
    mkPlayer?.setVolume(isMuted() ? 1 : 0);
  }
}

@freezed
class MediaKitPlayerState extends MediaPlayerState with _$MediaKitPlayerState {
  const factory MediaKitPlayerState(
      {Duration? startAt,
      @Default("") String selectedNonDashTrack,
      @Default(Duration.zero) Duration? bufferPosition,
      Video? video,
      DownloadedVideo? offlineVideo,
      bool? playNow,
      bool? disableControls}) = _MediaKitPlayerState;
}
