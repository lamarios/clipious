import 'package:clipious/player/states/media_kit_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit_video/media_kit_video.dart';

import '../../../downloads/models/downloaded_video.dart';
import '../../../settings/states/settings.dart';
import '../../../videos/models/video.dart' as clipious;
import '../../states/player.dart';

class MediaKitPlayer extends StatelessWidget {
  final clipious.Video? video;
  final DownloadedVideo? offlineVideo;
  final bool miniPlayer;
  final bool? playNow;
  final bool? disableControls;
  final Duration? startAt;

  const MediaKitPlayer(
      {super.key,
      this.video,
      this.offlineVideo,
      required this.miniPlayer,
      this.playNow,
      this.disableControls,
      this.startAt});

  @override
  Widget build(BuildContext context) {
    var player = context.read<PlayerCubit>();
    var settings = context.read<SettingsCubit>();

    return BlocProvider(
      create: (context) => MediaKitPlayerCubit(
          MediaKitPlayerState(
              startAt: startAt,
              video: video,
              offlineVideo: offlineVideo,
              disableControls: disableControls),
          player,
          settings),
      child: BlocBuilder<MediaKitPlayerCubit, MediaKitPlayerState>(
        builder: (context, state) {
          final cubit = context.read<MediaKitPlayerCubit>();

          return cubit.mkController == null
              ? const SizedBox.shrink()
              : Video(controller: cubit.mkController!);
        },
      ),
    );
  }
}
