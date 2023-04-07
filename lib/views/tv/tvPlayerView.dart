import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/tvPlayerController.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/tv/tvPlayerSettings.dart';
import 'package:invidious/views/video/player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../globals.dart';
import '../../models/video.dart';

class TvPlayerView extends StatelessWidget {
  final Video video;

  const TvPlayerView({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    return Scaffold(
      body: GetBuilder<TvPlayerController>(
        init: TvPlayerController(),
        builder: (_) => Focus(
          autofocus: false,
          onKeyEvent: (node, event) => _.handleRemoteEvents(node, event),
          child: Stack(
            children: [
              VideoPlayer(
                video: video,
                miniPlayer: false,
                playNow: true,
                disableControls: true,
              ),
              Positioned(
                top: 20,
                right: 20,
                child: AnimatedOpacity(
                  opacity: _.buffering ? 1 : 0,
                  duration: animationDuration,
                  child: const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              Positioned(
                  child: AnimatedOpacity(
                opacity: _.controlsOpacity,
                duration: animationDuration,
                child: Container(
                    alignment: Alignment.topCenter,
                    height: 200,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                       Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.7),
                      ],
                    )),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: _.showSettings
                          ? const TvPlayerSettings()
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  locals.pressDownToShowSettings,
                                  style: TextStyle(fontSize: 20),
                                ),
                                const Icon(
                                  Icons.expand_more,
                                  size: 30,
                                ),
                              ],
                            ),
                    )),
              )),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                  opacity: _.controlsOpacity,
                  duration: animationDuration,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(0),
                      ],
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${prettyDuration(_.currentPosition)} / ${prettyDuration(_.videoLength)}',
                                style: const TextStyle(color: Colors.white, fontSize: 24),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                _.isPlaying ? Icons.pause : Icons.play_arrow,
                                size: 50,
                              ),
                              Expanded(
                                  child: Container(
                                      color: Colors.black.withOpacity(0.5),
                                      child: AnimatedFractionallySizedBox(
                                        alignment: Alignment.centerLeft,
                                        duration: animationDuration,
                                        widthFactor: _.progress,
                                        child: Container(
                                          height: 4,
                                          color: Colors.white,
                                        ),
                                      )))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
