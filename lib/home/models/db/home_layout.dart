import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/videos/models/video_in_list.dart';
import 'package:objectbox/objectbox.dart';

import '../../../downloads/states/download_manager.dart';
import '../../../globals.dart';
import '../../../main.dart';
import '../../../playlists/views/components/playlist_list.dart';
import '../../../settings/states/settings.dart';
import '../../../utils/models/paginatedList.dart';
import '../../../videos/models/db/history_video_cache.dart';
import '../../../videos/views/components/history.dart';
import '../../../videos/views/components/video_list.dart';
import '../../views/components/home.dart';

part 'home_layout.g.dart';

enum HomeDataSourceAppearance { tv, phone, both }

enum HomeDataSource {
  home(big: false, small: false, showOn: HomeDataSourceAppearance.phone), // used for app layout set-up
  popular,
  trending,
  subscription,
  history(showOn: HomeDataSourceAppearance.phone),
  playlist,
  downloads(showOn: HomeDataSourceAppearance.phone),
  searchHistory(showOn: HomeDataSourceAppearance.phone),
  search(showOn: HomeDataSourceAppearance.tv);

  final bool small;
  final bool big;
  final HomeDataSourceAppearance showOn;

  const HomeDataSource({this.small = true, this.big = true, this.showOn = HomeDataSourceAppearance.both});

  static List<HomeDataSource> defaultSettings() {
    return isTv ? [search, subscription, playlist, popular, trending] : [home, subscription, playlist, history];
  }

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
      (HomeDataSource.search) => locals.search,
    };
  }

  IconData getIcon() {
    return switch (this) {
      (HomeDataSource.trending) => Icons.trending_up,
      (HomeDataSource.popular) => Icons.local_fire_department,
      (HomeDataSource.playlist) => Icons.playlist_play,
      (HomeDataSource.history) => Icons.history,
      (HomeDataSource.downloads) => Icons.download,
      (HomeDataSource.searchHistory) => Icons.saved_search,
      (HomeDataSource.subscription) => Icons.subscriptions,
      (HomeDataSource.home) => Icons.home,
      (HomeDataSource.search) => Icons.search,
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
      (HomeDataSource.trending) => NavigationDestination(icon: Icon(getIcon()), label: getLabel(locals)),
      (HomeDataSource.popular) => NavigationDestination(icon: Icon(getIcon()), label: getLabel(locals)),
      (HomeDataSource.playlist) => NavigationDestination(icon: Icon(getIcon()), label: getLabel(locals)),
      (HomeDataSource.history) => NavigationDestination(icon: Icon(getIcon()), label: getLabel(locals)),
      (HomeDataSource.downloads) => NavigationDestination(icon: Icon(getIcon()), label: getLabel(locals)),
      (HomeDataSource.searchHistory) => NavigationDestination(icon: Icon(getIcon()), label: getLabel(locals)),
      (HomeDataSource.subscription) => NavigationDestination(icon: Icon(getIcon()), label: getLabel(locals)),
      (HomeDataSource.home) => NavigationDestination(icon: Icon(getIcon()), label: getLabel(locals)),
      (HomeDataSource.search) => NavigationDestination(icon: Icon(getIcon()), label: getLabel(locals))
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
          child: BlocBuilder<DownloadManagerCubit, DownloadManagerState>(
              buildWhen: (previous, current) => previous.videos != current.videos,
              builder: (context, downloads) {
                var videos = downloads.videos.reversed.where((e) => e.downloadComplete && !e.downloadFailed).toList();
                return VideoList(
                  key: ValueKey(videos),
                  scrollDirection: small ? Axis.horizontal : Axis.vertical,
                  small: small,
                  animateDownload: true,
                  paginatedVideoList: FixedItemList(videos),
                );
              })),
      (HomeDataSource.searchHistory) => SizedBox(
          height: small ? 40 : null,
          child: ListView(
            scrollDirection: small ? Axis.horizontal : Axis.vertical,
            children: db
                .getSearchHistory()
                .map((e) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: small ? 8 : 0),
                      child: FilledButton.tonal(onPressed: () => HomeView.openSearch(context, e), child: Text(e)),
                    ))
                .toList(),
          )),
      (HomeDataSource.history) => SizedBox(
          height: small ? smallVideoViewHeight : null,
          child: small
              ? VideoList(
                  scrollDirection: small ? Axis.horizontal : Axis.vertical,
                  small: small,
                  animateDownload: true,
                  paginatedVideoList: PageBasedPaginatedList<VideoInList>(
                      getItemsFunc: (page, maxResults) =>
                          // we get the data for each video
                          service
                              .getUserHistory(page, maxResults)
                              .then((value) => Future.wait(value.map((e) async => (await HistoryVideoCache.fromVideoIdToVideo(e)).toBaseVideo().toVideoInList()).toList())),
                      maxResults: 20),
                )
              : const HistoryView(),
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
