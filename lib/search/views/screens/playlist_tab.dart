import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/playlists/models/playlist.dart';
import 'package:invidious/playlists/views/components/playlist_list.dart';
import 'package:invidious/search/models/search_type.dart';
import 'package:invidious/search/states/search.dart';
import 'package:invidious/search/views/screens/search.dart';
import 'package:invidious/utils/models/paginated_list.dart';

@RoutePage()
class SearchPlaylistTab extends StatelessWidget {
  const SearchPlaylistTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final query =
          context.select((SearchCubit s) => s.state.queryController.value.text);
      final sortBy = context.select((SearchCubit s) => s.state.filters.sortBy);
      final date = context.select((SearchCubit s) => s.state.filters.date);
      final duration =
          context.select((SearchCubit s) => s.state.filters.duration);

      return FractionallySizedBox(
        child: PlaylistList(
            paginatedList: PageBasedPaginatedList<Playlist>(
              getItemsFunc: (page, maxResults) => service
                  .search(query,
                      page: page,
                      sortBy: sortBy,
                      type: SearchType.playlist,
                      date: date,
                      duration: duration)
                  .then((value) => value.playlists),
              maxResults: searchPageSize,
            ),
            canDeleteVideos: false),
      );
    });
  }
}
