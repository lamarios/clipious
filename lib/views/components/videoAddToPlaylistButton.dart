import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/addToPlaylistButtonController.dart';

import '../video/addToPlayList.dart';

class VideoAddToPlaylistButton extends StatelessWidget {
  String? videoId;

  VideoAddToPlaylistButton({Key? key, this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddToPlaylistButtonController>(
      tag: AddToPlaylistButtonController.tags(videoId ?? ''),
      init: AddToPlaylistButtonController(videoId: videoId),
      builder: (_) => Visibility(
        visible: _.isLoggedIn,
        child: Stack(
          children: [
            IconButton(
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero)),
              onPressed: () =>
                  AddToPlaylist.showAddToPlaylistDialog(context, _.videoId!),
              icon: Icon(
                Icons.add,
              ),
            ),
            _.playListCount > 0
                ? Positioned(
                    top: 10,
                    right: 10,
                    child: Text(
                      _.playListCount.toString(),
                      style: const TextStyle(fontSize: 8),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
