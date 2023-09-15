import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invidious/app/views/screens/main.dart';
import 'package:invidious/app/views/tv/screens/tv_home.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/playlists/models/playlist.dart';
import 'package:invidious/playlists/views/screens/playlist.dart';
import 'package:invidious/search/views/screens/search.dart';
import 'package:invidious/settings/models/db/server.dart';
import 'package:invidious/settings/models/db/video_filter.dart';
import 'package:invidious/settings/views/screens/app_logs.dart';
import 'package:invidious/settings/views/screens/appearance.dart';
import 'package:invidious/settings/views/screens/browsing.dart';
import 'package:invidious/settings/views/screens/manage_servers.dart';
import 'package:invidious/settings/views/screens/manage_single_server.dart';
import 'package:invidious/settings/views/screens/notifications.dart';
import 'package:invidious/settings/views/screens/search_history_settings.dart';
import 'package:invidious/settings/views/screens/settings.dart';
import 'package:invidious/settings/views/screens/sponsor_block_settings.dart';
import 'package:invidious/settings/views/screens/video_filter.dart';
import 'package:invidious/settings/views/screens/video_filter_setup.dart';
import 'package:invidious/settings/views/screens/video_player.dart';
import 'package:invidious/subscription_management/view/screens/manage_subscriptions.dart';
import 'package:invidious/videos/views/screens/subscriptions.dart';
import 'package:invidious/videos/views/screens/video.dart';
import 'package:invidious/welcome_wizard/views/screens/welcome_wizard.dart';

import 'channels/views/screens/channel.dart';
import 'downloads/views/screens/download_manager.dart';
import 'home/views/screens/edit_layout.dart';
import 'home/views/screens/home.dart';
import 'main.dart';

part 'router.gr.dart';

final appRouter = AppRouter();

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    bool hasServer = false;
    try {
      db.getCurrentlySelectedServer();
      hasServer = true;
    } catch (e) {
      hasServer = false;
    }
    return isTv
        ? [
            AutoRoute(
              path: '/',
              page: TvHomeRoute.page,
              initial: true,
            )
          ]
        : [
            AutoRoute(
              page: MainRoute.page,
              initial: hasServer,
              children: [
                AutoRoute(page: HomeRoute.page, initial: true),
                AutoRoute(page: VideoRoute.page),
                AutoRoute(page: ChannelRoute.page),
                AutoRoute(page: DownloadManagerRoute.page),
                AutoRoute(page: SearchRoute.page),
                AutoRoute(page: EditHomeLayoutRoute.page),
                AutoRoute(page: SettingsRoute.page),
                AutoRoute(page: BrowsingSettingsRoute.page),
                AutoRoute(page: ManageServersRoute.page),
                AutoRoute(page: ManageSingleServerRoute.page),
                AutoRoute(page: VideoPlayerSettingsRoute.page),
                AutoRoute(page: AppearanceSettingsRoute.page),
                AutoRoute(page: SearchHistorySettingsRoute.page),
                AutoRoute(page: VideoFilterSettingsRoute.page),
                AutoRoute(page: VideoFilterSetupRoute.page),
                AutoRoute(page: SponsorBlockSettingsRoute.page),
                AutoRoute(page: NotificationSettingsRoute.page),
                AutoRoute(page: ManageSubscriptionsRoute.page),
                AutoRoute(page: AppLogsRoute.page),
                AutoRoute(page: PlaylistViewRoute.page)
              ],
            ),
            AutoRoute(page: WelcomeWizardRoute.page, initial: !hasServer)
          ];
  }
}