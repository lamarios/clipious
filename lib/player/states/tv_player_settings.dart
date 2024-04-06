import 'package:river_player/river_player.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/player/states/video_player.dart';
import 'package:logging/logging.dart';

import '../../settings/states/settings.dart';

part 'tv_player_settings.freezed.dart';

const List<String> tvAvailablePlaybackSpeeds = [
  '0.5x',
  '0.75x',
  '1x',
  '1.25x',
  '1.5x',
  '1.75x',
  '2x',
  '2.25x',
  '2.5x',
  '2.75x',
  '3x'
];
final Logger log = Logger('TvSettingsController');

enum Tabs {
  video,
  audio,
  captions,
  playbackSpeed;
}

class TvPlayerSettingsCubit extends Cubit<TvPlayerSettingsState> {
  final VideoPlayerCubit player;
  final SettingsCubit settings;

  TvPlayerSettingsCubit(super.initialState, this.player, this.settings);

  List<String> get videoTrackNames =>
      settings.state.useDash || (player.state.video?.liveNow ?? false)
          ? player.videoController?.betterPlayerAsmsTracks
                  .map((e) => '${e.height}p')
                  .toSet()
                  .toList() ??
              []
          : player.videoController?.betterPlayerDataSource?.resolutions?.keys
                  .toList() ??
              [];

  List<String> get audioTrackNames => settings.state.useDash
      ? player.videoController?.betterPlayerAsmsAudioTracks
              ?.map((e) => '${e.label}')
              .toList() ??
          []
      : [];

  List<String> get availableCaptions =>
      player.videoController?.betterPlayerSubtitlesSourceList
          .map((e) => '${e.name}')
          .toList() ??
      [];

  BetterPlayerController? get videoController => player.videoController;

  videoButtonFocusChange(bool focus) {
    if (focus) {
      emit(state.copyWith(selected: Tabs.video));
    }
  }

  audioButtonFocusChange(bool focus) {
    if (focus) {
      emit(state.copyWith(selected: Tabs.audio));
    }
  }

  captionsButtonFocusChange(bool focus) {
    if (focus) {
      emit(state.copyWith(selected: Tabs.captions));
    }
  }

  playbackSpeedButtonFocusChange(bool focus) {
    if (focus) {
      emit(state.copyWith(selected: Tabs.playbackSpeed));
    }
  }

  changeVideoTrack(String selected) {
    log.fine('Video quality selected $selected');

    if (settings.state.useDash) {
      BetterPlayerAsmsTrack? track = videoController?.betterPlayerAsmsTracks
          .firstWhere((element) => '${element.height}p' == selected);

      if (track != null) {
        log.fine('Changing video track to $selected');
        videoController?.setTrack(track);
      }
    } else {
      String? url =
          videoController?.betterPlayerDataSource?.resolutions?[selected];
      if (url != null) {
        videoController?.setResolution(url);
      }
    }
  }

  changeChangeAudioTrack(String selected) {
    log.fine('Audio quality selected $selected');
    BetterPlayerAsmsAudioTrack? track = videoController
        ?.betterPlayerAsmsAudioTracks
        ?.firstWhere((e) => '${e.label}' == selected);

    if (track != null) {
      log.fine('Changing audio track to $selected');
      videoController?.setAudioTrack(track);
    }
  }

  changeSubtitles(String selected) {
    log.fine('Subtitles selected $selected');
    BetterPlayerSubtitlesSource? track = videoController
        ?.betterPlayerSubtitlesSourceList
        .firstWhere((e) => '${e.name}' == selected);

    settings.setLastSubtitle(selected);

    if (track != null) {
      log.fine('Changing subtitles to $selected');
      videoController?.setupSubtitleSource(track);
    }
  }

  changePlaybackSpeed(String selected) {
    String speed = selected.replaceAll('x', '');
    videoController?.setSpeed(double.parse(speed));
  }
}

@freezed
class TvPlayerSettingsState with _$TvPlayerSettingsState {
  const factory TvPlayerSettingsState({@Default(Tabs.video) Tabs selected}) =
      _TvPlayerSettingsState;
}
