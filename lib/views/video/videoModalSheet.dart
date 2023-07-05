import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/models/baseVideo.dart';

import '../../main.dart';
import 'addToPlayList.dart';

class VideoModalSheet extends StatelessWidget {
  final BaseVideo video;

  const VideoModalSheet({Key? key, required this.video}) : super(key: key);

  static showVideoModalSheet(BuildContext context, BaseVideo video) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return VideoModalSheet(video: video);
        });
  }

  void addToPlaylist(BuildContext context) {
    Navigator.of(context).pop();
    AddToPlaylist.showAddToPlaylistDialog(context, video.videoId);
  }

  void playNext(BuildContext context){
    var locals = AppLocalizations.of(context)!;
    Navigator.of(context).pop();
    MiniPlayerController.to()?.playVideoNext(video);

    final ScaffoldMessengerState? scaffold = scaffoldKey.currentState;
    scaffold?.showSnackBar(SnackBar(
      content: Text(locals.playNextAddedToQueue),
      duration: const Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [IconButton.filledTonal(onPressed: () => addToPlaylist(context), icon: const Icon(Icons.playlist_add)), Text(locals.addToPlaylist)],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [IconButton.filledTonal(onPressed: () => playNext(context), icon: const Icon(Icons.play_arrow)), Text(locals.playNext)],
          )
        ],
      ),
    );
  }
}
