import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/addToQueueButtonController.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/baseVideo.dart';
import '../../models/video.dart';

class AddToQueueButton extends StatelessWidget {
  final List<BaseVideo> videos;

  const AddToQueueButton({Key? key, required this.videos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;
    return GetBuilder<AddToQueueButtonController>(
        init: AddToQueueButtonController(videos: videos),
        global: false,
        builder: (_) => FilledButton.tonal(
            style: const ButtonStyle(visualDensity: VisualDensity.compact),
            onPressed: _.canAddToQueue() ? _.addToQueue : null,
            child: Row(
              children: [
                const Icon(
                  Icons.add,
                  size: 13,
                ),
                Text(
                  locals.addToQueueList,
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            )));
  }
}
