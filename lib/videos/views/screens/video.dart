// import 'package:video_player/video_player.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:clipious/downloads/states/download_manager.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/router.dart';
import 'package:clipious/settings/states/settings.dart';
import 'package:clipious/utils/views/components/device_widget.dart';
import 'package:clipious/utils/views/components/placeholders.dart';
import 'package:clipious/videos/states/video.dart';
import 'package:clipious/videos/views/components/add_to_playlist_button.dart';
import 'package:clipious/videos/views/components/download_modal_sheet.dart';
import 'package:clipious/videos/views/components/inner_view.dart';
import 'package:clipious/videos/views/components/inner_view_tablet.dart';
import 'package:clipious/videos/views/components/video_share_button.dart';

import '../../../player/states/player.dart';
import '../../../utils.dart';

class VideoRouteArguments {
  final String videoId;
  bool? playNow;

  VideoRouteArguments({@pathParam required this.videoId, this.playNow});
}

@RoutePage()
class VideoScreen extends StatelessWidget {
  final String videoId;
  final bool? playNow;

  const VideoScreen({super.key, required this.videoId, this.playNow});

  void downloadVideo(BuildContext context, VideoState state) {
    var cubit = context.read<VideoCubit>();
    if (state.video != null) {
      DownloadModalSheet.showVideoModalSheet(
        context,
        state.video!,
        onDownloadStarted: (isDownloadStarted) {
          if (isDownloadStarted) {
            cubit.initStreamListener();
          }
        },
        onDownload: cubit.onDownload,
      );
    }
  }

  void openDownloadManager(BuildContext context) {
    var cubit = context.read<VideoCubit>();
    AutoRouter.of(context)
        .push(const DownloadManagerRoute())
        .then((value) => cubit.getDownloadStatus());
  }

