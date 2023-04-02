import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/searchController.dart';
import 'package:invidious/models/searchResult.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/channel.dart';
import 'package:invidious/views/components/miniPlayerAware.dart';
import 'package:invidious/views/playlistList.dart';

import '../controllers/playlistListController.dart';
import '../models/paginatedList.dart';
import 'videoList.dart';

class Search extends StatefulWidget {
  final SearchResults results;

  const Search({super.key, required this.results});

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    return MiniPlayerAware(
      child: GetBuilder<SearchController>(
        init: SearchController(this),
        global: false,
        builder: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: colorScheme.brightness == Brightness.dark ? Colors.grey[900] : Colors.white,
              child: TabBar(controller: _.controller, tabs: [
                Tab(
                  text: locals.videos,
                  icon: const Icon(Icons.play_arrow),
                ),
                Tab(
                  text: locals.channels,
                  icon: const Icon(Icons.people),
                ),
                Tab(
                  text: locals.playlists,
                  icon: const Icon(Icons.playlist_play),
                )
              ]),
            ),
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 1,
                child: TabBarView(
                  viewportFraction: 1,
                  controller: _.controller,
                  children: [
                    widget.results.videos.isNotEmpty
                        ? VideoList(
                            paginatedVideoList: FixedItemList(widget.results.videos),
                          )
                        : Center(child: Text(locals.nVideos(0))),
                    widget.results.channels.isNotEmpty
                        ? ListView(
                            children: widget.results.channels
                                .map((e) => InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => ChannelView(channelId: e.authorId),
                                        ));
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
                                .toList(),
                          )
                        : Center(
                            child: Text(locals.noChannels),
                          ),
                    widget.results.playlists.isNotEmpty
                        ? FractionallySizedBox(
                            child: PlaylistList(tag: searchPlayListTag, paginatedList: FixedItemList(widget.results.playlists), canDeleteVideos: false),
                          )
                        : Center(child: Text(locals.noPlaylists))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
