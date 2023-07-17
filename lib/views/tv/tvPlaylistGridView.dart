import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/playlistListController.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/models/playlist.dart';
import 'package:invidious/views/playlists/playlist.dart';
import 'package:invidious/views/tv/tvOverScan.dart';

class TvPlaylistGridView extends StatelessWidget {
  final PaginatedList<Playlist> playlistList;
  final String? tags;

  const TvPlaylistGridView({Key? key, required this.playlistList, this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return Scaffold(
      body: TvOverscan(
        child: GetBuilder<PlaylistListController>(
            global: tags != null,
            tag: tags,
            init: PlaylistListController(playlistList),
            builder: (_) {
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        locals.playlists,
                        style: const TextStyle(fontSize: 20),
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
                    controller: _.scrollController,
                    childAspectRatio: 16 / 13,
                    crossAxisCount: 3,
                    children: _.playlists.map((e) => PlaylistItem(playlist: e, canDeleteVideos: false, isTv: true)).toList(),
                  ))
                ],
              );
            }),
      ),
    );
  }
}
