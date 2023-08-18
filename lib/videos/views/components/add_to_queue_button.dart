import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../controllers/miniPayerController.dart';
import '../../models/base_video.dart';

class AddToQueueButton extends StatelessWidget {
  final List<BaseVideo> videos;

  const AddToQueueButton({Key? key, required this.videos}) : super(key: key);

  bool canAddToQueue(BuildContext context) {
    var state = context.read<MiniPlayerCubit>().state;
    return (state.videos.isNotEmpty) && (videos.length > 1 || (videos.length == 1 && (state.videos.indexWhere((element) => element.videoId == videos[0].videoId) ?? -1) < 0));
  }

  addToQueue(BuildContext context) {
    var cubit = context.read<MiniPlayerCubit>();
    cubit.queueVideos(videos);
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;
    return FilledButton.tonal(
        style: const ButtonStyle(visualDensity: VisualDensity.compact),
        onPressed: () => canAddToQueue(context) ? addToQueue(context) : null,
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
