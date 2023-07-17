import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/VideoFilterChannelController.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/views/settings/videoFilterChannel.dart';
import 'package:invidious/views/settings/videoFilterSetup.dart';
import 'package:uuid/uuid.dart';

import '../../controllers/videoFilterController.dart';
import '../../main.dart';
import '../../models/db/videoFilter.dart';
import '../../myRouteObserver.dart';

class VideoFilterSettings extends StatelessWidget {
  const VideoFilterSettings({Key? key}) : super(key: key);

  createFilter(BuildContext context, {String? channelId}) {
    navigatorKey.currentState?.push(MaterialPageRoute(
        settings: ROUTE_SETTINGS_VIDEO_FILTERS,
        builder: (context) => VideoFilterSetup(
              channelId: channelId,
            )));
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    return GetBuilder<VideoFilterController>(
        init: VideoFilterController(),
        builder: (_) {
          Map<String, List<VideoFilter>> mappedFilters = _.filters.groupBy(
            (p0) => p0.channelId ?? allChannels,
          );
          List<String> keys = mappedFilters.keys.toList();
          keys.sort(_.sortChannels);
          return Scaffold(
              appBar: AppBar(
                title: Text(locals.videoFilters),
              ),
              floatingActionButton: FloatingActionButton(
                  onPressed: () => createFilter(context),
                  backgroundColor: colors.primaryContainer,
                  child: const Icon(Icons.add)),
              body: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(locals.videoFiltersExplanation),
                    ),
                    keys.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: keys.length,
                              itemBuilder: (context, index) {
                                return VideoFilterChannel(
                                    key: ValueKey(const Uuid().v4()),
                                    filters: mappedFilters[keys[index]] ?? []);
                              },
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(locals.videoFilterNoFilters),
                          ),
                  ],
                ),
              ));
        });
  }
}
