import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/utils/states/item_list.dart';
import 'package:invidious/videos/views/components/historyVideo.dart';

import '../../../utils.dart';
import '../../../utils/models/paginatedList.dart';
import '../../../utils/views/components/placeholders.dart';
import '../../states/history.dart';

const smallHistoryAspectRatio = 1.15;

class HistoryView extends StatelessWidget {
  final bool small;

  const HistoryView({super.key, this.small = false});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ItemListCubit<String>(ItemListState<String>(itemList: PageBasedPaginatedList<String>(getItemsFunc: service.getUserHistory, maxResults: 20)))),
        BlocProvider(
          create: (context) => HistoryCubit(null, context.read<ItemListCubit<String>>()),
        )
      ],
      child: BlocBuilder<ItemListCubit<String>, ItemListState<String>>(builder: (context, _) {
        var listcubit = context.read<ItemListCubit<String>>();
        var historyCubit = context.read<HistoryCubit>();
        bool showPlaceholder = _.loading && _.items.isEmpty;
        return Stack(
          children: [
            _.error != ItemListErrors.none
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(switch (_.error) { ItemListErrors.invalidScope => locals.itemListErrorInvalidScope, _ => locals.itemlistErrorGeneric }),
                  ))
                : !_.loading && _.items.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(locals.noHistory),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.all(small ? 12.0 : 0),
                        child: RefreshIndicator(
                          onRefresh: () => small ? null : listcubit.refreshItems(),
                          child: ListView.builder(
                            controller: _.scrollController,
                            scrollDirection: small ? Axis.horizontal : Axis.vertical,
                            itemCount: _.items.length + (_.loading ? 5 : 0),
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(bottom: !small && index == _.items.length - 1 ? 70.0 : 0),
                              child: index >= _.items.length
                                  ? small
                                      ? const AspectRatio(aspectRatio: smallHistoryAspectRatio, child: VideoListItemPlaceHolder(small: true))
                                      : const CompactVideoPlaceHolder()
                                  : small
                                      ? HistoryVideoView(
                                          key: ValueKey(_.items[index]),
                                          videoId: _.items[index],
                                          small: small,
                                        )
                                      : SwipeActionCell(
                                          key: ValueKey(_.items[index]),
                                          trailingActions: small
                                              ? []
                                              : [
                                                  SwipeAction(
                                                    performsFirstActionWithFullSwipe: true,
                                                    icon: const Icon(Icons.delete, color: Colors.white),
                                                    onTap: (handler) async {
                                                      await handler(true);
                                                      historyCubit.removeFromHistory(_.items[index]);
                                                    },
                                                  )
                                                ],
                                          child: HistoryVideoView(
                                            key: ValueKey(_.items[index]),
                                            videoId: _.items[index],
                                            small: small,
                                          )),
                            ),
                          ),
                        ),
                      ),
            _.loading
                ? const LinearProgressIndicator(
                    minHeight: 1,
                  )
                : const SizedBox.shrink(),
            if (!small)
              Positioned(
                  bottom: 15,
                  right: 15,
                  child: FloatingActionButton(
                    onPressed: () {
                      okCancelDialog(context, locals.clearHistoryQuestion, locals.clearHistoryQuestionExplanation, () => historyCubit.clearHistory());
                    },
                    child: const Icon(Icons.delete),
                  ))
          ],
        );
      }),
    );
  }
}
