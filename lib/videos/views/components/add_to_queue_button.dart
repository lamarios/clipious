import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../player/states/player.dart';
import '../../models/base_video.dart';

class AddToQueueButton extends StatelessWidget {
  final List<BaseVideo> videos;

  const AddToQueueButton({Key? key, required this.videos}) : super(key: key);

 static  bool canAddToQueue(BuildContext context, List<BaseVideo> videos) {
    var state = context.read<PlayerCubit>().state;
    return (state.videos.isNotEmpty) && (videos.length > 1 || (videos.length == 1 && (state.videos.indexWhere((element) => element.videoId == videos[0].videoId) ?? -1) < 0));
  }

  addToQueue(BuildContext context) {
    var cubit = context.read<PlayerCubit>();
    cubit.queueVideos(videos);
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;
    print('hello');
    return FilledButton.tonal(
        style: const ButtonStyle(visualDensity: VisualDensity.compact),
        onPressed:  canAddToQueue(context,videos) ? () => addToQueue(context) : null,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.playlist_add,
                size: 13,
              ),
            ),
            Text(
              locals.addToQueueList,
              style: TextStyle(fontSize: textTheme.labelSmall?.fontSize),
            ),
          ],
        ));
  }
}
