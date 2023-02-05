import 'package:invidious/utils.dart';
import 'package:invidious/views/video/info.dart';
import 'package:invidious/views/video/recommendedVideos.dart';
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
  int selectedIndex = 0;

  @override
  dispose() async {
    super.dispose();
    if (controller != null) {
      await controller!.dispose();
      chewieController!.dispose();
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
              materialProgressColors:
                  ChewieProgressColors(playedColor: colorScheme.primary.withOpacity(0.5), backgroundColor: Colors.grey.withOpacity(0.5), bufferedColor: Colors.grey, handleColor: colorScheme.primary));

          playingVideo = true;
          controller!.setVolume(100).then((value) {});
          controller!.play();
        });
      });
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

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          print(index);
          setState(() {
            selectedIndex = index;
          });
        },
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.info), label: 'Info'),
          NavigationDestination(icon: Icon(Icons.chat_bubble), label: 'Comments'),
          NavigationDestination(icon: Icon(Icons.schema), label: 'Recommended')
        ],
      ),
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
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: controller?.value.aspectRatio ?? 16 / 9,
                            child: AnimatedContainer(
                              decoration: BoxDecoration(
                                  color: colorScheme.onSurface,
                                  borderRadius: BorderRadius.circular(10),
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
                                      : Chewie(controller: chewieController!)),
                            ),
                          ),
                          Text(
                            video?.title ?? '',
                            style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 20),
                            textAlign: TextAlign.start,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: colorScheme.onSurface,
                                      image: DecorationImage(image: NetworkImage(video?.getBestAuthorThumbnail()?.url ?? ''), fit: BoxFit.cover)),
                                ),
                              ),
                              Text(video!.author)
                            ],
                          ),
                          Expanded(child: Padding(padding: EdgeInsets.only(top: 10), child: <Widget>[VideoInfo(video: video!), Text('comments'), RecommendedVideos(video: video!)][selectedIndex]))
                        ],
                      ),
                    )),
        ),
      ),
    );
  }

  @override
  Future<FutureOr<void>> afterFirstLayout(BuildContext context) async {
    Video video = await service.getVideo(widget.videoId);
    setState(() {
      this.video = video;
      loadingVideo = false;
    });
  }
}
