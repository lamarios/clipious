import 'package:better_player/better_player.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/player/models/media_event.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/videos/models/base_video.dart';
import 'package:logging/logging.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../globals.dart';
import '../../main.dart';
import '../../utils/pretty_bytes.dart';
import '../../videos/models/video.dart';
import '../views/components/player_controls.dart';
import '../views/tv/components/player_controls.dart';
import 'interfaces/media_player.dart';

part 'video_player.freezed.dart';

final log = Logger('VideoPlayer');

class VideoPlayerCubit extends MediaPlayerCubit<VideoPlayerState> {
  BetterPlayerController? videoController;
  final SettingsCubit settings;

  VideoPlayerCubit(super.initialState, super.player, this.settings) {
    onInit();
  }

  void onInit() {
    log.fine("Ready, playing video");
    playVideo(state.offlineVideo != null, startAt: state.startAt);
  }

  @override
  close() async {
    disposeControllers();
    super.close();
  }

  @override
  disposeControllers() {
    WakelockPlus.disable();
    log.fine("Disposing video controller");
    var state = this.state.copyWith();
    videoController?.exitFullScreen();
    videoController?.removeEventsListener(onVideoListener);
    videoController?.dispose();
    videoController = null;
    if (!isClosed) {
      emit(state);
    }
  }

  forwardEvent(BetterPlayerEvent event) {
    MediaEventType? type;
    MediaState mediaState = MediaState.playing;

    switch (event.betterPlayerEventType) {
      case BetterPlayerEventType.setSpeed:
        type = MediaEventType.speedChanged;
        break;
      case BetterPlayerEventType.pause:
        type = MediaEventType.pause;
        break;
      case BetterPlayerEventType.setVolume:
        break;
      case BetterPlayerEventType.play:
        type = MediaEventType.play;
        break;

      case BetterPlayerEventType.progress:
        EasyThrottle.throttle(
            'video-player-progress', const Duration(seconds: 1), () {
          player.setEvent(MediaEvent(
              state: MediaState.playing,
              type: MediaEventType.progress,
              value: videoController?.videoPlayerController?.value.position ??
                  Duration.zero));
        });
      case BetterPlayerEventType.seekTo:
        // we bypass the rest so we can send the current progress
        player.setEvent(MediaEvent(
            state: MediaState.playing,
            type: MediaEventType.progress,
            value: videoController?.videoPlayerController?.value.position ??
                Duration.zero));
        return;
      case BetterPlayerEventType.bufferingEnd:
        mediaState = MediaState.playing;
        break;
      case BetterPlayerEventType.bufferingStart:
        mediaState = MediaState.buffering;
        break;
      case BetterPlayerEventType.changedPlayerVisibility:
        break;
      case BetterPlayerEventType.changedPlaylistItem:
        break;
      case BetterPlayerEventType.setupDataSource:
        mediaState = MediaState.loading;
        break;
      case BetterPlayerEventType.controlsVisible:
        break;
      case BetterPlayerEventType.openFullscreen:
        break;
      case BetterPlayerEventType.initialized:
        player.setEvent(MediaEvent<double>(
            state: MediaState.ready,
            type: MediaEventType.aspectRatioChanged,
            value: getAspectRatio()));
        mediaState = MediaState.ready;
        break;
      case BetterPlayerEventType.hideFullscreen:
        break;
      case BetterPlayerEventType.finished:
        mediaState = MediaState.completed;
        break;
      case BetterPlayerEventType.exception:
        mediaState = MediaState.error;
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
        return;
    }

    player.setEvent(MediaEvent(state: mediaState, type: type));
  }

  onVideoListener(BetterPlayerEvent event) {
    forwardEvent(event);

    switch (event.betterPlayerEventType) {
      case BetterPlayerEventType.bufferingUpdate:
        EasyThrottle.throttle('video-buffering', const Duration(seconds: 1),
            () {
          List<DurationRange> durations = event.parameters?['buffered'] ?? [];
          emit(state.copyWith(
              bufferPosition:
                  durations.sortBy((e) => e.end).map((e) => e.end).last));
          player.setEvent(MediaEvent(
              state: MediaState.playing,
              type: MediaEventType.bufferChanged,
              value: state.bufferPosition));
        });
        break;
      case BetterPlayerEventType.play:
        double speed = 1.0;
        if (settings.state.rememberPlayBackSpeed) {
          log.fine("Setting playback speed to $speed");
          videoController?.setSpeed(settings.state.lastSpeed);
        }
        break;
      case BetterPlayerEventType.changedSubtitles:
        settings.setLastSubtitle(
            videoController?.betterPlayerSubtitlesSource?.name ?? '');
        break;
      case BetterPlayerEventType.setSpeed:
        if (event.parameters?.containsKey("speed") ?? false) {
          settings.setLastSpeed(event.parameters?["speed"]);
        }
        break;
      default:
        break;
    }
  }

