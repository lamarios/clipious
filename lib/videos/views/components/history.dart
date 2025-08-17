import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/l10n/generated/app_localizations.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/utils/states/item_list.dart';
import 'package:clipious/utils/views/components/top_loading.dart';
import 'package:clipious/videos/views/components/history_video.dart';

import '../../../utils.dart';
import '../../../utils/models/paginated_list.dart';
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
            create: (BuildContext context) => ItemListCubit<String>(
                ItemListState<String>(
                    itemList: PageBasedPaginatedList<String>(
                        getItemsFunc: service.getUserHistory,
                        maxResults: 20)))),
        BlocProvider(
          create: (context) =>
              HistoryCubit(null, context.read<ItemListCubit<String>>()),
        )
      ],
      child: BlocBuilder<ItemListCubit<String>, ItemListState<String>>(
          builder: (context, state) {
        var listCubit = context.read<ItemListCubit<String>>();
        var historyCubit = context.read<HistoryCubit>();
        return Stack(
          children: [
            state.error != ItemListErrors.none
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(switch (state.error) {
                      ItemListErrors.invalidScope =>
                        locals.itemListErrorInvalidScope,
                      _ => locals.itemlistErrorGeneric
                    }),
                  ))
                : !state.loading && state.items.isEmpty
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
                            itemCount:
                                state.items.length + (state.loading ? 5 : 0),
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(
                                  bottom: index == state.items.length - 1
                                      ? 70.0
                                      : 0),
                              child: index >= state.items.length
                                  ? const CompactVideoPlaceHolder()
                                  : SwipeActionCell(
                                      key: ValueKey(state.items[index]),
                                      trailingActions: [
                                        SwipeAction(
                                          performsFirstActionWithFullSwipe:
                                              true,
                                          icon: const Icon(Icons.delete,
                                              color: Colors.white),
                                          onTap: (handler) async {
                                            await handler(true);
                                            historyCubit.removeFromHistory(
                                                state.items[index]);
                                          },
                                        )
                                      ],
                                      child: HistoryVideoView(
                                        key: ValueKey(state.items[index]),
                                        videoId: state.items[index],
                                      )),
                            ),
                          ),
                        ),
                      ),
            if (state.loading) const TopListLoading(),
            Positioned(
                bottom: 15,
                right: 15,
                child: FloatingActionButton(
                  onPressed: () {
                    okCancelDialog(
                        context,
                        locals.clearHistoryQuestion,
                        locals.clearHistoryQuestionExplanation,
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
