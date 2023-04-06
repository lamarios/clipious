import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoLikeController.dart';

class VideoLikeButton extends StatelessWidget {
  final String? videoId;
  double? size;
  ButtonStyle? style;
  bool? global;

  VideoLikeButton({Key? key, this.videoId, this.size, this.style, this.global}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoLikeButtonController>(
      init: VideoLikeButtonController(videoId: videoId),
      tag: VideoLikeButtonController.tags(videoId ?? ''),
      global: global ?? true,
      builder: (_) => Visibility(
        visible: _.videoId != null && _.isLoggedIn,
        child: IconButton(
          style: style,
          iconSize: size,
          onPressed: _.toggleLike,
          icon: _.isVideoLiked ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
        ),
      ),
    );
  }
}
