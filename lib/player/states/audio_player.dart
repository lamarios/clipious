import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/player/states/interfaces/media_player.dart';
import 'package:invidious/videos/models/video.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logging/logging.dart';

import '../../settings/states/settings.dart';
import '../../videos/models/adaptive_format.dart';
import '../models/mediaEvent.dart';
import 'player.dart' as clipious_player;

part 'audio_player.g.dart';

Logger log = Logger('AudioPlayerController');

class AudioPlayerCubit extends MediaPlayerCubit<AudioPlayerState> {
  final clipious_player.PlayerCubit globalPlayer;
  final SettingsCubit settings;

  AudioPlayerCubit(super.initialState, this.globalPlayer, this.settings) {
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
    state.player?.dispose();
  }

  initPlayer() {
    if (state.player == null) {
      state.player = AudioPlayer();
      state.player?.playerStateStream.listen(onStateStreamChange);
      state.player?.positionStream.listen(onPositionChanged);
      state.player?.durationStream.listen(onDurationChanged);
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
        globalPlayer.setEvent(MediaEvent(state: MediaState.loading));
        break;
      case ProcessingState.buffering:
        globalPlayer.setEvent(MediaEvent(state: MediaState.buffering));
        break;
      case ProcessingState.ready:
        globalPlayer.setEvent(MediaEvent(state: MediaState.ready));
        break;
      case ProcessingState.completed:
        globalPlayer.setEvent(MediaEvent(state: MediaState.completed));
        break;
    }
  }

  onDurationChanged(Duration? duration) async {
    var state = this.state.copyWith();
    state.loading = false;
    if (!isClosed) emit(state);
  }

  onPositionChanged(Duration position) {
    state.audioPosition = position;
    globalPlayer.setEvent(MediaEvent(state: MediaState.playing, type: MediaEventType.progress, value: position));
  }

  @override
  playVideo(bool offline, {Duration? startAt}) async {
    if (state.video != null || state.offlineVideo != null) {
      // disposeControllers();
      initPlayer();
      var state = this.state.copyWith();
      state.audioPosition = Duration.zero;
      state.audioLength = Duration(seconds: offline ? state.offlineVideo!.lengthSeconds : state.video!.lengthSeconds);
      state.loading = true;
      globalPlayer.setEvent(MediaEvent(state: MediaState.loading));
      try {
        AudioSource? source;

        if (!offline) {
          AdaptiveFormat? audio = state.video?.adaptiveFormats.where((element) => element.type.contains("audio")).sortByReversed((e) => int.parse(e.bitrate ?? "0")).first;
          if (audio != null) {
            if (startAt == null) {
              double progress = db.getVideoProgress(state.video!.videoId);
              if (progress > 0 && progress < 0.90) {
                startAt = Duration(seconds: (state.video!.lengthSeconds * progress).floor());
              }
            }
            emit(state);
            source = AudioSource.uri(Uri.parse(audio.url));
          }
        } else {
          String path = await state.offlineVideo!.mediaPath;
          source = AudioSource.file(path);
        }

        if (source == null) {
          throw Error();
        }

        await state.player?.setAudioSource(source, initialPosition: startAt);

        play();
        // TODO: make this less duplicated between videos and audio
        double speed = 1.0;
        if (settings.state.rememberPlayBackSpeed) {
          speed = settings.state.lastSpeed;

          log.fine("Setting playback speed to $speed");
          state.player?.setSpeed(speed);
        }
      } catch (e) {
        log.severe("Couldn't play video", e);
        state.error = e.toString();
        state.loading = false;
        if (!isClosed) emit(state);
      }
    }
  }

  @override
  void switchToOfflineVideo(DownloadedVideo v) {
    state.video = null;
    state.offlineVideo = v;
    playVideo(true);
  }

  @override
  void switchVideo(Video video, {Duration? startAt}) async {
    state.offlineVideo = null;
    state.video = video;
    playVideo(false, startAt: startAt);
  }

  @override
  void togglePlaying() {
    var state = this.state.copyWith();
    state.playing ? play() : pause();
    emit(state);
  }

  void onScrubbed(double value) {
    var state = this.state.copyWith();
    Duration seekTo = Duration(milliseconds: value.toInt());
    seek(seekTo);
    state.audioPosition = seekTo;
    emit(state);
  }

  void onScrubDrag(double value) {
    var state = this.state.copyWith();
    Duration seekTo = Duration(milliseconds: value.toInt());
    state.audioPosition = seekTo;
    emit(state);
  }

  @override
  void toggleControls(bool visible) {
    var state = this.state.copyWith();
    state.disableControls = !visible;
    emit(state);
  }

  @override
  bool isPlaying() {
    return state.playing;
  }

  @override
  void play() {
    state.player?.play();
    globalPlayer.setEvent(MediaEvent(state: MediaState.playing, type: MediaEventType.play));
  }

  @override
  void seek(Duration position) {
    state.player?.seek(position);
    globalPlayer.setEvent(MediaEvent(state: MediaState.playing, type: MediaEventType.seek));
  }

  @override
  void pause() {
    state.player?.pause();
    globalPlayer.setEvent(MediaEvent(state: MediaState.playing, type: MediaEventType.pause));
  }

  @override
  Duration? bufferedPosition() {
    return state.player?.bufferedPosition;
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
    return (state.player?.volume ?? 0) == 0;
  }

  @override
  void toggleVolume(bool soundOn) {
    state.player?.setVolume(soundOn ? 1 : 0);
  }

  @override
  void setSpeed(double d) {
    state.player?.setSpeed(d);
    settings.setLastSpeed(d);
  }

  @override
  double getSpeed() {
    return state.player?.speed ?? 1;
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
    return state.player?.duration ?? const Duration(milliseconds: 1);
  }
}

@CopyWith(constructor: "_")
class AudioPlayerState extends MediaPlayerState {
  AudioPlayer? player;

  AudioPlayerState({Video? video, DownloadedVideo? offlineVideo}) : super(video: video, offlineVideo: offlineVideo);

  double get progress => audioPosition.inMilliseconds / audioLength.inMilliseconds;
  Duration audioLength = const Duration(milliseconds: 1);
  Duration audioPosition = const Duration(milliseconds: 0);
  int previousSponsorCheck = 0;

  bool get playing => player?.playing ?? false;
  bool loading = false;
  String? error;

  AudioPlayerState._(this.player, this.audioLength, this.audioPosition, this.previousSponsorCheck, this.loading, this.error,
      {Video? video, DownloadedVideo? offlineVideo, bool? disableControls, bool? playNow})
      : super(video: video, offlineVideo: offlineVideo, disableControls: disableControls, playNow: playNow);
}
