import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/playlists/views/components/playlist_list.dart';
import 'package:invidious/router.dart';
import 'package:invidious/search/models/search_type.dart';
import 'package:invidious/videos/models/video_in_list.dart';

import '../../../channels/models/channel.dart';
import '../../../playlists/models/playlist.dart';
import '../../../settings/states/settings.dart';
import '../../../utils.dart';
import '../../../utils/models/paginatedList.dart';
import '../../../utils/views/components/paginated_list_view.dart';
import '../../../videos/views/components/video_list.dart';
import '../../states/search.dart';


//Do not change, invidious doesn't allow any specific value, it's to make the paginated lists work as expected
const searchPageSize = 20;

@RoutePage()
class SearchScreen extends StatelessWidget {
  final String? query;
  final bool? searchNow;

  const SearchScreen({super.key, this.query, this.searchNow});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    var settings = context.read<SettingsCubit>();
    return BlocProvider(
      create: (context) => SearchCubit<SearchState>(SearchState(query: query, searchNow: searchNow), settings),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, _) {
          var cubit = context.read<SearchCubit>();
          var navigationBarLabel = context.select((SettingsCubit s) => s.state.navigationBarLabelBehavior);
          return Scaffold(
            bottomNavigationBar: _.showResults
                ? NavigationBar(
                    backgroundColor: colorScheme.background,
                    labelBehavior: navigationBarLabel,
                    elevation: 0,
                    selectedIndex: _.selectedIndex,
                    onDestinationSelected: cubit.selectIndex,
                    destinations: [
                      NavigationDestination(icon: const Icon(Icons.play_arrow), label: locals.videos),
                      NavigationDestination(icon: const Icon(Icons.people), label: locals.channels),
                      NavigationDestination(icon: const Icon(Icons.playlist_play), label: locals.playlists),
                    ],
                  )
                : null,
            appBar: AppBar(
              backgroundColor: colorScheme.background,
              scrolledUnderElevation: 0,
              title: TextField(
                autofocus: query == null,
                controller: _.queryController,
                textInputAction: TextInputAction.search,
                onSubmitted: cubit.search,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      if (cubit.searchCleared()) {
                        AutoRouter.of(context).pop();
                      }
                    },
                    icon: const Icon(Icons.clear)),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: innerHorizontalPadding),
                child: !_.showResults
                    ? ListView(
                        children: _.queryController.value.text.isEmpty
                            ? cubit
                                .getHistory()
                                .map((e) => InkWell(
                                      onTap: () => cubit.setSearchQuery(e),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(children: [
                                          const Icon(Icons.history),
                                          Padding(padding: const EdgeInsets.only(left: 8), child: Text(e))
                                        ]),
                                      ),
                                    ))
                                .toList()
                            : _.suggestions
                                .map((e) => InkWell(
                                      onTap: () => cubit.setSearchQuery(e),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(e),
                                      ),
                                    ))
                                .toList(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
/* doesn't look like sorting does anything at the moment
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 4.0),
                                child: Icon(Icons.sort),
                              ),
                              DropdownButton<SearchSortBy>(
                                value: _.sortBy,
                                items: [
                                  DropdownMenuItem(value: SearchSortBy.relevance, child: Text(locals.searchSortRelevance)),
                                  DropdownMenuItem(
                                    value: SearchSortBy.rating,
                                    child: Text(locals.searchSortRating),
                                  ),
                                  DropdownMenuItem(
                                    value: SearchSortBy.upload_date,
                                    child: Text(locals.searchSortUploadDate),
                                  ),
                                  DropdownMenuItem(
                                    value: SearchSortBy.view_count,
                                    child: Text(locals.searchSortViewCount),
                                  ),
                                ],
                                onChanged: _.sortChanged,
                              )
                            ],
                          ),
                        ),
*/
                          Expanded(
                            child: FractionallySizedBox(
                              widthFactor: 1,
                              child: [
                                VideoList(
                                  paginatedVideoList: PageBasedPaginatedList<VideoInList>(
                                    getItemsFunc: (page, maxResults) => service
                                        .search(_.queryController.value.text,
                                            page: page, sortBy: _.sortBy, type: SearchType.video)
                                        .then((value) => value.videos),
                                    maxResults: searchPageSize,
                                  ),
                                ),
                                PaginatedListView<Channel>(
                                    paginatedList: PageBasedPaginatedList<Channel>(
                                      getItemsFunc: (page, maxResults) => service
                                          .search(_.queryController.value.text,
                                              page: page, sortBy: _.sortBy, type: SearchType.channel)
                                          .then((value) => value.channels),
                                      maxResults: searchPageSize,
                                    ),
                                    itemBuilder: (e) => InkWell(
                                          onTap: () {
                                            AutoRouter.of(context).push(ChannelRoute(channelId: e.authorId));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                  e.author,
                                                  style: TextStyle(color: colorScheme.primary),
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
                                        )),
                                    FractionallySizedBox(
                                        child: PlaylistList(
                                            paginatedList: PageBasedPaginatedList<Playlist>(
                                              getItemsFunc: (page, maxResults) => service
                                                  .search(_.queryController.value.text,
                                                  page: page, sortBy: _.sortBy, type: SearchType.playlist)
                                                  .then((value) => value.playlists),
                                              maxResults: searchPageSize,
                                               ),
                                            canDeleteVideos: false),
                                      )
                              ][_.selectedIndex],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
