import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:invidious/views/downloadManager/downloadedVideo.dart';

import '../controllers/downloadController.dart';

class DownloadManager extends StatelessWidget {
  const DownloadManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(locals.downloads),
      ),
      body: SafeArea(
        bottom: false,
        child: GetBuilder<DownloadController>(
          init: DownloadController(),
          tag: 'dl',
          builder: (_) {
            return ListView.builder(
              itemCount: _.videos.length,
              itemBuilder: (context, index) {
                var v = _.videos[index];
                return SwipeActionCell(
                    key: ValueKey('downloaded-video-${v.id}'),
                    trailingActions: [
                      SwipeAction(
                        performsFirstActionWithFullSwipe: true,
                        icon: const Icon(Icons.delete, color: Colors.white),
                        onTap: (handler) => _.deleteVideo(handler, v),
                      )
                    ],
                    child: DownloadedVideoView(
                      video: v,
                      progress: _.downloadProgresses[v.videoId],
                    ));
              },
            );
          },
        ),
      ),
    );
  }
}
