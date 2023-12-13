import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/playlists/models/playlist.dart';
import 'package:invidious/playlists/states/playlist_list.dart';
import 'package:invidious/playlists/views/components/playlist_in_list.dart';
import 'package:invidious/utils/models/paginatedList.dart';
import 'package:invidious/utils/views/components/placeholders.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';


@RoutePage()
class TvPlaylistGridScreen extends StatelessWidget {
  final PaginatedList<Playlist> playlistList;
  final String? tags;

  const TvPlaylistGridScreen({Key? key, required this.playlistList, this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => PlaylistListCubit(PlaylistListState(paginatedList: playlistList)),
      child: Scaffold(
        body: TvOverscan(
          child: BlocBuilder<PlaylistListCubit, PlaylistListState>(builder: (context, _) {
            var cubit = context.read<PlaylistListCubit>();

            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      locals.playlists,
                      style: textTheme.titleLarge,
                    ),
                    _.loading
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(width: 15, height: 15, child: CircularProgressIndicator(strokeWidth: 2)),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
                Expanded(
                    child: GridView.count(
                  controller: cubit.scrollController,
                  childAspectRatio: 16 / 13,
                  crossAxisCount: 3,
                  children: [
                    ..._.playlists
                        .map((e) => PlaylistInList(
                            key: ValueKey(e.playlistId), playlist: e, canDeleteVideos: false, isTv: true)),
                    if (_.loading) ...repeatWidget(() => const TvPlaylistPlaceHolder(), count: 10)
                  ],
                ))
              ],
            );
          }),
        ),
      ),
    );
  }
}
