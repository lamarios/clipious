import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/channels/models/channel_sort_by.dart';

import '../../../globals.dart';
import '../../models/channel.dart';
import '../../states/channel.dart';
import '../components/sort_dropdown_button.dart';
import '../components/videos.dart';

@RoutePage()
class ChannelVideoTab extends StatelessWidget {
  final Channel? channel;

  const ChannelVideoTab({super.key, this.channel});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ChannelCubit>();

    return channel == null
        ? const SizedBox.shrink()
        : Builder(builder: (context) {
            final sortBy = context.select((ChannelCubit c) => c.state.sortBy);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: innerHorizontalPadding),
                  child: SortDropdownButton(
                    selectedSortingOption: sortBy,
                    onChanged: (ChannelSortBy newValue) =>
                        cubit.onSortByChanged(newValue),
                  ),
                ),
                Expanded(
                  child: ChannelVideosView(
                    key: ValueKey(sortBy),
                    channel: channel!,
                    getVideos: (String channelId, String? continuation) {
                      return service.getChannelVideos(channelId, continuation,
                          sortBy: sortBy);
                    },
                  ),
                ),
              ],
            );
          });
  }
}