  Object getNavigationItem(
      {required DeviceType device, required Icon icon, required String label}) {
    return switch (device) {
      DeviceType.phone => NavigationDestination(icon: icon, label: label),
      DeviceType.tablet =>
        NavigationRailDestination(icon: icon, label: Text(label)),
      (_) => throw UnsupportedError("Should not reach here")
    };
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final deviceType = getDeviceType();

    var downloadManager = context.read<DownloadManagerCubit>();

    var player = context.read<PlayerCubit>();
    var settings = context.read<SettingsCubit>();
    var distractionFreeMode = settings.state.distractionFreeMode;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => VideoCubit(
                VideoState.init(videoId: videoId),
                downloadManager,
                player,
                settings)),
      ],
      child: BlocConsumer<VideoCubit, VideoState>(
        listenWhen: (previous, current) =>
            settings.state.autoplayVideoOnLoad &&
            previous.video != current.video,
        listener: (context, state) {
          AutoRouter.of(context).maybePop();
          context.read<VideoCubit>().playVideo(false);
        },
        builder: (context, videoState) {
          return OrientationBuilder(builder: (context, orientation) {
            // we only show the tablet specific view for landscape tablets, phone portrait view is fine here
            var showTabletView = deviceType == DeviceType.tablet &&
                getOrientation() == Orientation.landscape;

            var destinations = List.of(<Widget>[
              NavigationDestination(
                  icon: const Icon(Icons.info), label: locals.info),
              NavigationDestination(
                  icon: const Icon(Icons.chat_bubble), label: locals.comments),
            ], growable: true);

            destinations.add(NavigationDestination(
                icon: const Icon(Icons.schema), label: locals.recommended));

            return AnimatedOpacity(
              duration: animationDuration,
              opacity: videoState.opacity,
              child: AutoTabsRouter.tabBar(
                  key: ValueKey(videoState.video),
                  physics: const NeverScrollableScrollPhysics(),
                  routes: [
                    VideoInfoRoute(
                        video: videoState.video,
                        dislikes: videoState.dislikes,
                        titleAndChannelInfo: deviceType == DeviceType.phone),
                    if (!distractionFreeMode)
                      CommentsRoute(video: videoState.video),
                    if (!distractionFreeMode)
                      RecommendedRoute(video: videoState.video)
                  ],
                  builder: (context, child, controller) {
                    final tabsRouter = AutoTabsRouter.of(context);
                    return Scaffold(
                      appBar: AppBar(
                        actions: videoState.loadingVideo ||
                                videoState.video == null
                            ? []
                            : [
                                AnimatedSwitcher(
                                    duration: animationDuration,
                                    child: videoState.downloading
                                        ? GestureDetector(
                                            onTap: () =>
                                                openDownloadManager(context),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: colorScheme.surface,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                                SizedBox(
                                                    height: 15,
                                                    width: 15,
                                                    child:
                                                        TweenAnimationBuilder(
                                                            duration:
                                                                animationDuration,
                                                            tween: Tween<
                                                                    double>(
                                                                begin: 0,
                                                                end: videoState
                                                                    .downloadProgress),
                                                            builder: (context,
                                                                value, child) {
                                                              return CircularProgressIndicator(
                                                                value: videoState
                                                                            .downloadProgress ==
                                                                        0
                                                                    ? null
                                                                    : value,
                                                                strokeWidth: 2,
                                                              );
                                                            }))
                                              ],
                                            ),
                                          )
                                        : Stack(
                                            children: [
                                              IconButton(
                                                  onPressed: videoState
                                                              .isDownloaded ||
                                                          videoState
                                                              .downloadFailed
                                                      ? () =>
                                                          openDownloadManager(
                                                              context)
                                                      : () => downloadVideo(
                                                          context, videoState),
                                                  icon: videoState
                                                              .isDownloaded &&
                                                          !videoState
                                                              .downloadFailed
                                                      ? const Icon(
                                                          Icons.download_done)
                                                      : const Icon(
                                                          Icons.download)),
                                              Positioned(
                                                  right: 5,
                                                  top: 5,
                                                  child: videoState
                                                          .downloadFailed
                                                      ? const Icon(
                                                          Icons.error,
                                                          size: 15,
                                                          color: Colors.red,
                                                        )
                                                      : const SizedBox.shrink())
                                            ],
                                          )),
                                Visibility(
                                  visible: videoState.video != null,
                                  child: VideoShareButton(
                                      video: videoState.video!),
                                ),
                                /*
                                VideoLikeButton(videoId: _.video?.videoId),
                                VideoAddToPlaylistButton(videoId: _.video?.videoId),
                  */
                                AddToPlayListButton(videoId: videoState.videoId)
                              ],
                      ),
                      backgroundColor: colorScheme.surface,
                      bottomNavigationBar: showTabletView ||
                              videoState.loadingVideo ||
                              distractionFreeMode
                          ? null
                          : FadeIn(
                              child: NavigationBar(
                                onDestinationSelected:
                                    tabsRouter.setActiveIndex,
                                selectedIndex: tabsRouter.activeIndex,
                                destinations: destinations,
                              ),
                            ),
                      body: SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: innerHorizontalPadding,
                              right: innerHorizontalPadding,
                              top: 8),
                          child: Container(
                            color: colorScheme.surface,
                            width: double.infinity,
                            height: double.infinity,
                            child: AnimatedSwitcher(
                                duration: animationDuration,
                                child: videoState.error.isNotEmpty
                                    ? Container(
                                        alignment: Alignment.center,
                                        child: Text(videoState.error ==
                                                coulnotLoadVideos
                                            ? locals.couldntLoadVideo
                                            : videoState.error),
                                      )
                                    : videoState.loadingVideo
                                        ? const DeviceWidget(
                                            portraitTabletAsPhone: true,
                                            phone: VideoPlaceHolder(),
                                            tablet: TabletVideoPlaceHolder())
                                        : DeviceWidget(
                                            portraitTabletAsPhone: true,
                                            phone: VideoInnerView(
                                              video: videoState.video!,
                                              playNow: playNow,
                                              videoController: videoState,
                                              child: child,
                                            ),
                                            tablet: VideoTabletInnerView(
                                              video: videoState.video!,
                                              playNow: playNow,
                                              videoController: videoState,
                                              tabController: controller,
                                              child: child,
                                            ),
                                          )),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          });
        },
      ),
    );
  }
}
