import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:invidious/controllers/downloadedVideoController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/db/downloadedVideo.dart';

import '../components/compactVideo.dart';

class DownloadedVideoView extends StatelessWidget {
  final DownloadedVideo video;

  const DownloadedVideoView({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    return GetBuilder<DownloadedVideoController>(
        global: false,
        init: DownloadedVideoController(video.id),
        builder: (_) {
          bool downloadFailed = _.video?.downloadFailed ?? false;

          return _.video != null
              ? Stack(
                  children: [
                    AnimatedOpacity(
                      opacity: (downloadFailed) ? 0.5 : 1,
                      duration: animationDuration,
                      child: CompactVideo(
                        offlineVideo: _.video,
                        onTap: downloadFailed ? _.retryDownload : _.playVideo,
                        trailing: [
                          (_.video?.audioOnly ?? false)
                              ? Icon(
                                  Icons.audiotrack,
                                  color: colors.secondary,
                                )
                              : const SizedBox.shrink(),
                          (_.video?.downloadComplete ?? false) || downloadFailed
                              ? const SizedBox.shrink()
                              : SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    value: _.progress == 0 ? null : _.progress,
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
                              decoration: BoxDecoration(color: colors.secondaryContainer, borderRadius: BorderRadius.circular(20)),
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
                                        style: TextStyle(fontSize: 11),
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
        });
  }
}
