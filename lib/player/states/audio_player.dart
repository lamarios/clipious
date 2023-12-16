import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/player/states/interfaces/media_player.dart';
import 'package:invidious/videos/models/video.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logging/logging.dart';

import '../../settings/states/settings.dart';
import '../../videos/models/adaptive_format.dart';
import '../models/media_event.dart';

part 'audio_player.freezed.dart';

Logger log = Logger('AudioPlayerController');

class AudioPlayerCubit extends MediaPlayerCubit<AudioPlayerState> {
  AudioPlayer? audioPlayer;
  final SettingsCubit settings;

  AudioPlayerCubit(super.initialState, super.player, this.settings) {
    onInit();
  }

  @override
  close() async {
    disposeControllers();
    super.close();
  }

  void onInit() {
    initPlayer();
    playVideo(state.offlineVideo != null);
  }

  @override
  void disposeControllers() {
    audioPlayer?.dispose();
  }

  initPlayer() {
    if (audioPlayer == null) {
      audioPlayer = AudioPlayer();
      audioPlayer?.playerStateStream.listen(onStateStreamChange,
          onError: (e, st) {
        return player.setEvent(const MediaEvent(state: MediaState.error));
      });
      audioPlayer?.positionStream.listen(onPositionChanged);
      audioPlayer?.durationStream.listen(onDurationChanged);
      audioPlayer?.bufferedPositionStream.listen(onBufferChanged);
    }
  }

  onStateStreamChange(PlayerState state) {
    log.fine('Player state event $state');
    switch (state.processingState) {
      case ProcessingState.idle:
        // looks like this is causing issues with the player control notification
        // MiniPlayerController.to()?.eventStream.add(MediaEvent(state: MediaState.idle));
        break;
      case ProcessingState.loading:
        player.setEvent(const MediaEvent(state: MediaState.loading));
        break;
      case ProcessingState.buffering:
        player.setEvent(const MediaEvent(state: MediaState.buffering));
        break;
      case ProcessingState.ready:
        player.setEvent(const MediaEvent(state: MediaState.ready));
        break;
      case ProcessingState.completed:
        player.setEvent(const MediaEvent(state: MediaState.completed));
        break;
    }
  }

  onDurationChanged(Duration? duration) async {
    emit(state.copyWith(loading: false));
    if (!isClosed) emit(state);
    player.setEvent(MediaEvent(
        state: MediaState.playing,
        type: MediaEventType.durationChanged,
        value: duration ?? const Duration(seconds: 1)));
  }

  onPositionChanged(Duration position) {
    EasyThrottle.throttle('audio-progress', const Duration(seconds: 1), () {
      emit(state.copyWith(audioPosition: position));
      player.setEvent(MediaEvent(
          state: MediaState.playing,
          type: MediaEventType.progress,
          value: position));
    });
  }

  @override
  playVideo(bool offline, {Duration? startAt}) async {
    if (!player.state.isAudio) {
      return;
    }
    if (state.video != null || state.offlineVideo != null) {
      // disposeControllers();
      initPlayer();
      var audioLength = Duration(
          seconds: offline
              ? state.offlineVideo!.lengthSeconds
              : state.video!.lengthSeconds);
      emit(state.copyWith(
          audioPosition: Duration.zero,
          audioLength: audioLength,
          loading: true));
      player.setEvent(const MediaEvent(state: MediaState.loading));
      try {
        AudioSource? source;

        if (!offline) {
          if (service.useProxy()) {
            // audio only streams don't seem to work when using proxy mode, using formatted streams when proxy is enabled
            var formatStream = state
                .video!.formatStreams[state.video!.formatStreams.length - 1];
            source = AudioSource.uri(Uri.parse(formatStream.url));
          } else {
            AdaptiveFormat? audio = state.video?.adaptiveFormats
                .where((element) => element.type.contains("audio"))
                .sortByReversed((e) => int.parse(e.bitrate ?? "0"))
                .first;
            if (audio != null) {
              if (startAt == null) {
                double progress = db.getVideoProgress(state.video!.videoId);
                if (progress > 0 && progress < 0.90) {
                  startAt = Duration(
                      seconds: (state.video!.lengthSeconds * progress).floor());
                }
              }
              emit(state);

              source = AudioSource.uri(Uri.parse(audio.url));
            }
          }
        } else {
          String path = await state.offlineVideo!.mediaPath;
          source = AudioSource.file(path);
        }

        if (source == null) {
          throw Error();
        }

        await audioPlayer?.setAudioSource(source, initialPosition: startAt);

        play();
        // TODO: make this less duplicated between videos and audio
        double speed = 1.0;
        if (settings.state.rememberPlayBackSpeed) {
          speed = settings.state.lastSpeed;

          log.fine("Setting playback speed to $speed");
          audioPlayer?.setSpeed(speed);
        }
      } catch (e) {
        log.severe("Couldn't play video", e);
        player.setEvent(const MediaEvent(state: MediaState.error));
        if (!isClosed)
          emit(state.copyWith(error: e.toString(), loading: false));
      }
    }
    super.playVideo(offline);
  }

