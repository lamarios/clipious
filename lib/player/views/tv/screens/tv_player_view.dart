import 'package:auto_route/annotations.dart';
import 'package:clipious/videos/models/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/player/states/player.dart';
import 'package:clipious/player/views/components/video_player.dart';
import 'package:clipious/settings/states/settings.dart';

import '../../../../main.dart';

@RoutePage()
class TvPlayerScreen extends StatelessWidget {
  final List<Video> videos;

  const TvPlayerScreen({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    var settings = context.read<SettingsCubit>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlayerCubit(PlayerState.init(videos), settings),
        )
      ],
      child: Theme(
        data: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        child: Scaffold(
          body: BlocBuilder<PlayerCubit, PlayerState>(
            builder: (context, state) => Stack(
              children: [
                if (state.hasVideo)
                  VideoPlayer(
                    video: state.currentlyPlaying,
                    miniPlayer: false,
                    playNow: true,
                    disableControls: true,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
