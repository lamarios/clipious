import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:invidious/objectbox.g.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';

class PlayerControls extends StatefulWidget {
  final VlcPlayerController controller;
  final Function() toggleFullScreen;

  const PlayerControls({Key? key, required this.controller, required this.toggleFullScreen}) : super(key: key);

  @override
  State<PlayerControls> createState() => _PlayerControlsState();
}

class _PlayerControlsState extends State<PlayerControls> {
  final Logger log = Logger('PlayerControls');
  double progress = 0;
  double bufferPercent = 0;
  Duration position = Duration.zero;
  int lastCheck = 0;
  late bool isPlaying;
  late bool isMuted;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.addListener(onVideoEvent);
    isPlaying = widget.controller.value.isPlaying;
    isMuted = widget.controller.value.volume == 0;
  }

  onVideoEvent() {
    Duration currentPosition = widget.controller.value.position;
    if (currentPosition.inSeconds >= lastCheck + 1) {
      setState(() {
        progress = widget.controller.value.position.inSeconds / widget.controller.value.duration.inSeconds;
        position = currentPosition;
        bufferPercent = widget.controller.value.bufferPercent;
        isPlaying = widget.controller.value.isPlaying;
        isMuted = widget.controller.value.volume == 0;
      });

      lastCheck = currentPosition.inSeconds;
    } else if (currentPosition.inSeconds < lastCheck - 2) {
      lastCheck = currentPosition.inSeconds;
    }
  }

  togglePlaying() {
    isPlaying ? widget.controller.pause() : widget.controller.play();
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  rewind() {
    widget.controller.seekTo(widget.controller.value.position - Duration(seconds: 10));
  }

  skipForward() {
    widget.controller.seekTo(widget.controller.value.position + Duration(seconds: 10));
  }

  toggleMute() {
    widget.controller.setVolume(isMuted ? 100 : 0);
    setState(() {
      isMuted = !isMuted;
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: InkWell(
                          onTap: rewind,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(60)),
                            child: const Icon(Icons.fast_rewind),
                          )),
                    ),
                    InkWell(
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(60)),
                        child: InkWell(
                            onTap: togglePlaying,
                            child: Icon(
                              isPlaying ? Icons.pause : Icons.play_arrow,
                              size: 40,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: InkWell(
                        onTap: skipForward,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(60)),
                          child: const Icon(Icons.fast_forward),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text('${prettyDuration(position)}/${prettyDuration(widget.controller.value.duration)}'),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: InkWell(
                      onTap: toggleMute,
                      child: Icon(isMuted ? Icons.volume_off : Icons.volume_up_sharp, size: 17),
                    ),

                  ),
                  Expanded(child: Container(),),
                  InkWell(onTap: widget.toggleFullScreen, child: const Icon(Icons.fullscreen, size: 17,))
                ],
              ),
              Container(
                width: double.infinity,
                height: 4,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      widthFactor: bufferPercent,
                      heightFactor: 1,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: progress,
                      heightFactor: 1,
                      child: Container(
                        decoration: BoxDecoration(color: colors.primaryContainer, borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
