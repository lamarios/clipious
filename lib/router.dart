import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/app/views/screens/main.dart';
import 'package:clipious/app/views/tv/screens/tv_home.dart';
import 'package:clipious/channels/views/screens/info_tab.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/player/states/player.dart';
import 'package:clipious/player/views/tv/screens/tv_player_view.dart';
import 'package:clipious/playlists/models/playlist.dart';
import 'package:clipious/playlists/views/screens/playlist.dart';
import 'package:clipious/playlists/views/tv/screens/playlist.dart';
import 'package:clipious/playlists/views/tv/screens/playlist_grid.dart';
import 'package:clipious/search/views/screens/channel_tab.dart';
import 'package:clipious/search/views/screens/playlist_tab.dart';
import 'package:clipious/search/views/screens/search.dart';
import 'package:clipious/search/views/screens/video_tab.dart';
import 'package:clipious/search/views/tv/screens/search.dart';
import 'package:clipious/settings/models/db/server.dart';
import 'package:clipious/settings/models/db/video_filter.dart';
import 'package:clipious/settings/views/screens/add_server.dart';
import 'package:clipious/settings/views/screens/app_logs.dart';
import 'package:clipious/settings/views/screens/appearance.dart';
import 'package:clipious/settings/views/screens/browsing.dart';
import 'package:clipious/settings/views/screens/dearrow.dart';
import 'package:clipious/settings/views/screens/manage_servers.dart';
import 'package:clipious/settings/views/screens/manage_single_server.dart';
import 'package:clipious/settings/views/screens/notifications.dart';
import 'package:clipious/settings/views/screens/search_history_settings.dart';
import 'package:clipious/settings/views/screens/settings.dart';
import 'package:clipious/settings/views/screens/sponsor_block_settings.dart';
import 'package:clipious/settings/views/screens/video_filter.dart';
import 'package:clipious/settings/views/screens/video_filter_setup.dart';
import 'package:clipious/settings/views/screens/video_player.dart';
import 'package:clipious/settings/views/tv/screens/add_server.dart';
import 'package:clipious/settings/views/tv/screens/app_layout.dart';
import 'package:clipious/settings/views/tv/screens/dearrow_settings.dart';
import 'package:clipious/settings/views/tv/screens/filter_edit.dart';
import 'package:clipious/settings/views/tv/screens/filter_list.dart';
import 'package:clipious/settings/views/tv/screens/manage_servers.dart';
import 'package:clipious/settings/views/tv/screens/manage_single_server.dart';
import 'package:clipious/settings/views/tv/screens/search_history_settings.dart';
import 'package:clipious/settings/views/tv/screens/settings.dart';
import 'package:clipious/settings/views/tv/screens/sponsor_block_settings.dart';
import 'package:clipious/subscription_management/view/screens/manage_subscriptions.dart';
import 'package:clipious/utils/models/paginated_list.dart';
import 'package:clipious/utils/views/tv/components/select_from_list.dart';
import 'package:clipious/utils/views/tv/components/tv_plain_text.dart';
import 'package:clipious/utils/views/tv/components/tv_text_field.dart';
import 'package:clipious/utils/views/tv/components/tv_time_picker.dart';
import 'package:clipious/videos/models/video.dart';
import 'package:clipious/videos/views/screens/comments_tab.dart';
import 'package:clipious/videos/views/screens/info_tab.dart';
import 'package:clipious/videos/views/screens/recommended_tab.dart';
import 'package:clipious/videos/views/screens/video.dart';
import 'package:clipious/videos/views/tv/screens/video.dart';
import 'package:clipious/videos/views/tv/screens/video_grid_view.dart';
import 'package:clipious/welcome_wizard/views/screens/welcome_wizard.dart';
import 'package:clipious/welcome_wizard/views/tv/screens/welcome_wizard.dart';
import 'package:logging/logging.dart';

