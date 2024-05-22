import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/player/states/player.dart';
import 'package:invidious/player/views/components/video_player.dart';
import 'package:invidious/settings/states/settings.dart';

import '../../../../main.dart';
import '../../../../videos/models/base_video.dart';

@RoutePage()
class TvPlayerScreen extends StatelessWidget {
  final List<BaseVideo> videos;

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
