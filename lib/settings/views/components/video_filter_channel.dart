import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:invidious/main.dart';
import 'package:invidious/settings/states/video_filter.dart';
import 'package:invidious/settings/states/video_filter_channel.dart';
import 'package:invidious/settings/views/components/video_filter_item.dart';
import 'package:invidious/settings/views/screens/video_filter_setup.dart';

import '../../../myRouteObserver.dart';
import '../../../utils/models/image_object.dart';
import '../../../videos/views/components/video_thumbnail.dart';
import '../../models/db/video_filter.dart';

class VideoFilterChannel extends StatelessWidget {
  final List<VideoFilter> filters;

  const VideoFilterChannel({Key? key, required this.filters}) : super(key: key);

  editFilter(BuildContext context, {required VideoFilter filter}) {
    var cubit = context.read<VideoFilterCubit>();

    navigatorKey.currentState
        ?.push(MaterialPageRoute(
            settings: ROUTE_SETTINGS_VIDEO_FILTERS,
            builder: (context) => VideoFilterSetup(
                  channelId: filter.channelId,
                  filter: filter,
                )))
        .then((value) => cubit.refreshFilters());
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (context) => VideoFilterChannelCubit(VideoFilterChannelState(filters: filters)),
      child: BlocBuilder<VideoFilterChannelCubit, VideoFilterChannelState>(
        builder: (context, _) {
          var cubit = context.read<VideoFilterChannelCubit>();
          var filterCubit = context.read<VideoFilterCubit>();
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
                        visible: !cubit.hasChannel(),
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
                          visible: cubit.hasChannel() && !_.loading,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Thumbnail(
                              thumbnailUrl: ImageObject.getBestThumbnail(_.channel?.authorThumbnails)?.url ?? '',
                              width: 20,
                              height: 20,
                              id: 'author-small-${_.channel?.authorId ?? ''}',
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            ),
                          )),
                      Expanded(
                          child: Visibility(
                              visible: cubit.hasChannel(),
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
                              cubit.deleteFilter(e);
                              filterCubit.refreshFilters();
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
                        child: InkWell(onTap: () => editFilter(context, filter: e), child: VideoFilterItem(filter: e))))
                    .toList()
              ],
            ),
          );
        },
      ),
    );
  }
}
