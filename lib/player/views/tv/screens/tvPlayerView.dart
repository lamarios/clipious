import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/player/states/player.dart';
import 'package:invidious/player/views/components/video_player.dart';
import 'package:invidious/settings/states/settings.dart';

import '../../../../main.dart';
import '../../../../videos/models/base_video.dart';

@RoutePage()
class TvPlayerScreen extends StatelessWidget {
  final List<BaseVideo> videos;

  const TvPlayerScreen({Key? key, required this.videos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    var settings = context.read<SettingsCubit>();
    var locals = AppLocalizations.of(context)!;
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
            builder: (context, _) => Stack(
              children: [
                if (_.hasVideo)
                  VideoPlayer(
                    video: _.currentlyPlaying,
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
