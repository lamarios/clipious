import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/channels/views/tv/screens/channel.dart';
import 'package:invidious/playlists/models/playlist.dart';
import 'package:invidious/playlists/views/components/playlist_in_list.dart';
import 'package:invidious/router.dart';
import 'package:invidious/search/models/search_type.dart';
import 'package:invidious/utils/models/paginatedList.dart';
import 'package:invidious/utils/views/components/placeholders.dart';
import 'package:invidious/utils/views/tv/components/tv_button.dart';
import 'package:invidious/utils/views/tv/components/tv_horizontal_item_list.dart';
import 'package:invidious/utils/views/tv/components/tv_horizontal_paginated_list.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';
import 'package:invidious/utils/views/tv/components/tv_text_field.dart';

import '../../../../channels/models/channel.dart';
import '../../../../settings/states/settings.dart';
import '../../../../videos/models/video_in_list.dart';
import '../../../states/search.dart';
import '../../../states/tv_search.dart';

@RoutePage()
class TvSearchScreen extends StatelessWidget {
  const TvSearchScreen({Key? key}) : super(key: key);

  Widget buildSuggestion(BuildContext context, SearchState _, bool isHistory, String suggestion) {
    ColorScheme colors = Theme.of(context).colorScheme;
    var searchCubit = context.read<SearchCubit>();

    return TvButton(
        onPressed: (context) => searchCubit.setSearchQuery(suggestion),
        focusedColor: colors.secondaryContainer,
        unfocusedColor: Colors.transparent,
        child: isHistory
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
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
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Text(suggestion),
              ));
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var locals = AppLocalizations.of(context)!;

    var colors = Theme.of(context).colorScheme;

    var settings = context.read<SettingsCubit>();
    return Scaffold(
      body: TvOverscan(
        child: DefaultTextStyle(
          style: textTheme.bodyLarge!,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => TvSearchCubit(TvSearchState()),
              ),
              BlocProvider(
                create: (context) => SearchCubit(SearchState(), settings),
              )
            ],
            child: BlocBuilder<SearchCubit, SearchState>(builder: (context, search) {
              return BlocBuilder<TvSearchCubit, TvSearchState>(
                builder: (context, tv) {
                  var tvCubit = context.read<TvSearchCubit>();
                  var searchCubit = context.read<SearchCubit>();
                  return Column(
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
                        controller: search.queryController,
                        autofocus: true,
                        autocorrect: true,
                        focusNode: tv.searchFocus,
                        onSubmitted: (value) async {
                          await searchCubit.search(value);
                          searchCubit.getSuggestions(hideResult: false);
                        },
                        textInputAction: TextInputAction.search,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: search.showResults
                              ? FocusScope(
                                  onKeyEvent: tvCubit.handleResultScopeKeyEvent,
                                  canRequestFocus: true,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: search.queryController.value.text.isEmpty
                                              ? searchCubit
                                                  .getHistory()
                                                  .map((e) => buildSuggestion(context, search, true, e))
                                                  .toList()
                                              : search.suggestions
                                                  .map((e) => buildSuggestion(context, search, false, e))
                                                  .toList(),
                                        ),
                                      ),
                                      Expanded(
                                          child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: search.loading
                                              ? [
                                                  const Center(
                                                    child: CircularProgressIndicator(),
                                                  )
                                                ]
                                              : [
                                                  Visibility(
                                                      visible: search.videos.isNotEmpty ?? false,
                                                      child: Text(
                                                        locals.videos,
                                                        style: textTheme.titleLarge,
                                                      )),
                                                  Visibility(
                                                    visible: search.videos.isNotEmpty ?? false,
                                                    child: Focus(
                                                        focusNode: tv.resultFocus,
                                                        child: TvHorizontalVideoList(
                                                            paginatedVideoList: SearchPaginatedList<VideoInList>(
                                                                getFromResults: (res) => res.videos,
                                                                sortBy: search.sortBy,
                                                                query: search.queryController.value.text,
                                                                type: SearchType.video,
                                                                items: search.videos))),
                                                  ),
                                                  Visibility(
                                                      visible: search.channels.isNotEmpty ?? false,
                                                      child: Text(
                                                        locals.channels,
                                                        style: textTheme.titleLarge,
                                                      )),
                                                  Visibility(
                                                    visible: search.channels.isNotEmpty ?? false,
                                                    child: SizedBox(
                                                      height: 60,
                                                      child: TvHorizontalPaginatedListView<Channel>(
                                                        getPlaceHolder: () => const TvChannelPlaceholder(),
                                                        paginatedList: SearchPaginatedList<Channel>(
                                                            getFromResults: (res) => res.channels,
                                                            sortBy: search.sortBy,
                                                            query: search.queryController.value.text,
                                                            items: search.channels,
                                                            type: SearchType.channel),
                                                        startItems: search.channels,
                                                        itemBuilder: (e) => Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: TvButton(
                                                            onPressed: (context) => openChannel(context, e),
                                                            borderRadius: 20,
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.min,
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
                                                      visible: search.playlists.isNotEmpty ?? false,
                                                      child: Text(
                                                        locals.playlists,
                                                        style: textTheme.titleLarge,
                                                      )),
                                                  Visibility(
                                                    visible: search.playlists.isNotEmpty ?? false,
                                                    child: TvHorizontalItemList<Playlist>(
                                                      getPlaceholder: () => const TvPlaylistPlaceHolder(),
                                                      paginatedList: SearchPaginatedList<Playlist>(
                                                          getFromResults: (res) => res.playlists,
                                                          sortBy: search.sortBy,
                                                          query: search.queryController.value.text,
                                                          items: search.playlists,
                                                          type: SearchType.playlist),
                                                      buildItem: (context, index, item) => Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: PlaylistInList(
                                                            playlist: item,
                                                            canDeleteVideos: false,
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
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }

  openChannel(BuildContext context, Channel c) {
    AutoRouter.of(context).push(TvChannelRoute(channelId: c.authorId));
  }
}
