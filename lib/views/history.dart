import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoListController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/history/historyVideo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/historyController.dart';
import '../models/paginatedList.dart';
import '../utils.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return GetBuilder<HistoryController>(
        init: HistoryController(itemList: PageBasedPaginatedList<String>(getItemsFunc: service.getUserHistory, maxResults: 20)),
        builder: (_) {
          return Stack(
            children: [
              _.error != ItemListErrors.none
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(switch (_.error) { ItemListErrors.invalidScope => locals.itemListErrorInvalidScope, _ => locals.itemlistErrorGeneric }),
                    ))
                  : _.items.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(locals.noHistory),
                          ),
                        )
                      : SmartRefresher(
                          controller: _.refreshController,
                          onRefresh: _.refreshItems,
                          child: ListView.builder(
                            controller: _.scrollController,
                            itemCount: _.items.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(bottom: index == _.items.length - 1 ? 70.0 : 0),
                              child: SwipeActionCell(
                                  key: ValueKey(_.items[index]),
                                  trailingActions: [
                                    SwipeAction(
                                      performsFirstActionWithFullSwipe: true,
                                      icon: const Icon(Icons.delete, color: Colors.white),
                                      onTap: (handler) async {
                                        await handler(true);
                                        _.removeFromHistory(_.items[index]);
                                      },
                                    )
                                  ],
                                  child: HistoryVideoView(videoId: _.items[index])),
                            ),
                          ),
                        ),
              _.loading
                  ? const LinearProgressIndicator(
                      minHeight: 1,
                    )
                  : const SizedBox.shrink(),
            ],
          );
        });
  }
}

class ClearHistoryButton extends StatelessWidget {
  const ClearHistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    return FloatingActionButton(
      onPressed: () {
        okCancelDialog(context, locals.clearHistoryQuestion, locals.clearHistoryQuestionExplanation, () => HistoryController.to()?.clearHistory());
      },
      child: const Icon(Icons.delete),
    );
  }
}
