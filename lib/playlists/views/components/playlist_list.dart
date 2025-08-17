import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:clipious/l10n/generated/app_localizations.dart';
import 'package:clipious/playlists/models/playlist.dart';
import 'package:clipious/playlists/states/playlist_list.dart';
import 'package:clipious/playlists/views/components/add_to_playlist_list.dart';
import 'package:clipious/playlists/views/components/playlist_in_list.dart';
import 'package:clipious/utils.dart';
import 'package:clipious/utils/models/paginated_list.dart';
import 'package:clipious/utils/views/components/device_widget.dart';
import 'package:clipious/utils/views/components/top_loading.dart';

import '../../../globals.dart';
import '../../../utils/views/components/placeholders.dart';

class PlaylistList extends StatelessWidget {
  final PaginatedList<Playlist> paginatedList;
  final bool canDeleteVideos;
  final bool small;

  const PlaylistList(
      {super.key,
      required this.paginatedList,
      required this.canDeleteVideos,
      this.small = false});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    AppLocalizations locals = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (BuildContext context) =>
          PlaylistListCubit(PlaylistListState(paginatedList: paginatedList)),
      child: BlocBuilder<PlaylistListCubit, PlaylistListState>(
        builder: (context, state) {
          var cubit = context.read<PlaylistListCubit>();
          var deviceType = getDeviceType();
          return Stack(
            children: [
              state.error.isNotEmpty
                  ? Container(
                      alignment: Alignment.center,
                      color: colorScheme.surface,
                      child: Visibility(
                          visible: state.error.isNotEmpty,
                          child: InkWell(
                              onTap: () => cubit.getPlaylists(),
                              child: Text(state.error == couldNotGetPlaylits
                                  ? locals.couldntFetchVideos
                                  : state.error))),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeIn(
                        duration: animationDuration,
                        curve: Curves.easeInOutQuad,
                        child: RefreshIndicator(
                          onRefresh: () =>
                              !small && state.paginatedList.hasRefresh()
                                  ? cubit.refreshPlaylists()
                                  : null,
                          child: DeviceWidget(
                            forcedTyped: small ? DeviceType.phone : null,
                            phone: ListView.builder(
                                scrollDirection:
                                    small ? Axis.horizontal : Axis.vertical,
                                controller: cubit.scrollController,
                                itemBuilder: (context, index) => index >=
                                        state.playlists.length
                                    ? PlaylistPlaceHolder(small: small)
                                    : PlaylistInList(
                                        key: ValueKey(
                                            state.playlists[index].playlistId),
                                        playlist: state.playlists[index],
                                        canDeleteVideos: canDeleteVideos,
                                        small: small),
                                // separatorBuilder: (context, index) => const Divider(),
                                itemCount: state.playlists.length +
                                    (state.loading ? 7 : 0)),
                            tablet: GridView.builder(
                                itemCount: state.playlists.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 16 / 12,
                                  crossAxisCount: getGridCount(context),
                                ),
                                itemBuilder: (context, index) => index >=
                                        state.playlists.length
                                    ? const TvPlaylistPlaceHolder()
                                    : PlaylistInList(
                                        isTablet:
                                            deviceType == DeviceType.tablet,
                                        thumbnailsHeight: 160,
                                        key: ValueKey(
                                            state.playlists[index].playlistId),
                                        playlist: state.playlists[index],
                                        canDeleteVideos: canDeleteVideos,
                                        small: false)),
                          ),
                        ),
                      ),
                    ),
              Visibility(
                  visible: state.loading && !small,
                  child: const TopListLoading()),
              Visibility(
                  visible: !small && canDeleteVideos,
                  child: const Positioned(
                      bottom: 15, right: 15, child: AddPlayListButton()))
            ],
          );
        },
      ),
    );
  }
}
