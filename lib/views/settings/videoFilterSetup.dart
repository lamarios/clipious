import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoFilterEditController.dart';

import '../../models/db/videoFilter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VideoFilterSetup extends StatelessWidget {
  final String? channelId;
  final VideoFilter? filter;

  const VideoFilterSetup({Key? key, this.channelId, this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return GetBuilder<VideoFilterEditController>(
        init: VideoFilterEditController(channelId: channelId, filter: filter),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(filter == null ? locals.addVideoFilter : locals.editVideoFilter),
              ),
              body: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Text(locals.videoFilterType),
                    DropdownButton<FilterType>(value: _.filter?.type, items: FilterType.values.map((e) => DropdownMenuItem<FilterType>(value: e, child: Text(e.name))).toList(), onChanged: _.setType),
                    Visibility(visible: _.filter?.type != null, child: Text(locals.videoFilterOperation)),
                    Visibility(
                        visible: _.filter?.type != null,
                        child: DropdownButton<FilterOperation>(
                            value: _.filter?.operation, items: _.getAvailableOperations().map((e) => DropdownMenuItem<FilterOperation>(value: e, child: Text(e.name))).toList(), onChanged: _.setOperation)),
                    Visibility(visible: _.filter?.operation != null, child: Text(locals.videoFilterValue),),
                    TextField(controller: _.valueController,)
                  ],
                ),
              ),
            ));
  }
}
