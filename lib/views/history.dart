import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoListController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/history/historyVideo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/historyController.dart';
import '../models/paginatedList.dart';
import 'components/compactVideo.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
        global: false,
        init: HistoryController(itemList: PageBasedPaginatedList<String>(getItemsFunc: service.getUserHistory, maxResults: 20)),
        builder: (_) {
          return Column(
            children: [
              _.loading
                  ? const LinearProgressIndicator(
                      minHeight: 2,
                    )
                  : const SizedBox.shrink(),
              Expanded(
                child: SmartRefresher(
                  controller: _.refreshController,
                  onRefresh: _.refreshItems,
                  child: ListView.builder(
                    controller: _.scrollController,
                    itemCount: _.items.length,
                    itemBuilder: (context, index) => SwipeActionCell(
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
            ],
          );
        });
  }
}
