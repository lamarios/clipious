import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/channels/models/channel.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/router.dart';
import 'package:clipious/search/models/search_type.dart';
import 'package:clipious/search/states/search.dart';
import 'package:clipious/search/views/screens/search.dart';
import 'package:clipious/utils.dart';
import 'package:clipious/utils/models/paginated_list.dart';
import 'package:clipious/utils/views/components/paginated_list_view.dart';

@RoutePage()
class SearchChannelTab extends StatelessWidget {
  const SearchChannelTab({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Builder(builder: (context) {
      final query =
          context.select((SearchCubit s) => s.state.queryController.value.text);
      final sortBy = context.select((SearchCubit s) => s.state.filters.sortBy);
      final date = context.select((SearchCubit s) => s.state.filters.date);
      final duration =
          context.select((SearchCubit s) => s.state.filters.duration);

      return PaginatedListView<Channel>(
          paginatedList: PageBasedPaginatedList<Channel>(
            getItemsFunc: (page, maxResults) => service
                .search(query,
                    page: page,
                    sortBy: sortBy,
                    type: SearchType.channel,
                    date: date,
                    duration: duration)
                .then((value) => value.channels),
            maxResults: searchPageSize,
          ),
          itemBuilder: (e) => InkWell(
                onTap: () {
                  AutoRouter.of(context)
                      .push(ChannelRoute(channelId: e.authorId));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        e.author,
                        style: TextStyle(color: colors.primary),
                      )),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.people,
                          size: 15,
                        ),
                      ),
                      Text(compactCurrency.format(e.subCount)),
                    ],
                  ),
                ),
              ));
    });
  }
}
