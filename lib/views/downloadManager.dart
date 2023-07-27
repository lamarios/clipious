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
            return _.videos.isNotEmpty
                ? Column(
                    children: [
                      FilledButton.tonal(
                          onPressed: _.canPlayAll ? _.playAll : null,
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
                          itemCount: _.videos.length,
                          itemBuilder: (context, index) {
                            var v = _.videos[index];
                            return SwipeActionCell(
                                key: ValueKey('downloaded-video-${v.id}'),
                                trailingActions: [
                                  SwipeAction(
                                    performsFirstActionWithFullSwipe: true,
                                    icon: const Icon(Icons.delete, color: Colors.white),
                                    onTap: (handler) async {
                                      await handler(true);
                                      _.deleteVideo(v);
                                    },
                                  )
                                ],
                                child: DownloadedVideoView(
                                  video: v,
                                ));
                          },
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(locals.noDownloadedVideos),
                  );
          },
        ),
      ),
    );
  }
}
