import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/models/playlist.dart';
import 'package:invidious/models/searchType.dart';
import 'package:invidious/views/playlists/playlist.dart';
import 'package:invidious/views/tv/tvButton.dart';
import 'package:invidious/views/tv/tvChannelView.dart';
import 'package:invidious/views/tv/tvHorizontalPaginatedListView.dart';
import 'package:invidious/views/tv/tvHorizontalVideoList.dart';
import 'package:invidious/views/tv/tvOverScan.dart';
import 'package:invidious/views/tv/tvTextField.dart';

import '../../controllers/searchController.dart';
import '../../controllers/tvSearchController.dart';
import '../../models/channel.dart';
import '../../models/videoInList.dart';

class TvSearch extends StatelessWidget {
  const TvSearch({Key? key}) : super(key: key);

  Widget buildSuggestion(BuildContext context, ClipiousSearchController _,
      bool isHistory, String suggestion) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return TvButton(
        onPressed: (context) => _.setSearchQuery(suggestion),
        focusedColor: colors.secondaryContainer,
        unfocusedColor: Colors.transparent,
        child: isHistory
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Row(children: [
                  const Icon(Icons.history),
                  Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        suggestion,
                      ))
                ]),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Text(suggestion),
              ));
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var locals = AppLocalizations.of(context)!;

    var colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: TvOverscan(
        child: DefaultTextStyle(
          style: textTheme.bodyLarge!,
          child: GetBuilder<TvSearchController>(
            global: false,
            init: TvSearchController(),
            builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locals.search,
                  style: textTheme.titleLarge,
                ),
                TvTextField(
                  leading: Icon(
                    Icons.search,
                    color: colors.secondary,
                  ),
                  controller: _.queryController,
                  autofocus: true,
                  autocorrect: true,
                  focusNode: _.searchFocus,
                  onSubmitted: _.search,
                  textInputAction: TextInputAction.search,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: _.showResults
                        ? FocusScope(
                            onKeyEvent: _.handleResultScopeKeyEvent,
                            canRequestFocus: true,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: ListView(
                                    shrinkWrap: true,
                                    children:
                                        _.queryController.value.text.isEmpty
                                            ? _
                                                .getHistory()
                                                .map((e) => buildSuggestion(
                                                    context, _, true, e))
                                                .toList()
                                            : _.suggestions
                                                .map((e) => buildSuggestion(
                                                    context, _, false, e))
                                                .toList(),
                                  ),
                                ),
                                Expanded(
                                    child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: _.loading
                                        ? [
                                            const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          ]
                                        : [
                                            Visibility(
                                                visible: _.videos.isNotEmpty ??
                                                    false,
                                                child: Text(
                                                  locals.videos,
                                                  style: textTheme.titleLarge,
                                                )),
                                            Visibility(
                                              visible:
                                                  _.videos.isNotEmpty ?? false,
                                              child: Focus(
                                                  focusNode: _.resultFocus,
                                                  child: TvHorizontalVideoList(
                                                      paginatedVideoList:
                                                          SearchPaginatedList<
                                                                  VideoInList>(
                                                              getFromResults:
                                                                  (res) =>
                                                                      res
                                                                          .videos,
                                                              sortBy: _.sortBy,
                                                              query: _
                                                                  .queryController
                                                                  .value
                                                                  .text,
                                                              type: SearchType
                                                                  .video,
                                                              items:
                                                                  _.videos))),
                                            ),
                                            Visibility(
                                                visible:
                                                    _.channels.isNotEmpty ??
                                                        false,
                                                child: Text(
                                                  locals.channels,
                                                  style: textTheme.titleLarge,
                                                )),
                                            Visibility(
                                              visible: _.channels.isNotEmpty ??
                                                  false,
                                              child: SizedBox(
                                                height: 60,
                                                child:
                                                    TvHorizontalPaginatedListView<
                                                        Channel>(
                                                  paginatedList:
                                                      SearchPaginatedList<
                                                              Channel>(
                                                          getFromResults:
                                                              (res) =>
                                                                  res.channels,
                                                          sortBy: _.sortBy,
                                                          query: _
                                                              .queryController
                                                              .value
                                                              .text,
                                                          items: _.channels,
                                                          type: SearchType
                                                              .channel),
                                                  startItems: _.channels,
                                                  itemBuilder: (e) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: TvButton(
                                                      onPressed: (context) =>
                                                          openChannel(
                                                              context, e),
                                                      borderRadius: 20,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(e.author),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Visibility(
                                                visible:
                                                    _.playlists.isNotEmpty ??
                                                        false,
                                                child: Text(
                                                  locals.playlists,
                                                  style: textTheme.titleLarge,
                                                )),
                                            Visibility(
                                              visible: _.playlists.isNotEmpty ??
                                                  false,
                                              child: TvHorizontalItemList<
                                                  Playlist>(
                                                paginatedList:
                                                    SearchPaginatedList<
                                                            Playlist>(
                                                        getFromResults:
                                                            (res) => res
                                                                .playlists,
                                                        sortBy: _.sortBy,
                                                        query: _.queryController
                                                            .value.text,
                                                        items: _.playlists,
                                                        type: SearchType
                                                            .playlist),
                                                buildItem: (context, index,
                                                        item) =>
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: PlaylistItem(
                                                          playlist: item,
                                                          canDeleteVideos:
                                                              false,
                                                          isTv: true,
                                                          // cameFromSearch: true,
                                                        )),
                                              ),
                                            ),
                                          ],
                                  ),
                                ))
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  openChannel(BuildContext context, Channel c) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TvChannelView(channelId: c.authorId),
    ));
  }
}
