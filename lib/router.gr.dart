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
    TVSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TVSettingsScreen(),
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

  @override
  String toString() {
    return 'TvTextFieldRouteArgs{key: $key, controller: $controller, autofocus: $autofocus, autocorrect: $autocorrect, focusNode: $focusNode, onSubmitted: $onSubmitted, textInputAction: $textInputAction, obscureText: $obscureText, autofillHints: $autofillHints, decoration: $decoration}';
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
