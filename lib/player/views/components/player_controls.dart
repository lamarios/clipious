import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/main.dart';
import 'package:clipious/player/states/interfaces/media_player.dart';
import 'package:clipious/player/states/player.dart';
import 'package:clipious/settings/states/settings.dart';

import '../../../utils.dart';
import '../../../videos/models/video.dart';
import '../../states/audio_player.dart';
import '../../states/player_controls.dart';
import '../../states/video_player.dart';

class PlayerControls extends StatelessWidget {
  final MediaPlayerCubit? mediaPlayerCubit;

  const PlayerControls({super.key, this.mediaPlayerCubit});

  showPlaybackSpeedSelection(BuildContext context, MediaPlayerCubit player) {
    Navigator.of(context).pop();
    showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        const double minValue = 0.1, maxValue = 6;
        return StatefulBuilder(
          builder: (context, setState) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Slider(
                min: minValue,
                max: maxValue,
                divisions: maxValue ~/ minValue - 1,
                value: player.getSpeed(),
                label: '${player.getSpeed().toStringAsFixed(2)}x',
                onChanged: (value) => setState(() => player.setSpeed(value)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => setState(() => player.setSpeed(
                          max(minValue, player.getSpeed() - minValue))),
                      icon: const Icon(Icons.remove)),
                  SizedBox(
                      width: 50,
                      child: Text(
                        '${player.getSpeed().toStringAsFixed(2)}x',
                        textAlign: TextAlign.center,
                      )),
                  IconButton(
                      onPressed: () => setState(() => player.setSpeed(
                          min(maxValue, player.getSpeed() + minValue))),
                      icon: const Icon(Icons.add)),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  showPlayerTrackSelection(BuildContext context, PlayerControlsState _,
      {required List<String> tracks,
      required int selected,
      required Function(int index) onSelected}) {
    List<ListTile> widgets = [];

    for (int i = 0; i < tracks.length; i++) {
      widgets.add(ListTile(
          onTap: () {
            Navigator.of(context).pop();
            onSelected(i);
          },
          leading:
              selected == i ? const Icon(Icons.check) : const SizedBox.shrink(),
          title: Text(tracks[i])));
    }

    showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
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

  showOptionMenu(BuildContext context, PlayerControlsState controls) {
    late MediaPlayerCubit pc;
    var player = context.read<PlayerCubit>();
    if (mediaPlayerCubit != null) {
      pc = mediaPlayerCubit!;
    } else if (player.state.isAudio) {
      pc = context.read<AudioPlayerCubit>();
    } else {
      pc = context.read<VideoPlayerCubit>();
    }
    var locals = AppLocalizations.of(context)!;
    var videoTracks = pc.getVideoTracks();
    var audioTracks = pc.getAudioTracks();
    var subtitles = pc.getSubtitles();

    showModalBottomSheet(
      isScrollControlled: true,
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
                      controls,
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
                      controls,
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
                      controls,
                      tracks: audioTracks,
                      selected: pc.selectedAudioTrack(),
                      onSelected: pc.selectAudioTrack,
                    );
                  },
                  leading: const Icon(Icons.music_note),
                  title: Text(locals.audio),
                ),
              if (pc.hasDashToggle() &&
                  !(player.state.currentlyPlaying?.liveNow ?? false))
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
    var locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;
    var player = context.read<PlayerCubit>();
    return Theme(
      data: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          progressIndicatorTheme: ProgressIndicatorThemeData(
              circularTrackColor:
                  darkColorScheme.secondaryContainer.withOpacity(0.8))),
      child: BlocProvider(
        create: (context) =>
            PlayerControlsCubit(const PlayerControlsState(), player),
        child: BlocBuilder<PlayerControlsCubit, PlayerControlsState>(
          builder: (context, playerState) {
            bool isMini =
                context.select((PlayerCubit cubit) => cubit.state.isMini);
            bool isPlaying =
                context.select((PlayerCubit cubit) => cubit.state.isPlaying);
            Video? currentlyPlaying = context
                .select((PlayerCubit cubit) => cubit.state.currentlyPlaying);
            bool hasQueue =
                context.select((PlayerCubit cubit) => cubit.state.hasQueue);
            bool isPip =
                context.select((PlayerCubit cubit) => cubit.state.isPip);
            int totalFastForward = context
                .select((PlayerCubit cubit) => cubit.state.totalFastForward);
            int totalRewind =
                context.select((PlayerCubit cubit) => cubit.state.totalRewind);
            String videoTitle = context.select((PlayerCubit cubit) =>
                cubit.state.currentlyPlaying?.title ??
                cubit.state.offlineCurrentlyPlaying?.title ??
                '');

            bool isPausedAndDone = playerState.position.inMilliseconds >
                    player.duration.inMilliseconds * 0.99 &&
                context.select((SettingsCubit value) =>
                    value.state.playerRepeatMode == PlayerRepeat.noRepeat);

            var cubit = context.read<PlayerControlsCubit>();
            return BlocListener<PlayerCubit, PlayerState>(
              listenWhen: (previous, current) =>
                  previous.mediaEvent != current.mediaEvent,
              listener: (BuildContext context, state) {
                cubit.onStreamEvent(state.mediaEvent);
              },
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onVerticalDragEnd:
                    playerState.fullScreenState == FullScreenState.fullScreen ||
                            playerState.displayControls
                        ? null
                        : player.videoDraggedEnd,
                onVerticalDragUpdate:
                    playerState.fullScreenState == FullScreenState.fullScreen ||
                            playerState.displayControls
                        ? null
                        : player.videoDragged,
                onVerticalDragStart:
                    playerState.fullScreenState == FullScreenState.fullScreen ||
                            playerState.displayControls
                        ? null
                        : player.videoDragStarted,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      if (!isMini && playerState.showSponsorBlocked)
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.fast_forward,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    locals.sponsorSkipped,
                                    style: textTheme.bodySmall
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                                .animate()
                                .slideX(
                                    duration: animationDuration,
                                    curve: Curves.easeInOutQuad)
                                .fadeIn(duration: animationDuration)
                                .fadeOut(
                                    delay: const Duration(seconds: 1),
                                    duration: animationDuration)
                                .slideX(
                                    end: -0.5,
                                    duration: animationDuration,
                                    curve: Curves.easeInOutQuad,
                                    delay: const Duration(seconds: 1))),
                      if (!isMini && !isPip)
                        Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Row(
                              children: [
                                Expanded(
                                    child: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: playerState.justDoubleTappedSkip
                                            ? cubit.doubleTapRewind
                                            : playerState.displayControls
                                                ? cubit.hideControls
                                                : cubit.showControls,
                                        onDoubleTap:
                                            playerState.justDoubleTappedSkip
                                                ? null
                                                : cubit.doubleTapRewind,
                                        child: DoubleTapButton(
                                            stepText:
                                                '-$totalRewind ${locals.secondsShortForm}',
                                            opacity: playerState
                                                .doubleTapRewindedOpacity,
                                            icon: Icons.fast_rewind))),
                                Expanded(
                                    child: GestureDetector(
                                        onTap: playerState.justDoubleTappedSkip
                                            ? cubit.doubleTapFastForward
                                            : playerState.displayControls
                                                ? cubit.hideControls
                                                : cubit.showControls,
                                        behavior: HitTestBehavior.translucent,
                                        onDoubleTap:
                                            playerState.justDoubleTappedSkip
                                                ? null
                                                : cubit.doubleTapFastForward,
                                        child: DoubleTapButton(
                                          stepText:
                                              '+$totalFastForward ${locals.secondsShortForm}',
                                          opacity: playerState
                                              .doubleTapFastForwardedOpacity,
                                          icon: Icons.fast_forward,
                                        ))),
                              ],
                            )),
                      if (playerState.errored)
                        Container(
                          color: Colors.black.withOpacity(0.8),
                          child: const Center(
                            child: Icon(Icons.error),
                          ),
                        ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: isMini || isPip
                            ? const SizedBox.shrink()
                            : playerState.displayControls
                                ? GestureDetector(
                                    onTap: cubit.hideControls,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          color: Colors.black.withOpacity(0.4)),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              if (playerState.fullScreenState ==
                                                  FullScreenState.fullScreen)
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text(
                                                    videoTitle,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: textTheme.bodyMedium
                                                        ?.copyWith(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.8)),
                                                  ),
                                                )),
                                              IconButton(
                                                  onPressed: () =>
                                                      player.enterPip(),
                                                  icon: const Icon(Icons
                                                      .picture_in_picture)),
                                              IconButton(
                                                  onPressed: () =>
                                                      showOptionMenu(
                                                          context, playerState),
                                                  icon: const Icon(
                                                      Icons.more_vert))
                                            ],
                                          ),
                                          Expanded(child: Container()),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              playerState.muted
                                                  ? IconButton(
                                                      onPressed: () {
                                                        player.setMuted(false);
                                                        cubit
                                                            .hideControlsDebounce();
                                                      },
                                                      icon: const Icon(
                                                          Icons.volume_off))
                                                  : IconButton(
                                                      onPressed: () {
                                                        player.setMuted(true);
                                                        cubit
                                                            .hideControlsDebounce();
                                                      },
                                                      icon: const Icon(
                                                          Icons.volume_up)),
                                              switch (
                                                  playerState.fullScreenState) {
                                                FullScreenState.fullScreen =>
                                                  IconButton(
                                                      onPressed: () =>
                                                          player.setFullScreen(
                                                              FullScreenState
                                                                  .notFullScreen),
                                                      icon: const Icon(Icons
                                                          .fullscreen_exit)),
                                                FullScreenState.notFullScreen =>
                                                  IconButton(
                                                      onPressed: () =>
                                                          player.setFullScreen(
                                                              FullScreenState
                                                                  .fullScreen),
                                                      icon: const Icon(
                                                          Icons.fullscreen)),
                                              }
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : const SizedBox.expand(),
                      ),
                      if ((playerState.displayControls ||
                              playerState.justDoubleTappedSkip) &&
                          !(currentlyPlaying?.liveNow ?? false))
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Stack(
                            children: [
                              Container(
                                decoration: playerState.justDoubleTappedSkip
                                    ? BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                            Colors.black.withOpacity(1),
                                            Colors.black.withOpacity(0)
                                          ]))
                                    : null,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, right: 8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                              height: 25,
                                              child: Slider(
                                                min: 0,
                                                value: min(
                                                    playerState
                                                        .position.inMilliseconds
                                                        .toDouble(),
                                                    playerState
                                                        .duration.inMilliseconds
                                                        .toDouble()),
                                                max: playerState
                                                    .duration.inMilliseconds
                                                    .toDouble(),
                                                secondaryTrackValue: min(
                                                    playerState
                                                        .buffer.inMilliseconds
                                                        .toDouble(),
                                                    playerState
                                                        .duration.inMilliseconds
                                                        .toDouble()),
                                                onChangeEnd: cubit.onScrubbed,
                                                onChanged: cubit.onScrubDrag,
                                              )),
                                        ),
                                        Text(
                                          '${prettyDuration(playerState.position)} / ${prettyDuration(playerState.duration)}',
                                          style: textTheme.bodySmall
                                              ?.copyWith(color: Colors.white),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      if (!isMini && !isPip && playerState.displayControls)
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (hasQueue)
                                IconButton(
                                    onPressed: () {
                                      player.playPrevious();
                                      cubit.removeError();
                                      cubit.hideControlsDebounce();
                                    },
                                    icon: const Icon(
                                      Icons.skip_previous,
                                      size: 20,
                                    )),
                              IconButton(
                                  onPressed: () => player.rewind(),
                                  icon: const Icon(
                                    Icons.fast_rewind,
                                    size: 30,
                                  )),
                              IconButton(
                                onPressed: () {
                                  if (isPlaying) {
                                    player.pause();
                                  } else if (isPausedAndDone) {
                                    player.seek(Duration.zero);
                                    player.play();
                                  } else {
                                    player.play();
                                  }
                                },
                                icon: Icon(
                                    isPlaying
                                        ? Icons.pause
                                        : isPausedAndDone
                                            ? Icons.refresh
                                            : Icons.play_arrow,
                                    size: 55),
                              ),
                              IconButton(
                                  onPressed: () => player.fastForward(),
                                  icon: const Icon(
                                    Icons.fast_forward,
                                    size: 30,
                                  )),
                              if (hasQueue)
                                IconButton(
                                    onPressed: () {
                                      player.playNext();
                                      cubit.removeError();
                                      cubit.hideControlsDebounce();
                                    },
                                    icon: const Icon(
                                      Icons.skip_next,
                                      size: 20,
                                    )),
                            ],
                          ),
                        ),
                      if (playerState.buffering)
                        const Center(
                          child: FractionallySizedBox(
                            heightFactor: 0.3,
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                )),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DoubleTapButton extends StatelessWidget {
  final double opacity;
  final IconData icon;
  final String stepText;

  const DoubleTapButton(
      {super.key,
      required this.opacity,
      required this.icon,
      required this.stepText});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return AnimatedContainer(
      curve: Curves.easeInOutQuad,
      margin: EdgeInsets.all(opacity == 1 ? 50 : 0),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(opacity == 1 ? 0.3 : 0),
          shape: BoxShape.circle),
      duration: const Duration(milliseconds: 150),
      height: double.infinity,
      child: AnimatedOpacity(
        opacity: opacity,
        duration: Duration(milliseconds: opacity == 1 ? 150 : 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
            ),
            Text(
              stepText,
              style: textTheme.bodySmall
                  ?.copyWith(color: Colors.white.withOpacity(0.8)),
            )
          ],
        ),
      ),
    );
  }
}
