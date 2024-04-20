import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:invidious/downloads/views/components/downloaded_video.dart';
import 'package:invidious/globals.dart';

import '../../states/download_manager.dart';

@RoutePage()
class DownloadManagerScreen extends StatelessWidget {
  const DownloadManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(locals.downloads),
      ),
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<DownloadManagerCubit, DownloadManagerState>(
          builder: (context, state) {
            var cubit = context.read<DownloadManagerCubit>();
            return state.videos.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: innerHorizontalPadding),
                    child: Column(
                      children: [
                        FilledButton.tonal(
                            onPressed:
                                cubit.canPlayAll() ? cubit.playAll : null,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(Icons.playlist_play),
                                ),
                                Text(locals.downloadsPlayAll)
                              ],
                            )),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.videos.length,
                            itemBuilder: (context, index) {
                              var v = state.videos[index];
                              return SwipeActionCell(
                                  key:
                                      ValueKey('downloaded-video-${v.videoId}'),
                                  trailingActions: [
                                    SwipeAction(
                                      performsFirstActionWithFullSwipe: true,
                                      icon: const Icon(Icons.delete,
                                          color: Colors.white),
                                      onTap: (handler) async {
                                        await handler(true);
                                        cubit.deleteVideo(v);
                                      },
                                    )
                                  ],
                                  child: DownloadedVideoView(
                                    key: ValueKey(v.videoId),
                                    video: v,
                                  ));
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(child: Text(locals.noDownloadedVideos)),
                  );
          },
        ),
      ),
    );
  }
}