import 'channels/models/channel.dart';
import 'channels/views/screens/channel.dart';
import 'channels/views/screens/playlists_tab.dart';
import 'channels/views/screens/shorts_tab.dart';
import 'channels/views/screens/stream_tab.dart';
import 'channels/views/screens/video_tab.dart';
import 'channels/views/tv/screens/channel.dart';
import 'downloads/views/screens/download_manager.dart';
import 'home/views/screens/downloads_tab.dart';
import 'home/views/screens/edit_layout.dart';
import 'home/views/screens/history_tab.dart';
import 'home/views/screens/home.dart';
import 'home/views/screens/home_tab.dart';
import 'home/views/screens/playlists_tab.dart';
import 'home/views/screens/popular_tab.dart';
import 'home/views/screens/search_history_tab.dart';
import 'home/views/screens/subscription_tab.dart';
import 'home/views/screens/trending_tab.dart';
import 'main.dart';

part 'router.gr.dart';

const pathManageSingleServerFromWizard = '/wizard/manage-single-server';
const pathManageSingleServerFromSettings = 'manage-single-server';

late AppRouter appRouter;

final log = Logger('Router');

const mainPath = '/';
const contentPath = 'content';
const homePath = 'home';
const subscriptionPath = 'subscriptions';
const playlistsPath = 'playlists';
const historyPath = 'history';
const popularPath = 'popular';
const trendingPath = 'trending';
const downloadsPath = 'downloads';
const searchHistoryPath = 'searchHistory';
const searchPath = 'search';
const videoPath = 'video/:videoId';
const infoPath = 'info';
const channelsPath = 'channels';
const recommendedVideoPath = 'recommended';
const commentsPath = 'comments';
const channelPath = 'channel/:channelId';
const videosPath = 'videos';
const shortsPath = 'shorts';
const streamsPath = 'streams';

@AutoRouterConfig(replaceInRouteName: 'Screen|Tab,Route', argsEquality: false)
class AppRouter extends RootStackRouter {
  final bool hasServer;

  AppRouter({required this.hasServer});

  @override
  void pop<T extends Object?>([T? result]) {
    print('YOOOO');
    // TODO: implement pop
    super.pop(result);
  }