  @override
  toggleDash() {
    log.fine('toggle dash');
    var state = this.state.copyWith();
    // saving progress before we reload new video format
    // saveProgress(videoController?.videoPlayerController?.value.position.inSeconds ?? 0);
    player.saveProgress(position().inSeconds);

    // disposeControllers();

    settings.toggleDash(!isUsingDash());

    emit(state);
    playVideo(false);
  }

  @override
  switchVideo(Video video, {Duration? startAt}) {
    emit(state.copyWith(startAt: startAt, video: video));
    playVideo(false, startAt: startAt);
  }

  @override
  togglePlaying() {
    if (videoController != null) {
      (videoController?.isPlaying() ?? false)
          ? videoController?.pause()
          : videoController?.play();
      emit(state.copyWith());
    }
  }

  @override
  toggleControls(bool visible) {
    videoController?.setControlsEnabled(visible);
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
                      : newState.video!.lengthSeconds * progress)
                  .floor());
        }
      }

      late BetterPlayerDataSource betterPlayerDataSource;

      // getting data sources
      if (offline) {
        String videoPath = await newState.offlineVideo!.mediaPath;

        betterPlayerDataSource = BetterPlayerDataSource(
          BetterPlayerDataSourceType.file,
          videoPath,
          videoFormat: BetterPlayerVideoFormat.other,
          liveStream: false,
        );
      } else {
        String baseUrl = db.getCurrentlySelectedServer().url;

        Map<String, String> resolutions = {};

        bool isHls = newState.video!.hlsUrl != null;

        var formatStream = isHls
            ? null
            : newState
                .video!.formatStreams[newState.video!.formatStreams.length - 1];
        String videoUrl = isHls
            ? '${newState.video!.hlsUrl!}${service.useProxy() ? '?local=true' : ''}'
            : isUsingDash()
                ? '${newState.video!.dashUrl}${service.useProxy() ? '?local=true' : ''}'
                : formatStream?.url ?? '';
        if (!isUsingDash() && formatStream != null) {
          newState =
              newState.copyWith(selectedNonDashTrack: formatStream.resolution);
        }

        log.info(
            'Playing url (dash ${isUsingDash()},  hasHls ? ${newState.video!.hlsUrl != null})  $videoUrl');

        BetterPlayerVideoFormat format = isHls
            ? BetterPlayerVideoFormat.hls
            : isUsingDash()
                ? BetterPlayerVideoFormat.dash
                : BetterPlayerVideoFormat.other;

        if (format == BetterPlayerVideoFormat.other) {
          for (var value in newState.video!.formatStreams) {
            resolutions[value.qualityLabel] = value.url;
          }
        }

        String lastSubtitle = '';
        if (settings.state.rememberSubtitles) {
          lastSubtitle = settings.state.lastSubtitles;
        }

        betterPlayerDataSource = BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          videoUrl,
          videoFormat: format,
          liveStream: newState.video!.liveNow,
          subtitles: newState.video!.captions
              .map((s) => BetterPlayerSubtitlesSource(
                  type: BetterPlayerSubtitlesSourceType.network,
                  urls: ['$baseUrl${s.url}'],
                  name: s.label,
                  selectedByDefault: s.label == lastSubtitle))
              .toList(),
          resolutions: resolutions.isNotEmpty ? resolutions : null,
        );
      }

      WakelockPlus.enable();

      bool fillVideo = settings.state.fillFullscreen;

      if (videoController == null) {
        videoController = BetterPlayerController(
            BetterPlayerConfiguration(
                overlay: isTv
                    ? const TvPlayerControls()
                    : PlayerControls(mediaPlayerCubit: this),
                deviceOrientationsOnFullScreen: [
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight,
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.portraitUp
                ],
                deviceOrientationsAfterFullScreen: [
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight,
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.portraitUp
                ],
                handleLifecycle: false,
                startAt: startAt,
                autoPlay: true,
                allowedScreenSleep: false,
                fit: fillVideo ? BoxFit.cover : BoxFit.contain,
                subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
                    backgroundColor: settings.state.subtitlesBackground
                        ? Colors.black.withOpacity(0.8)
                        : Colors.transparent,
                    fontSize: settings.state.subtitleSize,
                    outlineEnabled: true,
                    outlineColor: Colors.black,
                    outlineSize: 1),
                controlsConfiguration: const BetterPlayerControlsConfiguration(
                    showControls: false
                    // customControlsBuilder: (controller, onPlayerVisibilityChanged) => PlayerControls(mediaPlayerCubit: this),
                    // customControlsBuilder: (controller, onPlayerVisibilityChanged) => const PlayerControls(),
                    // enablePlayPause: false,
                    // overflowModalColor: colors.background,
                    // overflowModalTextColor: overFlowTextColor,
                    // overflowMenuIconsColor: overFlowTextColor,
                    // overflowMenuCustomItems: [BetterPlayerOverflowMenuItem(useDash ? Icons.check_box_outlined : Icons.check_box_outline_blank, locals.useDash, toggleDash)])
                    )),
            betterPlayerDataSource: betterPlayerDataSource);
        videoController!.addEventsListener(onVideoListener);
        videoController!.setBetterPlayerGlobalKey(newState.key);
        // isPipSupported = await videoController?.isPictureInPictureSupported() ?? false;
      } else {
        await videoController?.setupDataSource(betterPlayerDataSource);
        seek(startAt ?? Duration.zero);
      }

      emit(newState);
    }

    super.playVideo(offline);
  }

  @override
  void switchToOfflineVideo(DownloadedVideo v) {
    // videoController?.exitFullScreen();
    // disposeControllers();
    emit(state.copyWith(offlineVideo: v));
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
    return state.bufferPosition;
  }

  @override
  Duration position() {
    return videoController?.videoPlayerController?.value.position ??
        Duration.zero;
  }

  @override
  double? speed() {
    return videoController?.videoPlayerController?.value.speed ?? 1;
  }

  String _videoTrackToString(BetterPlayerAsmsTrack? track) {
    return '${track?.height}p - ${prettyBytes((track?.bitrate ?? 0).toDouble(), bits: true)}/s';
  }

  String _audioTrackToString(BetterPlayerAsmsAudioTrack? track) {
    return '${track?.label} ${track?.language != null ? '- ${track?.language}' : ''}';
  }

  String _subtitleToString(BetterPlayerSubtitlesSource? source) {
    return '${source?.name}';
  }

  @override
  List<String> getVideoTracks() {
    if (state.video != null) {
      if (videoController?.betterPlayerAsmsTracks.isNotEmpty ?? false) {
        return videoController?.betterPlayerAsmsTracks
                .map(_videoTrackToString)
                .toList() ??
            [];
      } else {
        return state.video?.formatStreams.map((e) => e.resolution).toList() ??
            [];
      }
    }
    // for offline video we don't offer video track selection
    return [];
  }

  @override
  int selectedVideoTrack() {
    if (state.video != null) {
      if (isUsingDash()) {
        var tracks = getVideoTracks();
        var track = _videoTrackToString(videoController?.betterPlayerAsmsTrack);
        log.fine("Current track: $track");
        return tracks.indexOf(track);
      } else {
        var tracks = getVideoTracks();

        return tracks.indexOf(state.selectedNonDashTrack);
      }
    }
    // for offline video we don't offer video track selection
    return -1;
  }

  @override
  List<String> getAudioTracks() {
    if (state.video != null) {
      if (videoController?.betterPlayerAsmsAudioTracks?.isNotEmpty ?? false) {
        return videoController?.betterPlayerAsmsAudioTracks
                ?.map(_audioTrackToString)
                .toList() ??
            [];
      }
    }
    // for offline video we don't offer video track selection
    return [];
  }

  @override
  int selectedAudioTrack() {
    if (state.video != null) {
      if (settings.state.useDash) {
        var tracks = getAudioTracks();
        var track =
            _audioTrackToString(videoController?.betterPlayerAsmsAudioTrack);
        log.fine("Current audio track: $track");
        return tracks.indexOf(track);
      }
    }
    // for offline video we don't offer video track selection
    return -1;
  }

  @override
  List<String> getSubtitles() {
    return state.video != null
        ? videoController?.betterPlayerSubtitlesSourceList
                .map(_subtitleToString)
                .toList() ??
            []
        : [];
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
    var betterPlayerAsmsTrack =
        videoController?.betterPlayerAsmsAudioTracks?[index];
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
    if (isUsingDash()) {
      var betterPlayerAsmsTrack =
          videoController?.betterPlayerAsmsTracks[index];
      if (betterPlayerAsmsTrack != null) {
        videoController?.setTrack(betterPlayerAsmsTrack);
      }
    } else {
      var track = getVideoTracks()[index];
      var url = videoController?.betterPlayerDataSource?.resolutions?[track];
      if (url != null) {
        videoController?.setResolution(url);
        emit(state.copyWith(selectedNonDashTrack: track));
      }
    }
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
    return state.video != null;
  }

  @override
  bool isUsingDash() {
    return settings.state.useDash;
  }

  @override
  Duration duration() {
    return videoController?.videoPlayerController?.value.duration ??
        const Duration(milliseconds: 1);
  }

  @override
  double getAspectRatio() {
    double width =
        videoController?.videoPlayerController?.value.size?.width ?? 16;
    double height =
        videoController?.videoPlayerController?.value.size?.height ?? 9;
    return width / height;
  }

  @override
  void onEnterFullScreen() {
    videoController?.setOverriddenAspectRatio(getAspectRatio());
  }

  @override
  void onExitFullScreen() {
    videoController?.setOverriddenAspectRatio(16 / 9);
  }
}

@freezed
class VideoPlayerState extends MediaPlayerState with _$VideoPlayerState {
  const factory VideoPlayerState(
      {required ColorScheme colors,
      required Color overFlowTextColor,
      required GlobalKey key,
      Duration? startAt,
      @Default("") String selectedNonDashTrack,
      @Default(Duration.zero) Duration? bufferPosition,
      Video? video,
      DownloadedVideo? offlineVideo,
      bool? playNow,
      bool? disableControls}) = _VideoPlayerState;

  const VideoPlayerState._();
}
