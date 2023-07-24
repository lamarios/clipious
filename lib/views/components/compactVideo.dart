import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:invidious/controllers/compactVideoController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/views/components/videoThumbnail.dart';

import '../../models/baseVideo.dart';

class CompactVideo extends StatelessWidget {
  final Function()? onTap;
  final BaseVideo? video;
  final DownloadedVideo? offlineVideo;
  final bool? highlighted;
  final List<Widget>? trailing;

  const CompactVideo({Key? key, this.onTap, this.video, this.trailing, this.highlighted, this.offlineVideo})
      : assert(video == null || offlineVideo == null, 'cannot provide both video and offline video\n'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    String title = video?.title ?? offlineVideo?.title ?? '';
    String author = video?.author ?? offlineVideo?.author ?? '';
    String videoId = video?.videoId ?? offlineVideo?.videoId ?? '';

    return GetBuilder<CompactVideoController>(
        init: CompactVideoController(offlineVideo: offlineVideo),
        global: false,
        builder: (_) {
          return InkWell(
              onTap: onTap,
              child: AnimatedContainer(
                decoration: BoxDecoration(color: (highlighted ?? false) ? colors.secondaryContainer : colors.background, borderRadius: BorderRadius.circular(10)),
                height: 70,
                duration: animationDuration,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      video?.filtered ?? false
                          ? AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Container(
                                decoration: BoxDecoration(color: colors.secondaryContainer, borderRadius: BorderRadius.circular(10)),
                                child: Icon(Icons.visibility_off_outlined, color: colors.secondary.withOpacity(0.7), size: 15),
                              ),
                            )
                          : video != null
                              ? VideoThumbnailView(cacheKey: 'v-worst/${videoId}', videoId: videoId, thumbnailUrl: ImageObject.getWorstThumbnail(video?.videoThumbnails)?.url ?? '')
                              : _.offlineVideoThumbnailPath != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        File(_.offlineVideoThumbnailPath!),
                                        fit: BoxFit.contain,
                                      ))
                                  : Container(
                                      height: double.infinity,
                                      decoration: BoxDecoration(color: colors.secondaryContainer, borderRadius: BorderRadius.circular(10)),
                                    ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                video?.filtered ?? false ? '**********' : title,
                                style: TextStyle(color: colors.primary, overflow: TextOverflow.ellipsis),
                              ),
                              Text(
                                author,
                                style: TextStyle(color: colors.secondary, fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ),
                      ...trailing ?? []
                    ],
                  ),
                ),
              ));
        });
  }
}
