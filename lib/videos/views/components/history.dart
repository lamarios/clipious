import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/utils/states/item_list.dart';
import 'package:invidious/utils/views/components/top_loading.dart';
import 'package:invidious/videos/views/components/historyVideo.dart';

import '../../../utils.dart';
import '../../../utils/models/paginatedList.dart';
import '../../../utils/views/components/placeholders.dart';
import '../../states/history.dart';

const smallHistoryAspectRatio = 1.15;

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => ItemListCubit<String>(ItemListState<String>(
                itemList: PageBasedPaginatedList<String>(getItemsFunc: service.getUserHistory, maxResults: 20)))),
        BlocProvider(
          create: (context) => HistoryCubit(null, context.read<ItemListCubit<String>>()),
        )
      ],
      child: BlocBuilder<ItemListCubit<String>, ItemListState<String>>(builder: (context, _) {
        var listCubit = context.read<ItemListCubit<String>>();
        var historyCubit = context.read<HistoryCubit>();
        bool showPlaceholder = _.loading && _.items.isEmpty;
        return Stack(
          children: [
            _.error != ItemListErrors.none
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(switch (_.error) {
                      ItemListErrors.invalidScope => locals.itemListErrorInvalidScope,
                      _ => locals.itemlistErrorGeneric
                    }),
                  ))
                : !_.loading && _.items.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(locals.noHistory),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: RefreshIndicator(
                          onRefresh: () => listCubit.refreshItems(),
                          child: ListView.builder(
                            controller: listCubit.scrollController,
                            scrollDirection: Axis.vertical,
                            itemCount: _.items.length + (_.loading ? 5 : 0),
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(bottom: index == _.items.length - 1 ? 70.0 : 0),
                              child: index >= _.items.length
                                  ? const CompactVideoPlaceHolder()
                                  : SwipeActionCell(
                                      key: ValueKey(_.items[index]),
                                      trailingActions: [
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
                                      )),
                            ),
                          ),
                        ),
                      ),
            if (_.loading) const TopListLoading(),
            Positioned(
                bottom: 15,
                right: 15,
                child: FloatingActionButton(
                  onPressed: () {
                    okCancelDialog(context, locals.clearHistoryQuestion, locals.clearHistoryQuestionExplanation,
                        () => historyCubit.clearHistory());
                  },
                  child: const Icon(Icons.delete),
                ))
          ],
        );
      }),
    );
  }
}
