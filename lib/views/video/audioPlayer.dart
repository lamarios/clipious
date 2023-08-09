import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/views/components/offlineVideoThumbnail.dart';

import '../../controllers/audioPlayerController.dart';
import '../../models/db/downloadedVideo.dart';
import '../../models/video.dart';
import '../../utils.dart';
import '../components/videoThumbnail.dart';

class AudioPlayer extends StatelessWidget {
  final Video? video;
  final DownloadedVideo? offlineVideo;
  final bool miniPlayer;

  const AudioPlayer({super.key, this.video, required this.miniPlayer, this.offlineVideo}) : assert(video == null || offlineVideo == null, 'cannot provide both video and offline video\n');

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    AppLocalizations locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;

    return GetBuilder<AudioPlayerController>(
      init: AudioPlayerController(offlineVideo: offlineVideo, video: video),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(miniPlayer ? 8 : 0.0),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                _.video != null
                    ? VideoThumbnailView(
                        videoId: _.video!.videoId,
                        thumbnailUrl: _.video?.getBestThumbnail()?.url ?? '',
                      )
                    : _.offlineVideo != null
                        ? OfflineVideoThumbnail(key: ValueKey(_.offlineVideo?.videoId ?? ''), video: _.offlineVideo!)
                        : const SizedBox.shrink(),
                !(_.disableControls ?? false) && !_.loading
                    ? Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black.withOpacity(0.8), Colors.black.withOpacity(0)])),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16.0, right: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Slider(
                                    min: 0,
                                    value: _.audioPosition.inMilliseconds.toDouble(),
                                    max: _.audioLength.inMilliseconds.toDouble(),
                                    onChangeEnd: _.onScrubbed,
                                    onChanged: _.onScrubDrag,
                                  ),
                                ),
                                Text(
                                  '${prettyDuration(_.audioPosition)} / ${prettyDuration(_.audioLength)}',
                                  style: textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : _.loading || _.error != null
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: _.loading
                                ? const Center(
                                    child: FractionallySizedBox(
                                      heightFactor: 0.3,
                                      child: AspectRatio(
                                          aspectRatio: 1,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          )),
                                    ),
                                  )
                                : Center(child: Text(_.error ?? '')),
                          )
                        : const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }
}
