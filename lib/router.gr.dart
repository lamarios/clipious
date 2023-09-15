// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppLogsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppLogsScreen(),
      );
    },
    AppearanceSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppearanceSettingsScreen(),
      );
    },
    BrowsingSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BrowsingSettingsScreen(),
      );
    },
    ChannelRoute.name: (routeData) {
      final args = routeData.argsAs<ChannelRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChannelScreen(
          key: args.key,
          channelId: args.channelId,
        ),
      );
    },
    DownloadManagerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DownloadManagerScreen(),
      );
    },
    EditHomeLayoutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditHomeLayoutScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    ManageServersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ManageServersScreen(),
      );
    },
    ManageSingleServerRoute.name: (routeData) {
      final args = routeData.argsAs<ManageSingleServerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ManageSingleServerScreen(
          key: args.key,
          server: args.server,
        ),
      );
    },
    ManageSubscriptionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ManageSubscriptionsScreen(),
      );
    },
    NotificationSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationSettingsScreen(),
      );
    },
    PlaylistViewRoute.name: (routeData) {
      final args = routeData.argsAs<PlaylistViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlaylistViewScreen(
          key: args.key,
          playlist: args.playlist,
          canDeleteVideos: args.canDeleteVideos,
        ),
      );
    },
    SearchHistorySettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchHistorySettingsScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchScreen(
          key: args.key,
          query: args.query,
          searchNow: args.searchNow,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SponsorBlockSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SponsorBlockSettingsScreen(),
      );
    },
    SubscriptionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SubscriptionScreen(),
      );
    },
    TvHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvHomeScreen(),
      );
    },
    VideoFilterSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VideoFilterSettingsScreen(),
      );
    },
    VideoFilterSetupRoute.name: (routeData) {
      final args = routeData.argsAs<VideoFilterSetupRouteArgs>(
          orElse: () => const VideoFilterSetupRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VideoFilterSetupScreen(
          key: args.key,
          channelId: args.channelId,
          filter: args.filter,
        ),
      );
    },
    VideoPlayerSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VideoPlayerSettingsScreen(),
      );
    },
    VideoRoute.name: (routeData) {
      final args = routeData.argsAs<VideoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VideoScreen(
          key: args.key,
          videoId: args.videoId,
          playNow: args.playNow,
        ),
      );
    },
    WelcomeWizardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomeWizardScreen(),
      );
    },
  };
}

/// generated route for
/// [AppLogsScreen]
class AppLogsRoute extends PageRouteInfo<void> {
  const AppLogsRoute({List<PageRouteInfo>? children})
      : super(
          AppLogsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppLogsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AppearanceSettingsScreen]
class AppearanceSettingsRoute extends PageRouteInfo<void> {
  const AppearanceSettingsRoute({List<PageRouteInfo>? children})
      : super(
          AppearanceSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppearanceSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BrowsingSettingsScreen]
class BrowsingSettingsRoute extends PageRouteInfo<void> {
  const BrowsingSettingsRoute({List<PageRouteInfo>? children})
      : super(
          BrowsingSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BrowsingSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChannelScreen]
class ChannelRoute extends PageRouteInfo<ChannelRouteArgs> {
  ChannelRoute({
    Key? key,
    required String channelId,
    List<PageRouteInfo>? children,
  }) : super(
          ChannelRoute.name,
          args: ChannelRouteArgs(
            key: key,
            channelId: channelId,
          ),
          initialChildren: children,
        );

  static const String name = 'ChannelRoute';

  static const PageInfo<ChannelRouteArgs> page =
      PageInfo<ChannelRouteArgs>(name);
}

class ChannelRouteArgs {
  const ChannelRouteArgs({
    this.key,
    required this.channelId,
  });

  final Key? key;

  final String channelId;

  @override
  String toString() {
    return 'ChannelRouteArgs{key: $key, channelId: $channelId}';
  }
}

/// generated route for
/// [DownloadManagerScreen]
class DownloadManagerRoute extends PageRouteInfo<void> {
  const DownloadManagerRoute({List<PageRouteInfo>? children})
      : super(
          DownloadManagerRoute.name,
          initialChildren: children,
        );

  static const String name = 'DownloadManagerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditHomeLayoutScreen]
class EditHomeLayoutRoute extends PageRouteInfo<void> {
  const EditHomeLayoutRoute({List<PageRouteInfo>? children})
      : super(
          EditHomeLayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditHomeLayoutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ManageServersScreen]
class ManageServersRoute extends PageRouteInfo<void> {
  const ManageServersRoute({List<PageRouteInfo>? children})
      : super(
          ManageServersRoute.name,
          initialChildren: children,
        );

  static const String name = 'ManageServersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ManageSingleServerScreen]
class ManageSingleServerRoute
    extends PageRouteInfo<ManageSingleServerRouteArgs> {
  ManageSingleServerRoute({
    Key? key,
    required Server server,
    List<PageRouteInfo>? children,
  }) : super(
          ManageSingleServerRoute.name,
          args: ManageSingleServerRouteArgs(
            key: key,
            server: server,
          ),
          initialChildren: children,
        );

  static const String name = 'ManageSingleServerRoute';

  static const PageInfo<ManageSingleServerRouteArgs> page =
      PageInfo<ManageSingleServerRouteArgs>(name);
}

class ManageSingleServerRouteArgs {
  const ManageSingleServerRouteArgs({
    this.key,
    required this.server,
  });

  final Key? key;

  final Server server;

