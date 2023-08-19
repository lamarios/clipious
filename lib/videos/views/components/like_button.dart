import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/videos/states/video_like.dart';

class VideoLikeButton extends StatelessWidget {
  final String? videoId;
  final double? size;
  final ButtonStyle? style;
  final bool? global;

  const VideoLikeButton({Key? key, this.videoId, this.size, this.style, this.global}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoLikeButtonCubit, VideoLikeButtonController>(
      builder: (context, _) => Visibility(
        visible: _.videoId != null && _.isLoggedIn,
        child: IconButton(
          style: style,
          iconSize: size,
          onPressed: context.read<VideoLikeButtonCubit>().toggleLike,
          icon: _.isVideoLiked ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
        ),
      ),
    );
  }
}
