import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/downloads/states/download_manager.dart';
import 'package:invidious/downloads/states/downloaded_video.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/player/states/player.dart';

import '../../../videos/views/components/compact_video.dart';

class DownloadedVideoView extends StatelessWidget {
  final DownloadedVideo video;

  const DownloadedVideoView({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;

    var downloadManager = context.read<DownloadManagerCubit>();
    var player = context.read<PlayerCubit>();
    return BlocProvider(
      create: (BuildContext context) =>
          DownloadedVideoCubit(downloadManager, DownloadedVideoState.init(video.id), player),
      child: BlocBuilder<DownloadedVideoCubit, DownloadedVideoState>(builder: (context, _) {
        bool downloadFailed = _.video?.downloadFailed ?? false;
        var cubit = context.read<DownloadedVideoCubit>();

        return _.video != null
            ? Stack(
                children: [
                  AnimatedOpacity(
                    opacity: (downloadFailed) ? 0.5 : 1,
                    duration: animationDuration,
                    child: CompactVideo(
                      offlineVideo: _.video,
                      onTap: downloadFailed ? cubit.retryDownload : cubit.playVideo,
                      trailing: [
                        (_.video?.audioOnly ?? false)
                            ? Icon(
                                Icons.audiotrack,
                                color: colors.secondary,
                              )
                            : const SizedBox.shrink(),
                        (_.video?.downloadComplete ?? false) || downloadFailed
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: TweenAnimationBuilder(
                                      duration: animationDuration,
                                      tween: Tween<double>(begin: 0, end: _.progress),
                                      builder: (context, value, child) {
                                        return CircularProgressIndicator(
                                          strokeWidth: 2,
                                          value: _.progress == 0 ? null : value,
                                        );
                                      }),
                                ),
                              )
                      ],
                    ),
                  ),
                  downloadFailed
                      ? Positioned(
                          right: 10,
                          bottom: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                color: colors.secondaryContainer, borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Text(
                                      locals.videoFailedDownloadRetry,
                                      style: textTheme.bodySmall,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ))
                      : const SizedBox.shrink()
                ],
              )
            : const Icon(Icons.clear);
      }),
    );
  }
}
