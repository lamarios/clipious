import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:invidious/controllers/interfaces/playerController.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/mediaEvent.dart';

import '../../controllers/playerControlController.dart';
import '../../utils.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key});

  showPlaybackSpeedSelection(BuildContext context, PlayerController _) {
    Navigator.of(context).pop();
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) {
        const double minValue = 0.25, maxValue = 6;
        return StatefulBuilder(
          builder: (context, setState) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Slider(
                min: minValue,
                max: maxValue,
                divisions: maxValue ~/ minValue -1,
                value: _.getSpeed(),
                label: '${_.getSpeed().toStringAsFixed(2)}x',
                onChanged: (value) => setState(() => _.setSpeed(value)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () => setState(() => _.setSpeed(max(minValue, _.getSpeed() - 0.25))), icon: const Icon(Icons.remove)),
                  SizedBox(
                      width: 50,
                      child: Text(
                        '${_.getSpeed().toStringAsFixed(2)}x',
                        textAlign: TextAlign.center,
                      )),
                  IconButton(onPressed: () => setState(() => _.setSpeed(min(maxValue, _.getSpeed() + 0.25))), icon: const Icon(Icons.add)),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  showPlayerTrackSelection(BuildContext context, PlayerControlController _, {required List<String> tracks, required int selected, required Function(int index) onSelected}) {
    List<ListTile> widgets = [];

    for (int i = 0; i < tracks.length; i++) {
      widgets.add(ListTile(
          onTap: () {
            Navigator.of(context).pop();
            onSelected(i);
          },
          leading: selected == i ? const Icon(Icons.check) : const SizedBox.shrink(),
          title: Text(tracks[i])));
    }

    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: widgets,
          ),
        );
      },
    );
  }

  showOptionMenu(BuildContext context, PlayerControlController _, PlayerController pc) {
    var locals = AppLocalizations.of(context)!;

    var videoTracks = pc.getVideoTracks();
    var audioTracks = pc.getAudioTracks();
    var subtitles = pc.getSubtitles();

    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (ctx) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () => showPlaybackSpeedSelection(context, pc),
                leading: const Icon(Icons.speed),
                title: Text(locals.playbackSpeed),
              ),
              if (subtitles.isNotEmpty)
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    showPlayerTrackSelection(
                      context,
                      _,
                      tracks: subtitles,
                      selected: pc.selectedSubtitle(),
                      onSelected: pc.selectSubtitle,
                    );
                  },
                  leading: const Icon(Icons.subtitles),
                  title: Text(locals.subtitles),
                ),
              if (videoTracks.isNotEmpty)
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    showPlayerTrackSelection(
                      context,
                      _,
                      tracks: videoTracks,
                      selected: pc.selectedVideoTrack(),
                      onSelected: pc.selectVideoTrack,
                    );
                  },
                  leading: const Icon(Icons.hd),
                  title: Text(locals.quality),
                ),
              if (audioTracks.isNotEmpty)
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    showPlayerTrackSelection(
                      context,
                      _,
                      tracks: audioTracks,
                      selected: pc.selectedAudioTrack(),
                      onSelected: pc.selectAudioTrack,
                    );
                  },
                  leading: const Icon(Icons.music_note),
                  title: Text(locals.audio),
                ),
              if (pc.hasDashToggle())
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    pc.toggleDash();
                  },
                  leading: Icon(
                    Icons.stream,
                    color: pc.isUsingDash() ? Colors.green : null,
                  ),
                  title: Text(locals.useDash),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MiniPlayerController? mpc = MiniPlayerController.to();
    PlayerController? pc = mpc?.playerController;

    if (mpc == null || pc == null) {
      return const SizedBox.shrink();
    }

    var textTheme = Theme.of(context).textTheme;

    return Theme(
      data: ThemeData(useMaterial3: true, colorScheme: darkColorScheme, progressIndicatorTheme: ProgressIndicatorThemeData(circularTrackColor: darkColorScheme.secondaryContainer.withOpacity(0.8))),
      child: GetBuilder<PlayerControlController>(
        init: PlayerControlController(),
        builder: (_) {
          var event = _.event;
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: !mpc.isMini ? _.showControls : null,
            onVerticalDragEnd: pc.isFullScreen() == FullScreenState.fullScreen ? null : mpc.videoDraggedEnd,
            onVerticalDragUpdate: pc.isFullScreen() == FullScreenState.fullScreen ? null : mpc.videoDragged,
            onVerticalDragStart: pc.isFullScreen() == FullScreenState.fullScreen ? null : mpc.videoDragStarted,
            child: Padding(
              padding: EdgeInsets.all(mpc.isMini ? 8 : 0.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: mpc.isMini
                          ? const SizedBox.shrink()
                          : _.displayControls && !mpc.isMini
                              ? Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(0), color: Colors.black.withOpacity(0.6)),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          if (pc.supportsPip()) IconButton(onPressed: pc.enterPip, icon: const Icon(Icons.picture_in_picture)),
                                          IconButton(onPressed: () => showOptionMenu(context, _, pc), icon: const Icon(Icons.more_vert))
                                        ],
                                      ),
                                      Expanded(child: Container()),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          pc.isMuted()
                                              ? IconButton(onPressed: () => pc.toggleVolume(true), icon: const Icon(Icons.volume_off))
                                              : IconButton(onPressed: () => pc.toggleVolume(false), icon: const Icon(Icons.volume_up)),
                                          switch (pc.isFullScreen()) {
                                            FullScreenState.fullScreen => IconButton(onPressed: () => pc.setFullScreen((false)), icon: const Icon(Icons.fullscreen_exit)),
                                            FullScreenState.notFullScreen => IconButton(onPressed: () => pc.setFullScreen(true), icon: const Icon(Icons.fullscreen)),
                                            _ => const SizedBox.shrink()
                                          }
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 0.0, right: 8),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                height: 25,
                                                child: Slider(
                                                  min: 0,
                                                  value: min(_.audioPosition.inMilliseconds.toDouble(), pc.duration().inMilliseconds.toDouble()),
                                                  max: pc.duration().inMilliseconds.toDouble(),
                                                  secondaryTrackValue: pc.bufferedPosition()?.inMilliseconds.toDouble(),
                                                  onChangeEnd: _.onScrubbed,
                                                  onChanged: _.onScrubDrag,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '${prettyDuration(pc.position())} / ${prettyDuration(pc.duration())}',
                                              style: textTheme.bodySmall?.copyWith(color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox.expand(),
                    ),
                    if (_.displayControls)
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (mpc.hasQueue)
                              IconButton(
                                  onPressed: () => mpc.playPrevious(),
                                  icon: const Icon(
                                    Icons.skip_previous,
                                    size: 40,
                                  )),
                            IconButton(
                                onPressed: () => mpc.rewind(),
                                icon: const Icon(
                                  Icons.fast_rewind,
                                  size: 50,
                                )),
                            IconButton(
                              onPressed: () => mpc.togglePlaying(),
                              icon: Icon(mpc.isPlaying ? Icons.pause : Icons.play_arrow, size: 75),
                            ),
                            IconButton(
                                onPressed: () => mpc.fastForward(),
                                icon: const Icon(
                                  Icons.fast_forward,
                                  size: 50,
                                )),
                            if (mpc.hasQueue)
                              IconButton(
                                  onPressed: () => mpc.playNext(),
                                  icon: const Icon(
                                    Icons.skip_next,
                                    size: 40,
                                  )),
                          ],
                        ),
                      ),
                    if (event.state == MediaState.buffering)
                      const Center(
                        child: FractionallySizedBox(
                          heightFactor: 0.3,
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              )),
                        ),
                      )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
