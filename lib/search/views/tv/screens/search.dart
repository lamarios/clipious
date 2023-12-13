import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/playlists/models/playlist.dart';
import 'package:invidious/playlists/views/components/playlist_in_list.dart';
import 'package:invidious/router.dart';
import 'package:invidious/search/models/search_type.dart';
import 'package:invidious/utils/models/paginated_list.dart';
import 'package:invidious/utils/views/components/placeholders.dart';
import 'package:invidious/utils/views/tv/components/tv_button.dart';
import 'package:invidious/utils/views/tv/components/tv_horizontal_item_list.dart';
import 'package:invidious/utils/views/tv/components/tv_horizontal_paginated_list.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';
import 'package:invidious/utils/views/tv/components/tv_text_field.dart';

import '../../../../channels/models/channel.dart';
import '../../../../globals.dart';
import '../../../../settings/states/settings.dart';
import '../../../../videos/models/video_in_list.dart';
import '../../../states/search.dart';
import '../../../states/tv_search.dart';
import '../../screens/search.dart';

@RoutePage()
class TvSearchScreen extends StatelessWidget {
  const TvSearchScreen({super.key});

  Widget buildSuggestion(
      BuildContext context, SearchState _, bool isHistory, String suggestion) {
    ColorScheme colors = Theme.of(context).colorScheme;
    var searchCubit = context.read<SearchCubit>();

    return TvButton(
        onPressed: (context) {
          searchCubit.clearSearch();
          Future.delayed(const Duration(seconds: 1),
              () => searchCubit.setSearchQuery(suggestion));
        },
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

    var settings = context.read<SettingsCubit>();
    return Scaffold(
      body: TvOverscan(
        child: DefaultTextStyle(
          style: textTheme.bodyLarge!,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => TvSearchCubit(const TvSearchState()),
              ),
              BlocProvider(
                create: (context) => SearchCubit(SearchState.init(), settings),
              )
            ],
            child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, search) {
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
                        focusNode: tvCubit.searchFocus,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: search.queryController.value
                                                  .text.isEmpty
                                              ? searchCubit
                                                  .getHistory()
                                                  .map((e) => buildSuggestion(
                                                      context, search, true, e))
                                                  .toList()
                                              : search.suggestions
                                                  .map((e) => buildSuggestion(
                                                      context,
                                                      search,
                                                      false,
                                                      e))
                                                  .toList(),
                                        ),
                                      ),
                                      Expanded(
                                          child: SingleChildScrollView(
                                        controller: tvCubit.scrollController,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: search.showResults
                                              ? [
                                                  Visibility(
                                                      visible: tv.hasVideos,
                                                      child: Text(
                                                        locals.videos,
                                                        style: textTheme
                                                            .titleLarge,
                                                      )),
                                                  Focus(
                                                      focusNode:
                                                          tvCubit.resultFocus,
                                                      onFocusChange: (focused) {
                                                        if (focused) {
                                                          tvCubit
                                                              .scrollController
                                                              .animateTo(0,
                                                                  duration:
                                                                      animationDuration,
                                                                  curve: Curves
                                                                      .easeOutQuad);
                                                        }
                                                      },
                                                      child:
                                                          TvHorizontalVideoList(
                                                              paginatedVideoList:
                                                                  PageBasedPaginatedList<
                                                                      VideoInList>(
                                                        getItemsFunc: (page,
                                                                maxResults) =>
                                                            service
                                                                .search(
                                                                    search
                                                                        .queryController
                                                                        .value
                                                                        .text,
                                                                    page: page,
                                                                    type: SearchType
                                                                        .video)
                                                                .then((value) {
                                                          if (page == 1) {
                                                            tvCubit.setHasVideo(
                                                                value.videos
                                                                    .isNotEmpty);
                                                          }
                                                          return value.videos;
                                                        }),
                                                        maxResults:
                                                            searchPageSize,
                                                      ))),
                                                  Visibility(
                                                      visible: tv.hasChannels,
                                                      child: Text(
                                                        locals.channels,
                                                        style: textTheme
                                                            .titleLarge,
                                                      )),
                                                  SizedBox(
                                                    height: 60,
                                                    child:
                                                        TvHorizontalPaginatedListView<
                                                            Channel>(
                                                      getPlaceHolder: () =>
                                                          const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child:
                                                            TvChannelPlaceholder(),
                                                      ),
                                                      paginatedList:
                                                          PageBasedPaginatedList<
                                                              Channel>(
                                                        getItemsFunc: (page,
                                                                maxResults) =>
                                                            service
                                                                .search(
                                                                    search
                                                                        .queryController
                                                                        .value
                                                                        .text,
                                                                    page: page,
                                                                    type: SearchType
                                                                        .channel)
                                                                .then((value) {
                                                          if (page == 1) {
                                                            tvCubit.setHasChannels(
                                                                value.channels
                                                                    .isNotEmpty);
                                                          }
                                                          return value.channels;
                                                        }),
                                                        maxResults:
                                                            searchPageSize,
                                                      ),
                                                      startItems: const [],
                                                      itemBuilder: (e) =>
                                                          Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: TvButton(
                                                          onPressed:
                                                              (context) =>
                                                                  openChannel(
                                                                      context,
                                                                      e),
                                                          borderRadius: 20,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Text(e.author),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Visibility(
                                                      visible: tv.hasPlaylists,
                                                      child: Text(
                                                        locals.playlists,
                                                        style: textTheme
                                                            .titleLarge,
                                                      )),
                                                  TvHorizontalItemList<
                                                      Playlist>(
                                                    getPlaceholder: () =>
                                                        const TvPlaylistPlaceHolder(),
                                                    paginatedList:
                                                        PageBasedPaginatedList<
                                                            Playlist>(
                                                      getItemsFunc: (page,
                                                              maxResults) =>
                                                          service
                                                              .search(
                                                                  search
                                                                      .queryController
                                                                      .value
                                                                      .text,
                                                                  page: page,
                                                                  type: SearchType
                                                                      .playlist)
                                                              .then((value) {
                                                        if (page == 1) {
                                                          tvCubit.setHasPlaylists(
                                                              value.playlists
                                                                  .isNotEmpty);
                                                        }
                                                        return value.playlists;
                                                      }),
                                                      maxResults:
                                                          searchPageSize,
                                                    ),
                                                    buildItem: (context, index,
                                                            item) =>
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                PlaylistInList(
                                                              playlist: item,
                                                              canDeleteVideos:
                                                                  false,
                                                              isTv: true,
                                                              // cameFromSearch: true,
                                                            )),
                                                  ),
                                                ]
                                              : [const Text('YOU')],
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
