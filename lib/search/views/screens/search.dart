import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/playlists/views/components/playlist_list.dart';
import 'package:invidious/search/models/search_type.dart';
import 'package:invidious/videos/models/video_in_list.dart';
import 'package:invidious/videos/views/components/video_in_list.dart';

import '../../../channels/models/channel.dart';
import '../../../main.dart';
import '../../../playlists/models/playlist.dart';
import '../../../playlists/states/playlist_list.dart';
import '../../../settings/states/settings.dart';
import '../../../utils.dart';
import '../../../utils/models/paginatedList.dart';
import '../../../utils/views/components/paginated_list_view.dart';
import '../../../videos/views/components/video_list.dart';
import '../../states/search.dart';

class Search extends StatelessWidget {
  final String? query;
  final bool? searchNow;

  const Search({super.key, this.query, this.searchNow});

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
          return Scaffold(
            bottomNavigationBar: _.showResults
                ? NavigationBar(
                    backgroundColor: colorScheme.background,
                    labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
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
                controller: _.queryController,
                textInputAction: TextInputAction.search,
                onSubmitted: cubit.search,
              ),
              actions: [
                IconButton(onPressed: cubit.searchCleared, icon: const Icon(Icons.clear)),
              ],
            ),
            body: SafeArea(
              child: !_.showResults
                  ? ListView(
                      children: _.queryController.value.text.isEmpty
                          ? cubit
                              .getHistory()
                              .map((e) => InkWell(
                                    onTap: () => cubit.setSearchQuery(e),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(children: [const Icon(Icons.history), Padding(padding: const EdgeInsets.only(left: 8), child: Text(e))]),
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
                              _.videos.isNotEmpty
                                  ? VideoList(
                                      paginatedVideoList: SearchPaginatedList<VideoInList>(
                                          type: SearchType.video, query: _.queryController.value.text, items: _.videos, getFromResults: (res) => res.videos, sortBy: _.sortBy),
                                    )
                                  : Center(child: Text(locals.nVideos(0))),
                              _.channels.isNotEmpty
                                  ? PaginatedListView<Channel>(
                                      paginatedList: SearchPaginatedList<Channel>(
                                          type: SearchType.channel, query: _.queryController.value.text, items: _.channels, getFromResults: (res) => res.channels, sortBy: _.sortBy),
                                      startItems: _.channels,
                                      itemBuilder: (e) => InkWell(
                                            onTap: () {
                                              navigatorKey.currentState?.pushNamed(PATH_CHANNEL, arguments: e.authorId);
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
                                          ))
                                  : Center(
                                      child: Text(locals.noChannels),
                                    ),
                              _.playlists.isNotEmpty
                                  ? FractionallySizedBox(
                                      child: PlaylistList(
                                          paginatedList: SearchPaginatedList<Playlist>(
                                              type: SearchType.playlist, query: _.queryController.value.text, items: _.playlists, getFromResults: (res) => res.playlists, sortBy: _.sortBy),
                                          canDeleteVideos: false),
                                    )
                                  : Center(child: Text(locals.noPlaylists))
                            ][_.selectedIndex],
                          ),
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
