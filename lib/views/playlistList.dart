import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/models/playlist.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/playlists/playlist.dart';
import 'package:invidious/views/videoList/singleVideo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../globals.dart';
import '../models/videoInList.dart';

class PlaylistList extends StatefulWidget {
  Future<List<Playlist>> Function()? getPlaylists;
  Future<List<Playlist>> Function()? getMorePlaylists;
  Future<List<Playlist>> Function()? refresh;
  List<Playlist>? playlists;
  bool canDeleteVideos;

  PlaylistList({super.key, this.getPlaylists, this.playlists, this.getMorePlaylists, this.refresh, required this.canDeleteVideos});

  @override
  PlaylistListState createState() => PlaylistListState();
}

class PlaylistListState extends State<PlaylistList> with AfterLayoutMixin<PlaylistList> {
  RefreshController refreshController = RefreshController(initialRefresh: false);
  List<Playlist> playlists = [];
  bool loading = true;
  ScrollController scrollController = ScrollController();
  String error = '';

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScrollEvent);

    FBroadcast.instance().register(BROADCAST_SERVER_CHANGED, (value, callback) {
      getPlaylists();
    });
  }

  @override
  dispose() {
    super.dispose();
    scrollController.dispose();
    refreshController.dispose();
  }

  onScrollEvent() {
    if (widget.getMorePlaylists != null) {
      if (scrollController.hasClients) {
        if (scrollController.position.maxScrollExtent == scrollController.offset) {
          EasyDebounce.debounce('get-more-playlists', const Duration(milliseconds: 250), getMorePlaylists);
        }
      }
    }
  }

  getMorePlaylists() async {
    if (!loading && widget.getMorePlaylists != null) {
      loadPlaylist(() async {
        List<Playlist> playlists = await widget.getMorePlaylists!();
        List<Playlist> currentPlaylists = this.playlists;
        currentPlaylists.addAll(playlists);
        return currentPlaylists;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(visible: loading, child: SizedBox(height: 1, child: const LinearProgressIndicator())),
        Expanded(
          child: error.isNotEmpty
              ? Container(
                  alignment: Alignment.center,
                  color: colorScheme.background,
                  child: Visibility(visible: error.isNotEmpty, child: InkWell(onTap: () => getPlaylists(), child: Text(error))),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FadeIn(
                    duration: animationDuration,
                    curve: Curves.easeInOutQuad,
                    child: Visibility(
                      visible: widget.playlists?.isNotEmpty ?? playlists.isNotEmpty,
                      child: SmartRefresher(
                        controller: refreshController,
                        enablePullDown: widget.refresh != null,
                        enablePullUp: false,
                        onRefresh: () => widget.refresh != null ? refreshPlaylists() : getPlaylists(),
                        child: ListView.separated(
                            controller: scrollController,
                            itemBuilder: (context, index) => PlaylistItem(playlist: playlists[index], canDeleteVideos: widget.canDeleteVideos),
                            separatorBuilder: (context, index) => const Divider(),
                            itemCount: playlists.length),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  refreshPlaylists() async {
    if (widget.refresh != null) {
      loadPlaylist(() => widget.refresh!());
    } else {
      loadPlaylist(() => widget.getPlaylists!());
    }
  }

  getPlaylists() async {
    loadPlaylist(() => widget.getPlaylists!());
  }

  loadPlaylist(Future<List<Playlist>> Function() refreshFunction) async {
    var locals = AppLocalizations.of(context)!;
    if (widget.getPlaylists != null) {
      setState(() {
        error = '';
        loading = true;
      });
      try {
        var playlists = await refreshFunction();
        setState(() {
          this.playlists = playlists;
          loading = false;
        });
      } catch (err) {
        setState(() {
          this.playlists = [];
          loading = false;
          error = locals.couldntFetchVideos;
        });
        rethrow;
      }
      refreshController.refreshCompleted();
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    if (widget.getPlaylists != null) {
      getPlaylists();
    } else if (widget.playlists != null) {
      setState(() {
        loading = false;
        playlists = widget.playlists!;
      });
    }
  }
}
