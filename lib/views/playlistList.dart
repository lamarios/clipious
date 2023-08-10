import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/playlistListController.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/models/playlist.dart';
import 'package:invidious/views/playlists/playlist.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../globals.dart';
import 'components/placeholders.dart';

class PlaylistList extends StatelessWidget {
  final PaginatedList<Playlist> paginatedList;
  final bool canDeleteVideos;
  final String? tag;

  const PlaylistList({super.key, required this.tag, required this.paginatedList, required this.canDeleteVideos});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    AppLocalizations locals = AppLocalizations.of(context)!;
    return GetBuilder<PlaylistListController>(
      tag: PlaylistListController.getTag(tag!),
      global: tag != null,
      init: PlaylistListController(paginatedList),
      builder: (_) {
        bool showPlaceHolder = _.loading && _.playlists.isEmpty;
        return Stack(
          children: [
            _.error.isNotEmpty
                ? Container(
                    alignment: Alignment.center,
                    color: colorScheme.background,
                    child: Visibility(visible: _.error.isNotEmpty, child: InkWell(onTap: () => _.getPlaylists(), child: Text(_.error == couldNotGetPlaylits ? locals.couldntFetchVideos : _.error))),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FadeIn(
                      duration: animationDuration,
                      curve: Curves.easeInOutQuad,
                      child: SmartRefresher(
                        controller: _.refreshController,
                        enablePullDown: _.paginatedList.hasRefresh(),
                        enablePullUp: false,
                        onRefresh: _.refreshPlaylists,
                        child: ListView.builder(
                            controller: _.scrollController,
                            itemBuilder: (context, index) => index >= _.playlists.length ? const PlaylistPlaceHolder() : PlaylistItem(playlist: _.playlists[index], canDeleteVideos: canDeleteVideos),
                            // separatorBuilder: (context, index) => const Divider(),
                            itemCount: _.playlists.length + (_.loading ? 7 : 0)),
                      ),
                    ),
                  ),
            Visibility(visible: _.loading, child: const SizedBox(height: 1, child: LinearProgressIndicator())),
          ],
        );
      },
    );
  }
}
