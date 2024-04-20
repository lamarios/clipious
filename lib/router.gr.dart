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
    ChannelInfoRoute.name: (routeData) {
      final args = routeData.argsAs<ChannelInfoRouteArgs>(
          orElse: () => const ChannelInfoRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChannelInfoTab(
          key: args.key,
          channel: args.channel,
        ),
      );
    },
    ChannelPlaylistsRoute.name: (routeData) {
      final args = routeData.argsAs<ChannelPlaylistsRouteArgs>(
          orElse: () => const ChannelPlaylistsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChannelPlaylistsTab(
          key: args.key,
          channelId: args.channelId,
        ),
      );
    },
    ChannelRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ChannelRouteArgs>(
          orElse: () =>
              ChannelRouteArgs(channelId: pathParams.getString('channelId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChannelScreen(
          key: args.key,
          channelId: args.channelId,
        ),
      );
    },
    ChannelShortsRoute.name: (routeData) {
      final args = routeData.argsAs<ChannelShortsRouteArgs>(
          orElse: () => const ChannelShortsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChannelShortsTab(
          key: args.key,
          channel: args.channel,
        ),
      );
    },
    ChannelStreamRoute.name: (routeData) {
      final args = routeData.argsAs<ChannelStreamRouteArgs>(
          orElse: () => const ChannelStreamRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChannelStreamTab(
          key: args.key,
          channel: args.channel,
        ),
      );
    },
    ChannelVideoRoute.name: (routeData) {
      final args = routeData.argsAs<ChannelVideoRouteArgs>(
          orElse: () => const ChannelVideoRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChannelVideoTab(
          key: args.key,
          channel: args.channel,
        ),
      );
    },
    CommentsRoute.name: (routeData) {
      final args = routeData.argsAs<CommentsRouteArgs>(
          orElse: () => const CommentsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CommentsTab(
          key: args.key,
          video: args.video,
        ),
      );
    },
    DeArrowSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DeArrowSettingsScreen(),
      );
    },
    DownloadManagerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DownloadManagerScreen(),
      );
    },
    DownloadedVideoSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DownloadedVideoSettingsScreen(),
      );
    },
    DownloadsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DownloadsTab(),
      );
    },
    EditHomeLayoutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditHomeLayoutScreen(),
      );
    },
    HistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoryTab(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeTab(),
      );
    },
    MainContentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainContentScreen(),
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
    PlaylistsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlaylistsTab(),
      );
    },
    PopularRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PopularTab(),
      );
    },
    RecommendedRoute.name: (routeData) {
      final args = routeData.argsAs<RecommendedRouteArgs>(
          orElse: () => const RecommendedRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RecommendedTab(
          key: args.key,
          video: args.video,
        ),
      );
    },
    ResetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetScreen(),
      );
    },
    SearchChannelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchChannelTab(),
      );
    },
    SearchHistorySettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchHistorySettingsScreen(),
      );
    },
    SearchHistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchHistoryTab(),
      );
    },
    SearchPlaylistRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchPlaylistTab(),
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
    SearchVideoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchVideoTab(),
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
        child: const SubscriptionTab(),
      );
    },
    TVSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TVSettingsScreen(),
      );
    },
    TrendingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TrendingTab(),
      );
    },
    TvAppLayoutSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvAppLayoutSettingsScreen(),
      );
    },
    TvChannelRoute.name: (routeData) {
      final args = routeData.argsAs<TvChannelRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvChannelScreen(
          key: args.key,
          channelId: args.channelId,
        ),
      );
    },
    TvDearrowSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvDearrowSettingsScreen(),
      );
    },
    TvFilterEditSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<TvFilterEditSettingsRouteArgs>(
          orElse: () => const TvFilterEditSettingsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvFilterEditSettingsScreen(
          key: args.key,
          channelId: args.channelId,
          filter: args.filter,
        ),
      );
    },
    TvFilterListSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvFilterListSettingsScreen(),
      );
    },
    TvGridRoute.name: (routeData) {
      final args = routeData.argsAs<TvGridRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvGridScreen(
          key: args.key,
          paginatedVideoList: args.paginatedVideoList,
          tags: args.tags,
          title: args.title,
        ),
      );
    },
    TvHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvHomeScreen(),
      );
    },
    TvManageSingleServerRoute.name: (routeData) {
      final args = routeData.argsAs<TvManageSingleServerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvManageSingleServerScreen(
          key: args.key,
          server: args.server,
        ),
      );
    },
    TvPlainTextRoute.name: (routeData) {
      final args = routeData.argsAs<TvPlainTextRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvPlainTextScreen(
          key: args.key,
          text: args.text,
        ),
      );
    },
    TvPlayerRoute.name: (routeData) {
      final args = routeData.argsAs<TvPlayerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvPlayerScreen(
          key: args.key,
          videos: args.videos,
        ),
      );
    },
    TvPlaylistGridRoute.name: (routeData) {
      final args = routeData.argsAs<TvPlaylistGridRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvPlaylistGridScreen(
          key: args.key,
          playlistList: args.playlistList,
          tags: args.tags,
        ),
      );
    },
    TvPlaylistRoute.name: (routeData) {
      final args = routeData.argsAs<TvPlaylistRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvPlaylistScreen(
          key: args.key,
          playlist: args.playlist,
          canDeleteVideos: args.canDeleteVideos,
        ),
      );
    },
    TvSearchHistorySettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvSearchHistorySettingsScreen(),
      );
    },
    TvSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvSearchScreen(),
      );
    },
    TvSelectFromListRoute.name: (routeData) {
      final args = routeData.argsAs<TvSelectFromListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvSelectFromListScreen(
          key: args.key,
          options: args.options,
          selected: args.selected,
          onSelect: args.onSelect,
          title: args.title,
        ),
      );
    },
    TvSettingsManageServersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvSettingsManageServersScreen(),
      );
    },
    TvSponsorBlockSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvSponsorBlockSettingsScreen(),
      );
    },
    TvTextFieldRoute.name: (routeData) {
      final args = routeData.argsAs<TvTextFieldRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvTextFieldScreen(
          key: args.key,
          controller: args.controller,
          autofocus: args.autofocus,
          autocorrect: args.autocorrect,
          focusNode: args.focusNode,
          onSubmitted: args.onSubmitted,
          textInputAction: args.textInputAction,
          obscureText: args.obscureText,
          autofillHints: args.autofillHints,
          decoration: args.decoration,
          keyboardType: args.keyboardType,
        ),
      );
    },
    TvTimePickerRoute.name: (routeData) {
      final args = routeData.argsAs<TvTimePickerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvTimePickerScreen(
          key: args.key,
          value: args.value,
          onTimePicked: args.onTimePicked,
        ),
      );
    },
    TvVideoRoute.name: (routeData) {
      final args = routeData.argsAs<TvVideoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvVideoScreen(
          key: args.key,
          videoId: args.videoId,
        ),
      );
    },
    TvWelcomeWizardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvWelcomeWizardScreen(),
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
    VideoInfoRoute.name: (routeData) {
      final args = routeData.argsAs<VideoInfoRouteArgs>(
          orElse: () => const VideoInfoRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VideoInfoTab(
          key: args.key,
          video: args.video,
          dislikes: args.dislikes,
          titleAndChannelInfo: args.titleAndChannelInfo,
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
/// [ChannelInfoTab]
class ChannelInfoRoute extends PageRouteInfo<ChannelInfoRouteArgs> {
  ChannelInfoRoute({
    Key? key,
    Channel? channel,
    List<PageRouteInfo>? children,
  }) : super(
          ChannelInfoRoute.name,
          args: ChannelInfoRouteArgs(
            key: key,
            channel: channel,
          ),
          initialChildren: children,
        );

  static const String name = 'ChannelInfoRoute';

  static const PageInfo<ChannelInfoRouteArgs> page =
      PageInfo<ChannelInfoRouteArgs>(name);
}

class ChannelInfoRouteArgs {
  const ChannelInfoRouteArgs({
    this.key,
    this.channel,
  });

  final Key? key;

  final Channel? channel;

  @override
  String toString() {
    return 'ChannelInfoRouteArgs{key: $key, channel: $channel}';
  }
}

/// generated route for
/// [ChannelPlaylistsTab]
class ChannelPlaylistsRoute extends PageRouteInfo<ChannelPlaylistsRouteArgs> {
  ChannelPlaylistsRoute({
    Key? key,
    String? channelId,
    List<PageRouteInfo>? children,
  }) : super(
          ChannelPlaylistsRoute.name,
          args: ChannelPlaylistsRouteArgs(
            key: key,
            channelId: channelId,
          ),
          initialChildren: children,
        );

  static const String name = 'ChannelPlaylistsRoute';

  static const PageInfo<ChannelPlaylistsRouteArgs> page =
      PageInfo<ChannelPlaylistsRouteArgs>(name);
}

class ChannelPlaylistsRouteArgs {
  const ChannelPlaylistsRouteArgs({
    this.key,
    this.channelId,
  });

  final Key? key;

  final String? channelId;

  @override
  String toString() {
    return 'ChannelPlaylistsRouteArgs{key: $key, channelId: $channelId}';
  }
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
          rawPathParams: {'channelId': channelId},
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
/// [ChannelShortsTab]
class ChannelShortsRoute extends PageRouteInfo<ChannelShortsRouteArgs> {
  ChannelShortsRoute({
    Key? key,
    Channel? channel,
    List<PageRouteInfo>? children,
  }) : super(
          ChannelShortsRoute.name,
          args: ChannelShortsRouteArgs(
            key: key,
            channel: channel,
          ),
          initialChildren: children,
        );

  static const String name = 'ChannelShortsRoute';

  static const PageInfo<ChannelShortsRouteArgs> page =
      PageInfo<ChannelShortsRouteArgs>(name);
}

class ChannelShortsRouteArgs {
  const ChannelShortsRouteArgs({
    this.key,
    this.channel,
  });

  final Key? key;

  final Channel? channel;

  @override
  String toString() {
    return 'ChannelShortsRouteArgs{key: $key, channel: $channel}';
  }
}

/// generated route for
/// [ChannelStreamTab]
class ChannelStreamRoute extends PageRouteInfo<ChannelStreamRouteArgs> {
  ChannelStreamRoute({
    Key? key,
    Channel? channel,
    List<PageRouteInfo>? children,
  }) : super(
          ChannelStreamRoute.name,
          args: ChannelStreamRouteArgs(
            key: key,
            channel: channel,
          ),
          initialChildren: children,
        );

  static const String name = 'ChannelStreamRoute';

  static const PageInfo<ChannelStreamRouteArgs> page =
      PageInfo<ChannelStreamRouteArgs>(name);
}

class ChannelStreamRouteArgs {
  const ChannelStreamRouteArgs({
    this.key,
    this.channel,
  });

  final Key? key;

  final Channel? channel;

  @override
  String toString() {
    return 'ChannelStreamRouteArgs{key: $key, channel: $channel}';
  }
}

/// generated route for
/// [ChannelVideoTab]
class ChannelVideoRoute extends PageRouteInfo<ChannelVideoRouteArgs> {
  ChannelVideoRoute({
    Key? key,
    Channel? channel,
    List<PageRouteInfo>? children,
  }) : super(
          ChannelVideoRoute.name,
          args: ChannelVideoRouteArgs(
            key: key,
            channel: channel,
          ),
          initialChildren: children,
        );

  static const String name = 'ChannelVideoRoute';

  static const PageInfo<ChannelVideoRouteArgs> page =
      PageInfo<ChannelVideoRouteArgs>(name);
}

class ChannelVideoRouteArgs {
  const ChannelVideoRouteArgs({
    this.key,
    this.channel,
  });

  final Key? key;

  final Channel? channel;

  @override
  String toString() {
    return 'ChannelVideoRouteArgs{key: $key, channel: $channel}';
  }
}

/// generated route for
/// [CommentsTab]
class CommentsRoute extends PageRouteInfo<CommentsRouteArgs> {
  CommentsRoute({
    Key? key,
    Video? video,
    List<PageRouteInfo>? children,
  }) : super(
          CommentsRoute.name,
          args: CommentsRouteArgs(
            key: key,
            video: video,
          ),
          initialChildren: children,
        );

  static const String name = 'CommentsRoute';

  static const PageInfo<CommentsRouteArgs> page =
      PageInfo<CommentsRouteArgs>(name);
}

class CommentsRouteArgs {
  const CommentsRouteArgs({
    this.key,
    this.video,
  });

  final Key? key;

  final Video? video;

  @override
  String toString() {
    return 'CommentsRouteArgs{key: $key, video: $video}';
  }
}

/// generated route for
/// [DeArrowSettingsScreen]
class DeArrowSettingsRoute extends PageRouteInfo<void> {
  const DeArrowSettingsRoute({List<PageRouteInfo>? children})
      : super(
          DeArrowSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeArrowSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [DownloadedVideoSettingsScreen]
class DownloadedVideoSettingsRoute extends PageRouteInfo<void> {
  const DownloadedVideoSettingsRoute({List<PageRouteInfo>? children})
      : super(
          DownloadedVideoSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DownloadedVideoSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DownloadsTab]
class DownloadsRoute extends PageRouteInfo<void> {
  const DownloadsRoute({List<PageRouteInfo>? children})
      : super(
          DownloadsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DownloadsRoute';

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
/// [HistoryTab]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute({List<PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeTab]
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
/// [MainContentScreen]
class MainContentRoute extends PageRouteInfo<void> {
  const MainContentRoute({List<PageRouteInfo>? children})
      : super(
          MainContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainContentRoute';

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
/// [PlaylistsTab]
class PlaylistsRoute extends PageRouteInfo<void> {
  const PlaylistsRoute({List<PageRouteInfo>? children})
      : super(
          PlaylistsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaylistsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PopularTab]
class PopularRoute extends PageRouteInfo<void> {
  const PopularRoute({List<PageRouteInfo>? children})
      : super(
          PopularRoute.name,
          initialChildren: children,
        );

  static const String name = 'PopularRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RecommendedTab]
class RecommendedRoute extends PageRouteInfo<RecommendedRouteArgs> {
  RecommendedRoute({
    Key? key,
    Video? video,
    List<PageRouteInfo>? children,
  }) : super(
          RecommendedRoute.name,
          args: RecommendedRouteArgs(
            key: key,
            video: video,
          ),
          initialChildren: children,
        );

  static const String name = 'RecommendedRoute';

  static const PageInfo<RecommendedRouteArgs> page =
      PageInfo<RecommendedRouteArgs>(name);
}

class RecommendedRouteArgs {
  const RecommendedRouteArgs({
    this.key,
    this.video,
  });

  final Key? key;

  final Video? video;

  @override
  String toString() {
    return 'RecommendedRouteArgs{key: $key, video: $video}';
  }
}

/// generated route for
/// [ResetScreen]
class ResetRoute extends PageRouteInfo<void> {
  const ResetRoute({List<PageRouteInfo>? children})
      : super(
          ResetRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchChannelTab]
class SearchChannelRoute extends PageRouteInfo<void> {
  const SearchChannelRoute({List<PageRouteInfo>? children})
      : super(
          SearchChannelRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchChannelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [SearchHistoryTab]
class SearchHistoryRoute extends PageRouteInfo<void> {
  const SearchHistoryRoute({List<PageRouteInfo>? children})
      : super(
          SearchHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchHistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchPlaylistTab]
class SearchPlaylistRoute extends PageRouteInfo<void> {
  const SearchPlaylistRoute({List<PageRouteInfo>? children})
      : super(
          SearchPlaylistRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchPlaylistRoute';

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
/// [SearchVideoTab]
class SearchVideoRoute extends PageRouteInfo<void> {
  const SearchVideoRoute({List<PageRouteInfo>? children})
      : super(
          SearchVideoRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchVideoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [SubscriptionTab]
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
/// [TVSettingsScreen]
class TVSettingsRoute extends PageRouteInfo<void> {
  const TVSettingsRoute({List<PageRouteInfo>? children})
      : super(
          TVSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TVSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TrendingTab]
class TrendingRoute extends PageRouteInfo<void> {
  const TrendingRoute({List<PageRouteInfo>? children})
      : super(
          TrendingRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrendingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TvAppLayoutSettingsScreen]
class TvAppLayoutSettingsRoute extends PageRouteInfo<void> {
  const TvAppLayoutSettingsRoute({List<PageRouteInfo>? children})
      : super(
          TvAppLayoutSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvAppLayoutSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TvChannelScreen]
class TvChannelRoute extends PageRouteInfo<TvChannelRouteArgs> {
  TvChannelRoute({
    Key? key,
    required String channelId,
    List<PageRouteInfo>? children,
  }) : super(
          TvChannelRoute.name,
          args: TvChannelRouteArgs(
            key: key,
            channelId: channelId,
          ),
          initialChildren: children,
        );

  static const String name = 'TvChannelRoute';

  static const PageInfo<TvChannelRouteArgs> page =
      PageInfo<TvChannelRouteArgs>(name);
}

class TvChannelRouteArgs {
  const TvChannelRouteArgs({
    this.key,
    required this.channelId,
  });

  final Key? key;

  final String channelId;

  @override
  String toString() {
    return 'TvChannelRouteArgs{key: $key, channelId: $channelId}';
  }
}

/// generated route for
/// [TvDearrowSettingsScreen]
class TvDearrowSettingsRoute extends PageRouteInfo<void> {
  const TvDearrowSettingsRoute({List<PageRouteInfo>? children})
      : super(
          TvDearrowSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvDearrowSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TvFilterEditSettingsScreen]
class TvFilterEditSettingsRoute
    extends PageRouteInfo<TvFilterEditSettingsRouteArgs> {
  TvFilterEditSettingsRoute({
    Key? key,
    String? channelId,
    VideoFilter? filter,
    List<PageRouteInfo>? children,
  }) : super(
          TvFilterEditSettingsRoute.name,
          args: TvFilterEditSettingsRouteArgs(
            key: key,
            channelId: channelId,
            filter: filter,
          ),
          initialChildren: children,
        );

  static const String name = 'TvFilterEditSettingsRoute';

  static const PageInfo<TvFilterEditSettingsRouteArgs> page =
      PageInfo<TvFilterEditSettingsRouteArgs>(name);
}

class TvFilterEditSettingsRouteArgs {
  const TvFilterEditSettingsRouteArgs({
    this.key,
    this.channelId,
    this.filter,
  });

  final Key? key;

  final String? channelId;

  final VideoFilter? filter;

  @override
  String toString() {
    return 'TvFilterEditSettingsRouteArgs{key: $key, channelId: $channelId, filter: $filter}';
  }
}

/// generated route for
/// [TvFilterListSettingsScreen]
class TvFilterListSettingsRoute extends PageRouteInfo<void> {
  const TvFilterListSettingsRoute({List<PageRouteInfo>? children})
      : super(
          TvFilterListSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvFilterListSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TvGridScreen]
class TvGridRoute extends PageRouteInfo<TvGridRouteArgs> {
  TvGridRoute({
    Key? key,
    required PaginatedList<VideoInList> paginatedVideoList,
    String? tags,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          TvGridRoute.name,
          args: TvGridRouteArgs(
            key: key,
            paginatedVideoList: paginatedVideoList,
            tags: tags,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'TvGridRoute';

  static const PageInfo<TvGridRouteArgs> page = PageInfo<TvGridRouteArgs>(name);
}

class TvGridRouteArgs {
  const TvGridRouteArgs({
    this.key,
    required this.paginatedVideoList,
    this.tags,
    required this.title,
  });

  final Key? key;

  final PaginatedList<VideoInList> paginatedVideoList;

  final String? tags;

  final String title;

  @override
  String toString() {
    return 'TvGridRouteArgs{key: $key, paginatedVideoList: $paginatedVideoList, tags: $tags, title: $title}';
  }
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
/// [TvManageSingleServerScreen]
class TvManageSingleServerRoute
    extends PageRouteInfo<TvManageSingleServerRouteArgs> {
  TvManageSingleServerRoute({
    Key? key,
    required Server server,
    List<PageRouteInfo>? children,
  }) : super(
          TvManageSingleServerRoute.name,
          args: TvManageSingleServerRouteArgs(
            key: key,
            server: server,
          ),
          initialChildren: children,
        );

  static const String name = 'TvManageSingleServerRoute';

  static const PageInfo<TvManageSingleServerRouteArgs> page =
      PageInfo<TvManageSingleServerRouteArgs>(name);
}

class TvManageSingleServerRouteArgs {
  const TvManageSingleServerRouteArgs({
    this.key,
    required this.server,
  });

  final Key? key;

  final Server server;

  @override
  String toString() {
    return 'TvManageSingleServerRouteArgs{key: $key, server: $server}';
  }
}

/// generated route for
/// [TvPlainTextScreen]
class TvPlainTextRoute extends PageRouteInfo<TvPlainTextRouteArgs> {
  TvPlainTextRoute({
    Key? key,
    required String text,
    List<PageRouteInfo>? children,
  }) : super(
          TvPlainTextRoute.name,
          args: TvPlainTextRouteArgs(
            key: key,
            text: text,
          ),
          initialChildren: children,
        );

  static const String name = 'TvPlainTextRoute';

  static const PageInfo<TvPlainTextRouteArgs> page =
      PageInfo<TvPlainTextRouteArgs>(name);
}

class TvPlainTextRouteArgs {
  const TvPlainTextRouteArgs({
    this.key,
    required this.text,
  });

  final Key? key;

  final String text;

  @override
  String toString() {
    return 'TvPlainTextRouteArgs{key: $key, text: $text}';
  }
}

/// generated route for
/// [TvPlayerScreen]
class TvPlayerRoute extends PageRouteInfo<TvPlayerRouteArgs> {
  TvPlayerRoute({
    Key? key,
    required List<BaseVideo> videos,
    List<PageRouteInfo>? children,
  }) : super(
          TvPlayerRoute.name,
          args: TvPlayerRouteArgs(
            key: key,
            videos: videos,
          ),
          initialChildren: children,
        );

  static const String name = 'TvPlayerRoute';

  static const PageInfo<TvPlayerRouteArgs> page =
      PageInfo<TvPlayerRouteArgs>(name);
}

class TvPlayerRouteArgs {
  const TvPlayerRouteArgs({
    this.key,
    required this.videos,
  });

  final Key? key;

  final List<BaseVideo> videos;

  @override
  String toString() {
    return 'TvPlayerRouteArgs{key: $key, videos: $videos}';
  }
}

/// generated route for
/// [TvPlaylistGridScreen]
class TvPlaylistGridRoute extends PageRouteInfo<TvPlaylistGridRouteArgs> {
  TvPlaylistGridRoute({
    Key? key,
    required PaginatedList<Playlist> playlistList,
    String? tags,
    List<PageRouteInfo>? children,
  }) : super(
          TvPlaylistGridRoute.name,
          args: TvPlaylistGridRouteArgs(
            key: key,
            playlistList: playlistList,
            tags: tags,
          ),
          initialChildren: children,
        );

  static const String name = 'TvPlaylistGridRoute';

  static const PageInfo<TvPlaylistGridRouteArgs> page =
      PageInfo<TvPlaylistGridRouteArgs>(name);
}

class TvPlaylistGridRouteArgs {
  const TvPlaylistGridRouteArgs({
    this.key,
    required this.playlistList,
    this.tags,
  });

  final Key? key;

  final PaginatedList<Playlist> playlistList;

  final String? tags;

  @override
  String toString() {
    return 'TvPlaylistGridRouteArgs{key: $key, playlistList: $playlistList, tags: $tags}';
  }
}

/// generated route for
/// [TvPlaylistScreen]
class TvPlaylistRoute extends PageRouteInfo<TvPlaylistRouteArgs> {
  TvPlaylistRoute({
    Key? key,
    required Playlist playlist,
    required bool canDeleteVideos,
    List<PageRouteInfo>? children,
  }) : super(
          TvPlaylistRoute.name,
          args: TvPlaylistRouteArgs(
            key: key,
            playlist: playlist,
            canDeleteVideos: canDeleteVideos,
          ),
          initialChildren: children,
        );

  static const String name = 'TvPlaylistRoute';

  static const PageInfo<TvPlaylistRouteArgs> page =
      PageInfo<TvPlaylistRouteArgs>(name);
}

class TvPlaylistRouteArgs {
  const TvPlaylistRouteArgs({
    this.key,
    required this.playlist,
    required this.canDeleteVideos,
  });

  final Key? key;

  final Playlist playlist;

  final bool canDeleteVideos;

  @override
  String toString() {
    return 'TvPlaylistRouteArgs{key: $key, playlist: $playlist, canDeleteVideos: $canDeleteVideos}';
  }
}

/// generated route for
/// [TvSearchHistorySettingsScreen]
class TvSearchHistorySettingsRoute extends PageRouteInfo<void> {
  const TvSearchHistorySettingsRoute({List<PageRouteInfo>? children})
      : super(
          TvSearchHistorySettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvSearchHistorySettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TvSearchScreen]
class TvSearchRoute extends PageRouteInfo<void> {
  const TvSearchRoute({List<PageRouteInfo>? children})
      : super(
          TvSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TvSelectFromListScreen]
class TvSelectFromListRoute extends PageRouteInfo<TvSelectFromListRouteArgs> {
  TvSelectFromListRoute({
    Key? key,
    required List<String> options,
    required String selected,
    required dynamic Function(String) onSelect,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          TvSelectFromListRoute.name,
          args: TvSelectFromListRouteArgs(
            key: key,
            options: options,
            selected: selected,
            onSelect: onSelect,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'TvSelectFromListRoute';

  static const PageInfo<TvSelectFromListRouteArgs> page =
      PageInfo<TvSelectFromListRouteArgs>(name);
}

class TvSelectFromListRouteArgs {
  const TvSelectFromListRouteArgs({
    this.key,
    required this.options,
    required this.selected,
    required this.onSelect,
    required this.title,
  });

  final Key? key;

  final List<String> options;

  final String selected;

  final dynamic Function(String) onSelect;

  final String title;

  @override
  String toString() {
    return 'TvSelectFromListRouteArgs{key: $key, options: $options, selected: $selected, onSelect: $onSelect, title: $title}';
  }
}

/// generated route for
/// [TvSettingsManageServersScreen]
class TvSettingsManageServersRoute extends PageRouteInfo<void> {
  const TvSettingsManageServersRoute({List<PageRouteInfo>? children})
      : super(
          TvSettingsManageServersRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvSettingsManageServersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TvSponsorBlockSettingsScreen]
class TvSponsorBlockSettingsRoute extends PageRouteInfo<void> {
  const TvSponsorBlockSettingsRoute({List<PageRouteInfo>? children})
      : super(
          TvSponsorBlockSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvSponsorBlockSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TvTextFieldScreen]
class TvTextFieldRoute extends PageRouteInfo<TvTextFieldRouteArgs> {
  TvTextFieldRoute({
    Key? key,
    required TextEditingController controller,
    bool? autofocus,
    bool? autocorrect,
    FocusNode? focusNode,
    void Function(String)? onSubmitted,
    TextInputAction? textInputAction,
    bool? obscureText,
    Iterable<String>? autofillHints,
    InputDecoration? decoration,
    TextInputType? keyboardType,
    List<PageRouteInfo>? children,
  }) : super(
          TvTextFieldRoute.name,
          args: TvTextFieldRouteArgs(
            key: key,
            controller: controller,
            autofocus: autofocus,
            autocorrect: autocorrect,
            focusNode: focusNode,
            onSubmitted: onSubmitted,
            textInputAction: textInputAction,
            obscureText: obscureText,
            autofillHints: autofillHints,
            decoration: decoration,
            keyboardType: keyboardType,
          ),
          initialChildren: children,
        );

  static const String name = 'TvTextFieldRoute';

  static const PageInfo<TvTextFieldRouteArgs> page =
      PageInfo<TvTextFieldRouteArgs>(name);
}

class TvTextFieldRouteArgs {
  const TvTextFieldRouteArgs({
    this.key,
    required this.controller,
    this.autofocus,
    this.autocorrect,
    this.focusNode,
    this.onSubmitted,
    this.textInputAction,
    this.obscureText,
    this.autofillHints,
    this.decoration,
    this.keyboardType,
  });

  final Key? key;

  final TextEditingController controller;

  final bool? autofocus;

  final bool? autocorrect;

  final FocusNode? focusNode;

  final void Function(String)? onSubmitted;

  final TextInputAction? textInputAction;

  final bool? obscureText;

  final Iterable<String>? autofillHints;

  final InputDecoration? decoration;

  final TextInputType? keyboardType;

  @override
  String toString() {
    return 'TvTextFieldRouteArgs{key: $key, controller: $controller, autofocus: $autofocus, autocorrect: $autocorrect, focusNode: $focusNode, onSubmitted: $onSubmitted, textInputAction: $textInputAction, obscureText: $obscureText, autofillHints: $autofillHints, decoration: $decoration, keyboardType: $keyboardType}';
  }
}

/// generated route for
/// [TvTimePickerScreen]
class TvTimePickerRoute extends PageRouteInfo<TvTimePickerRouteArgs> {
  TvTimePickerRoute({
    Key? key,
    required String value,
    required dynamic Function(String) onTimePicked,
    List<PageRouteInfo>? children,
  }) : super(
          TvTimePickerRoute.name,
          args: TvTimePickerRouteArgs(
            key: key,
            value: value,
            onTimePicked: onTimePicked,
          ),
          initialChildren: children,
        );

  static const String name = 'TvTimePickerRoute';

  static const PageInfo<TvTimePickerRouteArgs> page =
      PageInfo<TvTimePickerRouteArgs>(name);
}

class TvTimePickerRouteArgs {
  const TvTimePickerRouteArgs({
    this.key,
    required this.value,
    required this.onTimePicked,
  });

  final Key? key;

  final String value;

  final dynamic Function(String) onTimePicked;

  @override
  String toString() {
    return 'TvTimePickerRouteArgs{key: $key, value: $value, onTimePicked: $onTimePicked}';
  }
}

/// generated route for
/// [TvVideoScreen]
class TvVideoRoute extends PageRouteInfo<TvVideoRouteArgs> {
  TvVideoRoute({
    Key? key,
    required String videoId,
    List<PageRouteInfo>? children,
  }) : super(
          TvVideoRoute.name,
          args: TvVideoRouteArgs(
            key: key,
            videoId: videoId,
          ),
          initialChildren: children,
        );

  static const String name = 'TvVideoRoute';

  static const PageInfo<TvVideoRouteArgs> page =
      PageInfo<TvVideoRouteArgs>(name);
}

class TvVideoRouteArgs {
  const TvVideoRouteArgs({
    this.key,
    required this.videoId,
  });

  final Key? key;

  final String videoId;

  @override
  String toString() {
    return 'TvVideoRouteArgs{key: $key, videoId: $videoId}';
  }
}

/// generated route for
/// [TvWelcomeWizardScreen]
class TvWelcomeWizardRoute extends PageRouteInfo<void> {
  const TvWelcomeWizardRoute({List<PageRouteInfo>? children})
      : super(
          TvWelcomeWizardRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvWelcomeWizardRoute';

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
/// [VideoInfoTab]
class VideoInfoRoute extends PageRouteInfo<VideoInfoRouteArgs> {
  VideoInfoRoute({
    Key? key,
    Video? video,
    int? dislikes,
    bool titleAndChannelInfo = true,
    List<PageRouteInfo>? children,
  }) : super(
          VideoInfoRoute.name,
          args: VideoInfoRouteArgs(
            key: key,
            video: video,
            dislikes: dislikes,
            titleAndChannelInfo: titleAndChannelInfo,
          ),
          initialChildren: children,
        );

  static const String name = 'VideoInfoRoute';

  static const PageInfo<VideoInfoRouteArgs> page =
      PageInfo<VideoInfoRouteArgs>(name);
}

class VideoInfoRouteArgs {
  const VideoInfoRouteArgs({
    this.key,
    this.video,
    this.dislikes,
    this.titleAndChannelInfo = true,
  });

  final Key? key;

  final Video? video;

  final int? dislikes;

  final bool titleAndChannelInfo;

  @override
  String toString() {
    return 'VideoInfoRouteArgs{key: $key, video: $video, dislikes: $dislikes, titleAndChannelInfo: $titleAndChannelInfo}';
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
