import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils.dart';
import '../../../../videos/models/base_video.dart';
import '../../../models/paginated_list.dart';
import '../../../states/paginated_list_view.dart';

class TvHorizontalPaginatedListView<T> extends StatelessWidget {
  final PaginatedList<T> paginatedList;
  final List<T>? startItems;
  final Widget Function(T item) itemBuilder;
  final Widget Function() getPlaceHolder;

  const TvHorizontalPaginatedListView(
      {super.key,
      required this.paginatedList,
      required this.itemBuilder,
      this.startItems,
      required this.getPlaceHolder});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaginatedListCubit(
          PaginatedListViewController.init<T>(
              paginatedList: this.paginatedList, startItems: this.startItems)),
      child: BlocBuilder<PaginatedListCubit<T>, PaginatedListViewController<T>>(
          builder: (context, _) {
        var cubit = context.read<PaginatedListCubit<T>>();
        // filter items if possible
        List<T> items = _.items;
        if (items.isNotEmpty && items[0] is BaseVideo) {
          items = filteredVideos<BaseVideo>(_.items.cast()).cast();
        }
        return Stack(
          children: [
            _.loading
                ? const LinearProgressIndicator(
                    minHeight: 3,
                  )
                : const SizedBox.shrink(),
            ListView.builder(
              controller: cubit.scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: items.length + (_.loading ? 10 : 0),
              itemBuilder: (BuildContext context, int index) =>
                  index >= items.length
                      ? getPlaceHolder()
                      : itemBuilder(items[index]),
            ),
          ],
        );
      }),
    );
  }
}
