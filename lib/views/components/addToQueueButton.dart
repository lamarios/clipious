import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/addToQueueButtonController.dart';

import '../../models/baseVideo.dart';

class AddToQueueButton extends StatelessWidget {
  final List<BaseVideo> videos;

  const AddToQueueButton({Key? key, required this.videos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;
    return GetBuilder<AddToQueueButtonController>(
        init: AddToQueueButtonController(videos: videos),
        global: false,
        builder: (_) => FilledButton.tonal(
            style: const ButtonStyle(visualDensity: VisualDensity.compact),
            onPressed: _.canAddToQueue() ? _.addToQueue : null,
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
            )));
  }
}
