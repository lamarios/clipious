import 'package:clipious/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/l10n/generated/app_localizations.dart';
import 'package:clipious/downloads/models/downloaded_video.dart';
import 'package:clipious/downloads/states/download_manager.dart';
import 'package:clipious/downloads/states/downloaded_video.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/player/states/player.dart';

import '../../../videos/views/components/compact_video.dart';

class DownloadedVideoView extends StatelessWidget {
  final DownloadedVideo video;

  const DownloadedVideoView({super.key, required this.video});

  openVideoSheet(BuildContext context, DownloadedVideo v) {
    var cubit = context.read<DownloadManagerCubit>();
    final locals = AppLocalizations.of(context)!;
    showSafeModalBottomSheet(
      enableDrag: true,
      showDragHandle: true,
      context: context,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 16,
              spacing: 16,
              children: [
                if (!v.downloadFailed && !v.downloadComplete)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton.filledTonal(
                          onPressed: () async {
                            Navigator.of(ctx).pop();
                            await cubit.deleteVideo(v);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(locals.videoDeleted)));
                            }
                          },
                          icon: const Icon(Icons.clear)),
                      Text(locals.cancel)
                    ],
                  ),
                if (v.downloadComplete)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton.filledTonal(
                          onPressed: () async {
                            Navigator.of(ctx).pop();
                            await cubit.copyToDownloadFolder(v);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          locals.fileCopiedToDownloadFolder)));
                            }
                          },
                          icon: const Icon(Icons.copy)),
                      Text(locals.copyToDownloadFolder)
                    ],
                  ),
                if (v.downloadFailed)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton.filledTonal(
                          onPressed: () async {
                            Navigator.of(ctx).pop();
                            await cubit.retryDownload(v);
                          },
                          icon: const Icon(Icons.refresh)),
                      Text(locals.retry)
                    ],
                  ),
                if (v.downloadComplete || v.downloadFailed)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton.filledTonal(
                          onPressed: () async {
                            Navigator.of(ctx).pop();
                            await cubit.deleteVideo(v);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(locals.videoDeleted)));
                            }
                          },
                          icon: const Icon(Icons.delete)),
                      Text(locals.delete)
                    ],
                  )
              ]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;

    var downloadManager = context.read<DownloadManagerCubit>();
    var player = context.read<PlayerCubit>();
    return BlocProvider(
      create: (BuildContext context) => DownloadedVideoCubit(
          downloadManager, DownloadedVideoState.init(video.videoId), player),
      child: BlocBuilder<DownloadedVideoCubit, DownloadedVideoState>(
          builder: (context, state) {
        bool downloadFailed = state.video?.downloadFailed ?? false;
        var cubit = context.read<DownloadedVideoCubit>();

        return state.video != null
            ? Stack(
                children: [
                  AnimatedOpacity(
                    opacity: (downloadFailed) ? 0.5 : 1,
                    duration: animationDuration,
                    child: CompactVideo(
                      offlineVideo: state.video,
                      onTap: downloadFailed || !state.video!.downloadComplete
                          ? () => openVideoSheet(context, state.video!)
                          : cubit.playVideo,
                      trailing: [
                        (state.video?.audioOnly ?? false)
                            ? Icon(
                                Icons.audiotrack,
                                color: colors.secondary,
                              )
                            : const SizedBox.shrink(),
                        (state.video?.downloadComplete ?? false) ||
                                downloadFailed
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: TweenAnimationBuilder(
                                      duration: animationDuration,
                                      tween: Tween<double>(
                                          begin: 0, end: state.progress),
                                      builder: (context, value, child) {
                                        return CircularProgressIndicator(
                                          strokeWidth: 2,
                                          value: state.progress == 0
                                              ? null
                                              : value,
                                        );
                                      }),
                                ),
                              ),
                        if (state.video?.downloadComplete ?? false)
                          IconButton(
                            onPressed: () => openVideoSheet(context, video),
                            icon: Icon(
                              Icons.more_vert,
                              color: colors.secondary,
                            ),
                            visualDensity: VisualDensity.compact,
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
                                color: colors.secondaryContainer,
                                borderRadius: BorderRadius.circular(20)),
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
