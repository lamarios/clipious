import 'package:better_player/better_player.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/playerController.dart';
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/db/settings.dart';
import 'package:logging/logging.dart';

enum Tabs {
  video,
  audio,
  captions,
  playbackSpeed;
}

class TvPlayerSettingsController extends GetxController {
  final Logger log = Logger('TvSettingsController');
  Tabs selected = Tabs.video;
  bool useDash = db.getSettings(USE_DASH)?.value == 'true';

  List<String> get videoTrackNames => useDash || (PlayerController.to()?.video.liveNow ?? false)
      ? PlayerController.to()?.videoController?.betterPlayerAsmsTracks.map((e) => '${e.height}p').toSet().toList() ?? []
      : PlayerController.to()?.videoController?.betterPlayerDataSource?.resolutions?.keys.toList() ?? [];

  List<String> get audioTrackNames => useDash ? PlayerController.to()?.videoController?.betterPlayerAsmsAudioTracks?.map((e) => '${e.label}').toList() ?? [] : [];

  List<String> get availableCaptions => PlayerController.to()?.videoController?.betterPlayerSubtitlesSourceList.map((e) => '${e.name}').toList() ?? [];
  final List<String> playbackSpeeds = ['0.5x', '0.75x', '1x', '1.25x', '1.5x', '1.75x', '2x', '2.25x', '2.5x', '2.75x', '3x'];

  BetterPlayerController? get videoController => PlayerController.to()?.videoController;

  videoButtonFocusChange(bool focus) {
    print('Focus changed $focus');
    if (focus) {
      selected = Tabs.video;
      update();
    }
  }

  audioButtonFocusChange(bool focus) {
    if (focus) {
      selected = Tabs.audio;
      update();
    }
  }

  captionsButtonFocusChange(bool focus) {
    if (focus) {
      selected = Tabs.captions;
      update();
    }
  }

  playbackSpeedButtonFocusChange(bool focus) {
    if (focus) {
      selected = Tabs.playbackSpeed;
      update();
    }
  }

  changeVideoTrack(String selected) {
    log.info('Video quality selected $selected');

    if (useDash) {
      BetterPlayerAsmsTrack? track = videoController?.betterPlayerAsmsTracks.firstWhere((element) => '${element.height}p' == selected);

      if (track != null) {
        log.info('Changing video track to $selected');
        videoController?.setTrack(track);
      }
    } else {
      String? url = videoController?.betterPlayerDataSource?.resolutions?[selected];
      if (url != null) {
        videoController?.setResolution(url);
      }
    }
    update();
  }

  changeChangeAudioTrack(String selected) {
    log.info('Audio quality selected $selected');
    BetterPlayerAsmsAudioTrack? track = videoController?.betterPlayerAsmsAudioTracks?.firstWhere((e) => '${e.label}' == selected);

    if (track != null) {
      log.info('Changing audio track to $selected');
      videoController?.setAudioTrack(track);
    }
    update();
  }

  changeSubtitles(String selected) {
    log.info('Subtitles selected $selected');
    BetterPlayerSubtitlesSource? track = videoController?.betterPlayerSubtitlesSourceList.firstWhere((e) => '${e.name}' == selected);

    db.saveSetting(SettingsValue(LAST_SUBTITLE, selected));

    if (track != null) {
      log.info('Changing subtitles to $selected');
      videoController?.setupSubtitleSource(track);
    }
    update();
  }

  changePlaybackSpeed(String selected) {
    String speed = selected.replaceAll('x', '');
    videoController?.setSpeed(double.parse(speed));

    update();
  }
}
