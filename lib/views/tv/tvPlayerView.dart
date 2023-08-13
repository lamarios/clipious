import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/tvPlayerController.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/tv/tvButton.dart';
import 'package:invidious/views/tv/tvHorizontalVideoList.dart';
import 'package:invidious/views/tv/tvOverScan.dart';
import 'package:invidious/views/tv/tvPlayerControls.dart';
import 'package:invidious/views/tv/tvPlayerSettings.dart';
import 'package:invidious/views/video/player.dart';

import '../../globals.dart';
import '../../main.dart';
import '../../models/baseVideo.dart';
import '../../models/imageObject.dart';
import '../components/videoThumbnail.dart';

class TvPlayerView extends StatelessWidget {
  final List<BaseVideo> videos;

  const TvPlayerView({Key? key, required this.videos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    var locals = AppLocalizations.of(context)!;
    return Theme(
      data: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      child: Scaffold(
        body: GetBuilder<TvPlayerController>(
          init: TvPlayerController(videos),
          builder: (_) => Stack(
            children: [
              if (_.hasVideo)
                VideoPlayer(
                  video: _.currentlyPlaying,
                  miniPlayer: false,
                  playNow: true,
                  disableControls: true,
                ),
              const Positioned(top: 0, left: 0, right: 0, bottom: 0, child: TvPlayerControls())
            ],
          ),
        ),
      ),
    );
  }
}
