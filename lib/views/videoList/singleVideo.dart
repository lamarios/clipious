import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:logging/logging.dart';

import '../../main.dart';
import '../../models/imageObject.dart';
import '../../utils.dart';
import '../channel.dart';
import '../video.dart';

class VideoListItem extends StatefulWidget {
  final VideoInList video;

  const VideoListItem({super.key, required this.video});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> with RouteAware {
  final log = Logger('VideoInList');
  late double progress;

  openVideo(BuildContext context) {
    FBroadcast.instance().broadcast(BROADCAST_STOP_PLAYING);
    Navigator.push(context, MaterialPageRoute(settings: ROUTE_VIDEO, builder: (context) => VideoView(videoId: widget.video.videoId)));
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    super.initState();
    progress = db.getVideoProgress(widget.video.videoId);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    // log.info('popnext');
    try {
      if (context.mounted) {
        setState(() {
          progress = db.getVideoProgress(widget.video.videoId);
        });
      }
    } catch (err) {
      // log.info('oops');
    }
  }

  @override
  void didPop() {
    super.didPop();
    // log.info('pop');
  }

  @override
  void didPush() {
    super.didPush();
    // log.info('push');
  }

  @override
  void didPushNext() {
    super.didPushNext();
    // log.info('push next');
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => openVideo(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          VideoThumbnailView(
            videoId: widget.video.videoId,
            thumbnailUrl: ImageObject.getBestThumbnail(widget.video!.videoThumbnails)?.url ?? '',
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
                          child: AnimatedOpacity(
                            duration: animationDuration,
                            opacity: progress > 0.1 ? 1 : 0,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              height: 5,
                              decoration: BoxDecoration(
                                color: colorScheme.secondaryContainer,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: AnimatedFractionallySizedBox(
                                  widthFactor: progress,
                                  heightFactor: 1,
                                  duration: const Duration(milliseconds: 750),
                                  curve: Curves.easeInOutQuad,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: colorScheme.primary,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.video.lengthSeconds > 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 25,
                            decoration: BoxDecoration(color: Colors.black.withOpacity(0.75), borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                prettyDuration(Duration(seconds: widget.video.lengthSeconds)),
                                style: const TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Text(
            widget.video.title,
            textAlign: TextAlign.left,
            style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.normal),
          ),
          Visibility(
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(settings: ROUTE_CHANNEL, builder: (context) => ChannelView(channelId: widget.video.authorId!)));
              },
              child: Row(
                children: [
                  Text(
                    widget.video.author ?? '',
                    style: TextStyle(color: colorScheme.secondary),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Visibility(visible: (widget.video.viewCount ?? 0) > 0, child: Icon(Icons.visibility)),
              Visibility(
                  visible: (widget.video.viewCount ?? 0) > 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(compactCurrency.format(widget.video.viewCount)),
                  )),
              Expanded(
                  child: Text(
                widget.video.publishedText ?? '',
                textAlign: TextAlign.end,
              )),
            ],
          )
        ],
      ),
    );
  }
}
