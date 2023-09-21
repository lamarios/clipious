import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/player/states/player.dart';
import 'package:invidious/videos/models/base_video.dart';
import 'package:invidious/videos/views/components/add_to_playlist_button.dart';
import 'package:invidious/videos/views/components/download_modal_sheet.dart';

import '../../../main.dart';
import 'add_to_queue_button.dart';

class VideoModalSheet extends StatelessWidget {
  final BaseVideo video;

  const VideoModalSheet({Key? key, required this.video}) : super(key: key);

  static showVideoModalSheet(BuildContext context, BaseVideo video) {
    showModalBottomSheet<void>(
        context: context,
        showDragHandle: true,
        builder: (BuildContext context) {
          return VideoModalSheet(
            video: video,
          );
        });
  }

  void playNext(BuildContext context) {
    var player = context.read<PlayerCubit>();
    var locals = AppLocalizations.of(context)!;
    Navigator.of(context).pop();
    player.playVideoNext(video);

    final ScaffoldMessengerState? scaffold = scaffoldKey.currentState;
    scaffold?.showSnackBar(SnackBar(
      content: Text(locals.playNextAddedToQueue),
      duration: const Duration(seconds: 1),
    ));
  }

  void addToQueue(BuildContext context) {
    var player = context.read<PlayerCubit>();
    var locals = AppLocalizations.of(context)!;
    Navigator.of(context).pop();
    player.queueVideos([video]);

    final ScaffoldMessengerState? scaffold = scaffoldKey.currentState;
    scaffold?.showSnackBar(SnackBar(
      content: Text(locals.videoAddedToQueue),
      duration: const Duration(seconds: 1),
    ));
  }

  void downloadVideo(BuildContext context) {
    Navigator.of(context).pop();
    DownloadModalSheet.showVideoModalSheet(context, video);
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return FractionallySizedBox(
      widthFactor: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            AddToPlayListButton(
              videoId: video.videoId,
              type: AddToPlayListButtonType.modalSheet,
              afterAdd: () => Navigator.pop(context),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton.filledTonal(
                      onPressed: AddToQueueButton.canAddToQueue(context, [video]) ? () => addToQueue(context) : null,
                      icon: const Icon(Icons.playlist_play)),
                  Text(locals.addToQueueList)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton.filledTonal(onPressed: () => playNext(context), icon: const Icon(Icons.play_arrow)),
                  Text(locals.playNext)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton.filledTonal(onPressed: () => downloadVideo(context), icon: const Icon(Icons.download)),
                  Text(locals.download)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
