import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/downloads/models/downloaded_video.dart';
import 'package:clipious/player/states/player.dart';
import 'package:clipious/player/views/components/mini_player_controls.dart';
import 'package:clipious/player/views/components/mini_player_progress.dart';

import '../../../videos/models/video.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return BlocBuilder<PlayerCubit, PlayerState>(
        buildWhen: (previous, current) => previous.isMini != current.isMini,
        builder: (context, controller) {
          return controller.isMini
              ? Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Builder(builder: (context) {
                        return Builder(builder: (context) {
                          DownloadedVideo? offlineVid = context.select(
                              (PlayerCubit value) =>
                                  value.state.offlineCurrentlyPlaying);
                          Video? vid = context.select((PlayerCubit value) =>
                              value.state.currentlyPlaying);

                          String title = vid?.title ?? offlineVid?.title ?? '';
                          String author =
                              vid?.author ?? offlineVid?.author ?? '';
                          String videoId =
                              vid?.videoId ?? offlineVid?.videoId ?? '';

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$title - $author',
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.bodySmall,
                              ),
                              MiniPlayerControls(
                                videoId: videoId,
                              ),
                              const MiniPlayerProgress(),
                            ],
                          );
                        });
                      }),
                    ),
                  ),
                ])
              : const SizedBox.shrink();
        });
  }
}
