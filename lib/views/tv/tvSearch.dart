import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/views/tv/tvButton.dart';
import 'package:invidious/views/tv/tvChannelView.dart';
import 'package:invidious/views/tv/tvHorizontalVideoList.dart';

import '../../controllers/tvSearchController.dart';
import '../../models/channel.dart';
import '../../models/imageObject.dart';
import '../components/videoThumbnail.dart';

class TvSearch extends StatelessWidget {
  const TvSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: DefaultTextStyle(
        style: textTheme.bodyLarge!,
        child: GetBuilder<TvSearchController>(
          global: false,
          init: TvSearchController(),
          builder: (_) => Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locals.search,
                  style: textTheme.titleLarge,
                ),
                TextField(
                  controller: _.queryController,
                  autofocus: true,
                  autocorrect: true,
                  focusNode: _.searchFocus,
                  onSubmitted: _.search,
                  textInputAction: TextInputAction.search,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: FocusScope(
                      onKeyEvent: _.handleResultScopeKeyEvent,
                      canRequestFocus: true,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: ListView(
                              shrinkWrap: true,
                              children: _.suggestions
                                  .map((e) => TvButton(
                                        onPressed: (context) => _.pressedSuggestion(e),
                                        focusedColor: colors.secondaryContainer,
                                        unfocusedColor: Colors.transparent,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                                          child: Text(e),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _.loading
                                  ? [
                                      const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    ]
                                  : [
                                      Visibility(
                                          visible: _.results?.videos.isNotEmpty ?? false,
                                          child: Text(
                                            locals.videos,
                                            style: textTheme.titleLarge,
                                          )),
                                      Visibility(
                                        visible: _.results?.videos.isNotEmpty ?? false,
                                        child: Focus(focusNode: _.resultFocus, child: TvHorizontalVideoList(paginatedVideoList: FixedItemList(_.results?.videos ?? []))),
                                      ),
                                      Visibility(
                                          visible: _.results?.channels.isNotEmpty ?? false,
                                          child: Text(
                                            locals.channels,
                                            style: textTheme.titleLarge,
                                          )),
                                      Visibility(
                                        visible: _.results?.channels.isNotEmpty ?? false,
                                        child: SizedBox(
                                          height: 60,
                                          child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: _.results?.channels
                                                    .map((e) => Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: TvButton(
                                                            onPressed: (context) => openChannel(context, e),
                                                            unfocusedColor: colors.secondaryContainer,
                                                            borderRadius: 20,
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: [
                                                                  Text(e.author),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ))
                                                    .toList() ??
                                                [],
                                          ),
                                        ),
                                      )
                                    ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  openChannel(BuildContext context, Channel c) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TvChannelView(channelId: c.authorId),
    ));
  }
}