  @override
  List<AutoRoute> get routes {
    return isTv
        ? [
            AutoRoute(
              page: TvHomeRoute.page,
              initial: hasServer,
            ),
            AutoRoute(page: TvWelcomeWizardRoute.page, initial: !hasServer),
            AutoRoute(page: TvChannelRoute.page),
            AutoRoute(page: TvGridRoute.page),
            AutoRoute(page: TvVideoRoute.page),
            AutoRoute(page: TvSearchRoute.page),
            AutoRoute(page: TvPlayerRoute.page),
            AutoRoute(page: TvPlaylistGridRoute.page),
            AutoRoute(page: TvPlaylistRoute.page),
            AutoRoute(page: TVSettingsRoute.page),
            AutoRoute(page: TvSettingsManageServersRoute.page),
            AutoRoute(page: TvSearchHistorySettingsRoute.page),
            AutoRoute(page: TvSponsorBlockSettingsRoute.page),
            AutoRoute(page: TvManageSingleServerRoute.page),
            AutoRoute(page: TvSelectFromListRoute.page),
            AutoRoute(page: TvTextFieldRoute.page),
            AutoRoute(page: TvDearrowSettingsRoute.page),
            AutoRoute(page: TvAppLayoutSettingsRoute.page),
            AutoRoute(page: TvFilterEditSettingsRoute.page),
            AutoRoute(page: TvFilterListSettingsRoute.page),
            AutoRoute(page: TvTimePickerRoute.page),
            AutoRoute(page: TvPlainTextRoute.page),
            AutoRoute(page: TvAddServerRoute.page)
          ]
        : [
            AutoRoute(
              page: MainRoute.page,
              initial: hasServer,
              path: mainPath,
              children: [
                AutoRoute(
                    page: MainContentRoute.page,
                    initial: true,
                    children: [
                      AutoRoute(page: HomeRoute.page, path: homePath),
                      AutoRoute(
                          page: SubscriptionRoute.page, path: subscriptionPath),
                      AutoRoute(page: HistoryRoute.page, path: historyPath),
                      AutoRoute(page: PlaylistsRoute.page, path: playlistsPath),
                      AutoRoute(page: PopularRoute.page, path: popularPath),
                      AutoRoute(page: TrendingRoute.page, path: trendingPath),
                      AutoRoute(page: DownloadsRoute.page, path: downloadsPath),
                      AutoRoute(
                          page: SearchHistoryRoute.page,
                          path: searchHistoryPath),
                    ]),
                AutoRoute(page: VideoRoute.page, path: videoPath, children: [
                  AutoRoute(page: VideoInfoRoute.page, path: infoPath),
                  AutoRoute(
                      page: RecommendedRoute.page, path: recommendedVideoPath),
                  AutoRoute(page: CommentsRoute.page, path: commentsPath)
                ]),
                AutoRoute(
                    page: ChannelRoute.page,
                    path: channelPath,
                    children: [
                      AutoRoute(page: ChannelInfoRoute.page, path: infoPath),
                      AutoRoute(page: ChannelVideoRoute.page, path: videosPath),
                      AutoRoute(
                          page: ChannelShortsRoute.page, path: shortsPath),
                      AutoRoute(
                          page: ChannelStreamRoute.page, path: streamsPath),
                      AutoRoute(
                          page: ChannelPlaylistsRoute.page, path: playlistsPath)
                    ]),
                AutoRoute(page: DownloadManagerRoute.page),
                AutoRoute(page: SearchRoute.page, path: searchPath, children: [
                  AutoRoute(page: SearchVideoRoute.page, path: videosPath),
                  AutoRoute(page: SearchChannelRoute.page, path: channelPath),
                  AutoRoute(page: SearchPlaylistRoute.page, path: playlistsPath)
                ]),
                AutoRoute(page: EditHomeLayoutRoute.page),
                AutoRoute(page: SettingsRoute.page),
                AutoRoute(page: BrowsingSettingsRoute.page),
                AutoRoute(page: ManageServersRoute.page),
                AutoRoute(
                    page: ManageSingleServerRoute.page,
                    path: pathManageSingleServerFromSettings),
                AutoRoute(page: VideoPlayerSettingsRoute.page),
                AutoRoute(page: AppearanceSettingsRoute.page),
                AutoRoute(page: SearchHistorySettingsRoute.page),
                AutoRoute(page: VideoFilterSettingsRoute.page),
                AutoRoute(page: VideoFilterSetupRoute.page),
                AutoRoute(page: SponsorBlockSettingsRoute.page),
                AutoRoute(page: NotificationSettingsRoute.page),
                AutoRoute(page: ManageSubscriptionsRoute.page),
                AutoRoute(page: AppLogsRoute.page),
                AutoRoute(page: PlaylistViewRoute.page),
                // AutoRoute(page: SubscriptionRoute.page),
                AutoRoute(page: DeArrowSettingsRoute.page),
              ],
            ),
            AutoRoute(
                page: ManageSingleServerRoute.page,
                path: pathManageSingleServerFromWizard),
            AutoRoute(page: WelcomeWizardRoute.page, initial: !hasServer),
            AutoRoute(
              page: AddServerRoute.page,
            )
          ];
  }

  @override
  late final List<AutoRouteGuard> guards = [
    AutoRouteGuard.simple(onNavigation)
  ];

  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    try {
      var routeName = resolver.route.name;
      if (routeName == TvWelcomeWizardRoute.name ||
          routeName == WelcomeWizardRoute.name ||
          routeName == AddServerRoute.name ||
          routeName == TvTextFieldRoute.name ||
          routeName == TvAddServerRoute.name) {
        resolver.next(true);
        return;
      }
      await db.getCurrentlySelectedServer();
      resolver.next(true);
    } catch (e) {
      if (isTv) {
        resolver.redirectUntil(const TvWelcomeWizardRoute(), replace: true);
      } else {
        resolver.redirectUntil(const WelcomeWizardRoute(), replace: true);
      }
    }
    // TODO: implement onNavigation
  }
}

class MyRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log.fine(
        'New route pushed: ${route.settings.name}, ${route.runtimeType}, previous route: ${previousRoute?.settings.name}, ${previousRoute.runtimeType}');
    log.fine('current route: ${appRouter.current.name}');
    if (route.settings.name != null) {
      route.navigator?.context.read<PlayerCubit>().showMiniPlayer();
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log.fine(
        'New route popped: ${route.settings.name}, ${route.runtimeType}, previous route: ${previousRoute?.settings.name}, ${previousRoute.runtimeType}');
    log.fine('current route: ${appRouter.current.name}');
    super.didPop(route, previousRoute);
  }

/*
  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('Tab route re-visited: ${route.name}');
  }
*/
}