  @override
  String toString() {
    return 'ManageSingleServerRouteArgs{key: $key, server: $server}';
  }
}

/// generated route for
/// [ManageSubscriptionsScreen]
class ManageSubscriptionsRoute extends PageRouteInfo<void> {
  const ManageSubscriptionsRoute({List<PageRouteInfo>? children})
      : super(
          ManageSubscriptionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ManageSubscriptionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationSettingsScreen]
class NotificationSettingsRoute extends PageRouteInfo<void> {
  const NotificationSettingsRoute({List<PageRouteInfo>? children})
      : super(
          NotificationSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlaylistViewScreen]
class PlaylistViewRoute extends PageRouteInfo<PlaylistViewRouteArgs> {
  PlaylistViewRoute({
    Key? key,
    required Playlist playlist,
    required bool canDeleteVideos,
    List<PageRouteInfo>? children,
  }) : super(
          PlaylistViewRoute.name,
          args: PlaylistViewRouteArgs(
            key: key,
            playlist: playlist,
            canDeleteVideos: canDeleteVideos,
          ),
          initialChildren: children,
        );

  static const String name = 'PlaylistViewRoute';

  static const PageInfo<PlaylistViewRouteArgs> page =
      PageInfo<PlaylistViewRouteArgs>(name);
}

class PlaylistViewRouteArgs {
  const PlaylistViewRouteArgs({
    this.key,
    required this.playlist,
    required this.canDeleteVideos,
  });

  final Key? key;

  final Playlist playlist;

  final bool canDeleteVideos;

  @override
  String toString() {
    return 'PlaylistViewRouteArgs{key: $key, playlist: $playlist, canDeleteVideos: $canDeleteVideos}';
  }
}

/// generated route for
/// [SearchHistorySettingsScreen]
class SearchHistorySettingsRoute extends PageRouteInfo<void> {
  const SearchHistorySettingsRoute({List<PageRouteInfo>? children})
      : super(
          SearchHistorySettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchHistorySettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    Key? key,
    String? query,
    bool? searchNow,
    List<PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(
            key: key,
            query: query,
            searchNow: searchNow,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<SearchRouteArgs> page = PageInfo<SearchRouteArgs>(name);
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    this.query,
    this.searchNow,
  });

  final Key? key;

  final String? query;

  final bool? searchNow;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, query: $query, searchNow: $searchNow}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SponsorBlockSettingsScreen]
class SponsorBlockSettingsRoute extends PageRouteInfo<void> {
  const SponsorBlockSettingsRoute({List<PageRouteInfo>? children})
      : super(
          SponsorBlockSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SponsorBlockSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SubscriptionScreen]
class SubscriptionRoute extends PageRouteInfo<void> {
  const SubscriptionRoute({List<PageRouteInfo>? children})
      : super(
          SubscriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SubscriptionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TvHomeScreen]
class TvHomeRoute extends PageRouteInfo<void> {
  const TvHomeRoute({List<PageRouteInfo>? children})
      : super(
          TvHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VideoFilterSettingsScreen]
class VideoFilterSettingsRoute extends PageRouteInfo<void> {
  const VideoFilterSettingsRoute({List<PageRouteInfo>? children})
      : super(
          VideoFilterSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'VideoFilterSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VideoFilterSetupScreen]
class VideoFilterSetupRoute extends PageRouteInfo<VideoFilterSetupRouteArgs> {
  VideoFilterSetupRoute({
    Key? key,
    String? channelId,
    VideoFilter? filter,
    List<PageRouteInfo>? children,
  }) : super(
          VideoFilterSetupRoute.name,
          args: VideoFilterSetupRouteArgs(
            key: key,
            channelId: channelId,
            filter: filter,
          ),
          initialChildren: children,
        );

  static const String name = 'VideoFilterSetupRoute';

  static const PageInfo<VideoFilterSetupRouteArgs> page =
      PageInfo<VideoFilterSetupRouteArgs>(name);
}

class VideoFilterSetupRouteArgs {
  const VideoFilterSetupRouteArgs({
    this.key,
    this.channelId,
    this.filter,
  });

  final Key? key;

  final String? channelId;

  final VideoFilter? filter;

  @override
  String toString() {
    return 'VideoFilterSetupRouteArgs{key: $key, channelId: $channelId, filter: $filter}';
  }
}

/// generated route for
/// [VideoPlayerSettingsScreen]
class VideoPlayerSettingsRoute extends PageRouteInfo<void> {
  const VideoPlayerSettingsRoute({List<PageRouteInfo>? children})
      : super(
          VideoPlayerSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'VideoPlayerSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VideoScreen]
class VideoRoute extends PageRouteInfo<VideoRouteArgs> {
  VideoRoute({
    Key? key,
    required String videoId,
    bool? playNow,
    List<PageRouteInfo>? children,
  }) : super(
          VideoRoute.name,
          args: VideoRouteArgs(
            key: key,
            videoId: videoId,
            playNow: playNow,
          ),
          initialChildren: children,
        );

  static const String name = 'VideoRoute';

  static const PageInfo<VideoRouteArgs> page = PageInfo<VideoRouteArgs>(name);
}

class VideoRouteArgs {
  const VideoRouteArgs({
    this.key,
    required this.videoId,
    this.playNow,
  });

  final Key? key;

  final String videoId;

  final bool? playNow;

  @override
  String toString() {
    return 'VideoRouteArgs{key: $key, videoId: $videoId, playNow: $playNow}';
  }
}

/// generated route for
/// [WelcomeWizardScreen]
class WelcomeWizardRoute extends PageRouteInfo<void> {
  const WelcomeWizardRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeWizardRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeWizardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