  @override
  double getAspectRatio() {
    return 16 / 9;
  }

  @override
  void switchToOfflineVideo(DownloadedVideo v) {
    emit(state.copyWith(video: null, offlineVideo: v));
    playVideo(true);
  }

  @override
  void switchVideo(Video video, {Duration? startAt}) async {
    emit(state.copyWith(video: video, offlineVideo: null));
    playVideo(false, startAt: startAt);
  }

  @override
  void togglePlaying() {
    var state = this.state.copyWith();
    playing ? play() : pause();
    emit(state);
  }

  void onScrubbed(double value) {
    Duration seekTo = Duration(milliseconds: value.toInt());
    seek(seekTo);
    emit(state.copyWith(audioPosition: seekTo));
  }

  void onScrubDrag(double value) {
    Duration seekTo = Duration(milliseconds: value.toInt());
    emit(state.copyWith(audioPosition: seekTo));
  }

  @override
  void toggleControls(bool visible) {
    emit(state.copyWith(disableControls: !visible));
  }

  @override
  bool isPlaying() {
    return playing;
  }

  @override
  void play() {
    audioPlayer?.play();
    player.setEvent(
        const MediaEvent(state: MediaState.playing, type: MediaEventType.play));
  }

  @override
  void seek(Duration position) {
    audioPlayer?.seek(position);
    player.setEvent(
        const MediaEvent(state: MediaState.playing, type: MediaEventType.seek));
    player.setEvent(MediaEvent(
        state: MediaState.playing,
        type: MediaEventType.progress,
        value: position));
  }

  @override
  void pause() {
    audioPlayer?.pause();
    player.setEvent(const MediaEvent(
        state: MediaState.playing, type: MediaEventType.pause));
  }

  @override
  Duration? bufferedPosition() {
    return audioPlayer?.bufferedPosition;
  }

  @override
  Duration position() {
    return state.audioPosition;
  }

  @override
  double? speed() {
    return 1;
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

  bool supportsPip() {
    return false;
  }

  void enterPip() {}

  @override
  bool isMuted() {
    return (audioPlayer?.volume ?? 0) == 0;
  }

  @override
  void toggleVolume(bool soundOn) {
    audioPlayer?.setVolume(soundOn ? 1 : 0);
  }

  @override
  void setSpeed(double d) {
    audioPlayer?.setSpeed(d);
    settings.setLastSpeed(d);
  }

  @override
  double getSpeed() {
    return audioPlayer?.speed ?? 1;
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
    return audioPlayer?.duration ?? const Duration(milliseconds: 1);
  }

  void onBufferChanged(Duration event) {
    EasyThrottle.throttle('audio-buffering', const Duration(seconds: 1), () {
      player.setEvent(MediaEvent(
          state: MediaState.playing,
          type: MediaEventType.bufferChanged,
          value: event));
    });
  }

  bool get playing => audioPlayer?.playing ?? false;
}

@freezed
class AudioPlayerState extends MediaPlayerState with _$AudioPlayerState {
  const factory AudioPlayerState({
    @Default(Duration(milliseconds: 1)) Duration audioLength,
    @Default(Duration.zero) Duration audioPosition,
    @Default(0) int previousSponsorCheck,
    Video? video,
    DownloadedVideo? offlineVideo,
    bool? playNow,
    bool? disableControls,
    @Default(false) bool loading,
    String? error,
  }) = _AudioPlayerState;

  double get progress =>
      audioPosition.inMilliseconds / audioLength.inMilliseconds;

  const AudioPlayerState._();
}
