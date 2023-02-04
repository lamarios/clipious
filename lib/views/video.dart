import 'package:invidious/utils.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:chewie/chewie.dart';
import '../models/video.dart';

class VideoView extends StatefulWidget {
  final String videoId;

  const VideoView({super.key, required this.videoId});

  @override
  State<VideoView> createState() => VideoViewState();
}

class VideoViewState extends State<VideoView> with AfterLayoutMixin<VideoView> {
  Video? video;
  bool loadingVideo = true;
  bool playingVideo = false;
  bool showControls = false;
  double progress = 0;
  String progressText = '';
  VideoPlayerController? controller;
  ChewieController? chewieController;

  @override
  dispose() async {
    super.dispose();
    if (controller != null) {
      controller!.removeListener(onVideoEvent);
      await controller!.dispose();
    }
  }

  playVideo(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    controller = VideoPlayerController.network(video!.formatStreams[2].url)
      ..initialize().then((v) {
        setState(() {
          chewieController = ChewieController(
            videoPlayerController: controller!,
            autoPlay: true,
            materialProgressColors: ChewieProgressColors(playedColor: colorScheme.primary, backgroundColor: Colors.grey.withOpacity(0.5), bufferedColor: Colors.grey, handleColor: colorScheme.primary)

          );

          playingVideo = true;
          controller!.setVolume(100).then((value) {});
          controller!.play();
        });
      });

    controller!.addListener(onVideoEvent);
  }

  togglePlayPause() {
    controller!.value.isPlaying ? controller!.pause() : controller!.play();
    setState(() {
      showControls = true;
      if (controller!.value.isPlaying) {
        EasyDebounce.debounce('video-controls', Duration(seconds: 2), () {
          setState(() {
            showControls = false;
          });
        });
      } else {
        EasyDebounce.cancel('video-controls');
      }
    });
  }

  onVideoEvent() {
    double progress = getProgress();
    String progressText = getFormattedTextProgress();
    setState(() {
      this.progress = progress;
      this.progressText = progressText;
    });
  }

  double getProgress() {
    if (controller != null) {
      return controller!.value.position.inMilliseconds / controller!.value.duration.inMilliseconds;
    } else {
      return 0;
    }
  }

  String getFormattedTextProgress() {
    if (controller != null) {
      return '${prettyDuration(controller!.value.position)} / ${prettyDuration(controller!.value.duration)}';
    } else {
      return '';
    }
  }

  Widget getProgressStack(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    List<Widget> progressBars = [];

    controller!.value.buffered.forEach((buffer) {
      double offset = buffer.start.inMilliseconds / controller!.value.duration.inMilliseconds;
      double width = (buffer.end.inMilliseconds - buffer.start.inMilliseconds) / controller!.value.duration.inMilliseconds;

      progressBars.add(AnimatedFractionallySizedBox(
        widthFactor: width,
        heightFactor: 1,
        duration: animationDuration ~/ 2,
        child: Container(
          alignment: Alignment(offset, 0),
          decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(10)),
        ),
      ));
    });

    progressBars.add(AnimatedFractionallySizedBox(
      widthFactor: getProgress(),
      heightFactor: 1,
      duration: animationDuration ~/ 2,
      child: Container(
        decoration: BoxDecoration(color: colorScheme.primary, borderRadius: BorderRadius.circular(10)),
      ),
    ));

    return Stack(children: progressBars);
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: colorScheme.background,
          width: double.infinity,
          height: double.infinity,
          child: AnimatedSwitcher(
              duration: animationDuration,
              child: loadingVideo
                  ? const CircularProgressIndicator()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: controller?.value.aspectRatio ?? 1.77777778,
                          child: AnimatedContainer(
                            decoration: BoxDecoration(
                                color: colorScheme.onSurface,
                                image: DecorationImage(
                                  image: NetworkImage(video?.getBestThumbnail()?.url ?? ''),
                                  fit: BoxFit.cover,
                                )),
                            width: double.infinity,
                            alignment: Alignment.center,
                            duration: animationDuration,
                            child: AnimatedSwitcher(
                              duration: animationDuration,
                              child: !playingVideo
                                  ? GestureDetector(
                                      key: const ValueKey('nt-playing'),
                                      onTap: () => playVideo(context),
                                      child: Icon(
                                        Icons.play_arrow,
                                        color: colorScheme.primary,
                                        size: 100,
                                      ),
                                    )
                                  :  Chewie(controller: chewieController!)
/*
                              GestureDetector(
                                      key: const ValueKey('playing'),
                                      onTap: togglePlayPause,
                                      child: Stack(
                                        fit: StackFit.expand,
                                        alignment: Alignment.center,
                                        children: [
                                          VideoPlayer(controller!),
                                          AnimatedOpacity(
                                              opacity: showControls ? 1.0 : 0,
                                              duration: animationDuration ~/ 2,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Positioned(
                                                      bottom: 0,
                                                      left: 0,
                                                      right: 0,
                                                      child: Container(
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                            gradient: LinearGradient(colors: [Colors.transparent, Colors.black], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                                                      )),
                                                  Icon(
                                                    controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                                    color: colorScheme.primary,
                                                    size: 100,
                                                  ),
                                                  Positioned(
                                                    bottom: 30,
                                                    left: 10,
                                                    right: 10,
                                                    child: Container(
                                                        width: double.infinity,
                                                        height: 5,
                                                        alignment: Alignment.centerLeft,
                                                        decoration: BoxDecoration(color: Colors.grey.shade500, borderRadius: BorderRadius.circular(10)),
                                                        child: getProgressStack(context)),
                                                  ),
                                                  Positioned(
                                                      left: 10,
                                                      bottom: 10,
                                                      child: Text(
                                                        progressText,
                                                        style: TextStyle(color: Colors.white),
                                                      ))
                                                ],
                                              ))
                                        ],
                                      )),
*/
                            ),
                          ),
                        ),
                        Text(
                          video?.title ?? '',
                          style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 25),
                          textAlign: TextAlign.start,
                        ),
                        Row(
                          children: [],
                          crossAxisAlignment: CrossAxisAlignment.center,
                        )
                      ],
                    )),
        ),
      ),
    );
  }

  @override
  Future<FutureOr<void>> afterFirstLayout(BuildContext context) async {
    Video video = await service.getVideo(PAULFLIX, widget.videoId);
    setState(() {
      this.video = video;
      loadingVideo = false;
    });
  }
}
