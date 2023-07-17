import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/VideoFilterChannelController.dart';
import 'package:invidious/main.dart';
import 'package:invidious/views/settings/videoFilterItem.dart';
import 'package:invidious/views/settings/videoFilterSetup.dart';

import '../../models/db/videoFilter.dart';
import '../../models/imageObject.dart';
import '../../myRouteObserver.dart';
import '../components/videoThumbnail.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VideoFilterChannel extends StatelessWidget {
  final List<VideoFilter> filters;

  const VideoFilterChannel({Key? key, required this.filters}) : super(key: key);

  editFilter(BuildContext context, {required VideoFilter filter}) {
    navigatorKey.currentState?.push(MaterialPageRoute(
        settings: ROUTE_SETTINGS_VIDEO_FILTERS,
        builder: (context) => VideoFilterSetup(
              channelId: filter.channelId,
              filter: filter,
            )));
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;

    return GetBuilder<VideoFilterChannelController>(
      init: VideoFilterChannelController(filters: filters),
      global: false,
      builder: (_) {
        TextStyle titleStyle = TextStyle(color: colors.primary);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Visibility(
                      visible: !_.hasChannel(),
                      child: Text(
                        locals.videoFilterAllChannels,
                        style: titleStyle,
                      ),
                    ),
                    Visibility(
                        visible: _.loading,
                        child: const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                            ))),
                    Visibility(
                        visible: _.hasChannel() && !_.loading,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Thumbnail(
                            thumbnailUrl: ImageObject.getBestThumbnail(
                                        _.channel?.authorThumbnails)
                                    ?.url ??
                                '',
                            width: 20,
                            height: 20,
                            id: 'author-small-${_.channel?.authorId ?? ''}',
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        )),
                    Expanded(
                        child: Visibility(
                            visible: _.hasChannel(),
                            child: Text(
                              _.channel?.author ?? '',
                              style: titleStyle,
                            ))),
                  ],
                ),
              ),
              ..._.filters
                  .map((e) => SwipeActionCell(
                      key: ValueKey('filter-swipe-${e.id}'),
                      trailingActions: [
                        SwipeAction(
                          icon: const Icon(Icons.delete, color: Colors.white),
                          performsFirstActionWithFullSwipe: true,
                          onTap: (handler) async {
                            await handler(true);
                            _.deleteFilter(e);
                          },
                        ),
                        SwipeAction(
                          icon: const Icon(Icons.edit, color: Colors.white),
                          color: Colors.orangeAccent,
                          closeOnTap: false,
                          onTap: (handler) async {
                            // await handler(true);
                            editFilter(context, filter: e);
                          },
                        )
                      ],
                      child: InkWell(
                          onTap: () => editFilter(context, filter: e),
                          child: VideoFilterItem(filter: e))))
                  .toList()
            ],
          ),
        );
      },
    );
  }
}
