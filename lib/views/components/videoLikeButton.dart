import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoLikeController.dart';

class VideoLikeButton extends StatelessWidget {
  final String? videoId;

  const VideoLikeButton({Key? key, this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return GetBuilder<VideoLikeButtonController>(
      init: VideoLikeButtonController(videoId: videoId),
      global: false,
      builder: (_) => Visibility(
        visible: _.videoId != null && _.isLoggedIn,
        child: IconButton(
          onPressed: _.toggleLike,
          icon: _.isVideoLiked ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
          color: colors.secondary,
        ),
      ),
    );
  }
}
