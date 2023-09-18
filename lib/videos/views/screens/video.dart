// import 'package:video_player/video_player.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/downloads/states/download_manager.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/router.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/utils/views/components/placeholders.dart';
import 'package:invidious/videos/states/video.dart';
import 'package:invidious/videos/views/components/add_to_playlist_button.dart';
import 'package:invidious/videos/views/components/download_modal_sheet.dart';
import 'package:invidious/videos/views/components/inner_view_tablet.dart';
import 'package:invidious/videos/views/components/innter_view.dart';
import 'package:invidious/videos/views/components/video_share_button.dart';

import '../../../player/states/player.dart';
import '../../../utils.dart';

class VideoRouteArguments {
  final String videoId;
  bool? playNow;

  VideoRouteArguments({required this.videoId, this.playNow});
}

@RoutePage()
class VideoScreen extends StatelessWidget {
  final String videoId;
  final bool? playNow;

  const VideoScreen({super.key, required this.videoId, this.playNow});

  void downloadVideo(BuildContext context, VideoState _) {
    var cubit = context.read<VideoCubit>();
    if (_.video != null) {
      DownloadModalSheet.showVideoModalSheet(
        context,
        _.video!,
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
    AutoRouter.of(context).push(const DownloadManagerRoute()).then((value) => cubit.getDownloadStatus());
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    bool show3Navigation = getDeviceType() == DeviceType.phone;

    var destinations = List.of(<Widget>[
      NavigationDestination(icon: const Icon(Icons.info), label: locals.info),
      NavigationDestination(icon: const Icon(Icons.chat_bubble), label: locals.comments),
    ], growable: true);

    if (show3Navigation) {
      destinations.add(NavigationDestination(icon: const Icon(Icons.schema), label: locals.recommended));
    }

    var downloadManager = context.read<DownloadManagerCubit>();

    var player = context.read<PlayerCubit>();
    var settings = context.read<SettingsCubit>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                VideoCubit(VideoState(videoId: videoId), downloadManager, player, settings)),
      ],
      child: BlocBuilder<VideoCubit, VideoState>(
        builder: (context, _) {
          var cubit = context.read<VideoCubit>();
          var settings = context.read<SettingsCubit>();

          return AnimatedOpacity(
            duration: animationDuration,
            opacity: _.opacity,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: colorScheme.background,
                actions: _.loadingVideo || _.video == null
                    ? []
                    : [
                        AnimatedSwitcher(
                            duration: animationDuration,
                            child: _.downloading
                                ? GestureDetector(
                                    onTap: () => openDownloadManager(context),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.add,
                                            color: colorScheme.background,
                                          ),
                                          onPressed: () {},
                                        ),
                                        SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: CircularProgressIndicator(
                                              value: _.downloadProgress == 0 ? null : _.downloadProgress,
                                              strokeWidth: 2,
                                            ))
                                      ],
                                    ),
                                  )
                                : Stack(
                                    children: [
                                      IconButton(
                                          onPressed: _.isDownloaded || _.downloadFailed
                                              ? () => openDownloadManager(context)
                                              : () => downloadVideo(context, _),
                                          icon: _.isDownloaded && !_.downloadFailed
                                              ? const Icon(Icons.download_done)
                                              : const Icon(Icons.download)),
                                      Positioned(
                                          right: 5,
                                          top: 5,
                                          child: _.downloadFailed
                                              ? const Icon(
                                                  Icons.error,
                                                  size: 15,
                                                  color: Colors.red,
                                                )
                                              : const SizedBox.shrink())
                                    ],
                                  )),
                        Visibility(
                          visible: _.video != null,
                          child: VideoShareButton(video: _.video!),
                        ),
/*
                        VideoLikeButton(videoId: _.video?.videoId),
                        VideoAddToPlaylistButton(videoId: _.video?.videoId),
*/
                        AddToPlayListButton(videoId: _.videoId)
                      ],
                scrolledUnderElevation: 0,
              ),
              backgroundColor: colorScheme.background,
              bottomNavigationBar: _.loadingVideo || settings.state.distractionFreeMode
                  ? null
                  : FadeIn(
                      child: NavigationBar(
                        backgroundColor: colorScheme.background,
                        labelBehavior: context.read<SettingsCubit>().state.navigationBarLabelBehavior,
                        elevation: 0,
                        onDestinationSelected: cubit.selectIndex,
                        selectedIndex: _.selectedIndex,
                        destinations: destinations,
                      ),
                    ),
              body: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.only(left: innerHorizontalPadding, right: innerHorizontalPadding, top: 8),
                  child: Container(
                    color: colorScheme.background,
                    width: double.infinity,
                    height: double.infinity,
                    child: AnimatedSwitcher(
                        duration: animationDuration,
                        child: _.error.isNotEmpty
                            ? Container(
                                alignment: Alignment.center,
                                child: Text(_.error == coulnotLoadVideos ? locals.couldntLoadVideo : _.error),
                              )
                            : show3Navigation
                                ? _.loadingVideo
                                    ? const VideoPlaceHolder()
                                    : VideoInnerView(
                                        video: _.video!,
                                        selectedIndex: _.selectedIndex,
                                        playNow: playNow,
                                        videoController: _,
                                      )
                                : _.loadingVideo
                                    ? Container(
                                        constraints: BoxConstraints(maxWidth: tabletMaxVideoWidth),
                                        child: const VideoPlaceHolder())
                                    : VideoTabletInnerView(
                                        video: _.video!,
                                        playNow: playNow,
                                        selectedIndex: _.selectedIndex,
                                        videoController: _,
                                      )),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
