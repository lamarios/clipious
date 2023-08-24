import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/extensions.dart';
import 'package:objectbox/objectbox.dart';

import '../../../downloads/states/download_manager.dart';
import '../../../globals.dart';
import '../../../playlists/views/components/playlist_list.dart';
import '../../../settings/states/settings.dart';
import '../../../utils/models/paginatedList.dart';
import '../../../videos/views/components/history.dart';
import '../../../videos/views/components/video_in_list.dart';
import '../../../videos/views/components/video_list.dart';
import '../../views/components/home.dart';

part 'home_layout.g.dart';

enum HomeDataSource {
  home(big: false, small: false), // used for app layout set-up
  popular,
  trending,
  subscription,
  history,
  playlist,
  downloads,
  searchHistory(big: false);

  final bool small;
  final bool big;

  const HomeDataSource({this.small = true, this.big = true});

  String getLabel(AppLocalizations locals) {
    return switch (this) {
      (HomeDataSource.trending) => locals.trending,
      (HomeDataSource.popular) => locals.popular,
      (HomeDataSource.playlist) => locals.playlists,
      (HomeDataSource.history) => locals.history,
      (HomeDataSource.downloads) => locals.downloads,
      (HomeDataSource.searchHistory) => locals.searchHistory,
      (HomeDataSource.subscription) => locals.subscriptions,
      (HomeDataSource.home) => locals.home,
    };
  }

  bool isPermitted(BuildContext context) {
    return switch (this) {
      (HomeDataSource.subscription || HomeDataSource.playlist || HomeDataSource.history) => context.read<AppCubit>().isLoggedIn,
      (HomeDataSource.searchHistory) => context.read<SettingsCubit>().state.useSearchHistory,
      (_) => true
    };
  }

  Widget getBottomBarNavigationWidget(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return switch (this) {
      (HomeDataSource.trending) => NavigationDestination(icon: const Icon(Icons.trending_up), label: getLabel(locals)),
      (HomeDataSource.popular) => NavigationDestination(icon: const Icon(Icons.local_fire_department), label: getLabel(locals)),
      (HomeDataSource.playlist) => NavigationDestination(icon: const Icon(Icons.playlist_play), label: getLabel(locals)),
      (HomeDataSource.history) => NavigationDestination(icon: const Icon(Icons.history), label: getLabel(locals)),
      (HomeDataSource.downloads) => NavigationDestination(icon: const Icon(Icons.download), label: getLabel(locals)),
      (HomeDataSource.searchHistory) => NavigationDestination(icon: const Icon(Icons.saved_search), label: getLabel(locals)),
      (HomeDataSource.subscription) => NavigationDestination(icon: const Icon(Icons.subscriptions), label: getLabel(locals)),
      (HomeDataSource.home) => NavigationDestination(icon: const Icon(Icons.home), label: getLabel(locals)),
    };
  }

  Widget build(BuildContext context, bool small) {
    return switch (this) {
      (HomeDataSource.trending) => SizedBox(
          height: small ? smallVideoViewHeight : null,
          child: VideoList(
            scrollDirection: small ? Axis.horizontal : Axis.vertical,
            small: small,
            animateDownload: true,
            paginatedVideoList: SingleEndpointList(service.getTrending),
          )),
      (HomeDataSource.subscription) => SizedBox(
          height: small ? smallVideoViewHeight : null,
          child: VideoList(
            scrollDirection: small ? Axis.horizontal : Axis.vertical,
            small: small,
            animateDownload: true,
            paginatedVideoList: SubscriptionVideoList(),
          )),
      (HomeDataSource.popular) => SizedBox(
          height: small ? smallVideoViewHeight : null,
          child: VideoList(
            scrollDirection: small ? Axis.horizontal : Axis.vertical,
            small: small,
            animateDownload: true,
            paginatedVideoList: SingleEndpointList(service.getPopular),
          )),
      (HomeDataSource.playlist) => SizedBox(
          height: small ? smallVideoViewHeight : null,
          child: PlaylistList(
            canDeleteVideos: true,
            small: small,
            paginatedList: SingleEndpointList(service.getUserPlaylists),
          )),
      (HomeDataSource.downloads) => SizedBox(
          height: small ? smallVideoViewHeight : null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(builder: (context) {
              var videos = context.select((DownloadManagerCubit value) => value.state.videos);
              return ListView(
                scrollDirection: small ? Axis.horizontal : Axis.vertical,
                children: videos
                    .where((e) => e.downloadComplete && !e.downloadFailed) // we keep only downloaded videos
                    .sortByReversed((e) => e.id)
                    .map((e) => AspectRatio(
                          aspectRatio: smallHistoryAspectRatio,
                          child: VideoListItem(
                            offlineVideo: e,
                            small: small,
                          ),
                        ))
                    .toList(),
              );
            }),
          )),
      (HomeDataSource.searchHistory) => SizedBox(
          height: small ? 40 : null,
          child: ListView(
            scrollDirection: small ? Axis.horizontal : Axis.vertical,
            children: db
                .getSearchHistory()
                .map((e) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: FilledButton.tonal(onPressed: () => HomeView.openSearch(context, e), child: Text(e)),
                    ))
                .toList(),
          )),
      (HomeDataSource.history) => SizedBox(
          height: small ? smallVideoViewHeight : null,
          child: HistoryView(
            small: small,
          ),
        ),
      (HomeDataSource.home) => small ? const SizedBox.shrink() : const HomeView(),
      (_) => const SizedBox.shrink()
    };
  }
}

@Entity()
@CopyWith(constructor: "_")
class HomeLayout {
  @Id()
  int id = 0;

  @Transient()
  List<HomeDataSource> smallSources = [HomeDataSource.popular];

  @Transient()
  HomeDataSource bigSource = HomeDataSource.trending;

  bool showBigSource = true;

  HomeLayout();

  HomeLayout._(this.id, this.smallSources, this.bigSource, this.showBigSource);

  String get dbBigSource => bigSource.name;

  set dbBigSource(String value) {
    bigSource = HomeDataSource.values.where((element) => element.name == value).firstOrNull ?? HomeDataSource.trending;
  }

  List<String> get dbSmallSources => smallSources.map((e) => e.name).toList();

  set dbSmallSources(List<String> values) {
    smallSources = values.map((e) => HomeDataSource.values.where((element) => element.name == e).firstOrNull ?? HomeDataSource.trending).toList();
  }
}
