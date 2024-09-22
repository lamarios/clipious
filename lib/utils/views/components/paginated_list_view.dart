import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/utils/views/components/top_loading.dart';

import '../../models/paginated_list.dart';
import '../../states/paginated_list_view.dart';

class PaginatedListView<T> extends StatelessWidget {
  final PaginatedList<T> paginatedList;
  final List<T>? startItems;
  final Widget Function(T item) itemBuilder;

  const PaginatedListView(
      {super.key,
      required this.paginatedList,
      required this.itemBuilder,
      this.startItems});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaginatedListCubit<T>(
          PaginatedListViewController.init<T>(
              paginatedList: this.paginatedList, startItems: this.startItems)),
      child: BlocBuilder<PaginatedListCubit<T>, PaginatedListViewController<T>>(
          builder: (context, state) {
        var cubit = context.read<PaginatedListCubit<T>>();
        return Stack(
          children: [
            if (state.loading) const TopListLoading(),
            ListView.builder(
              controller: cubit.scrollController,
              itemCount: state.items.length,
              itemBuilder: (BuildContext context, int index) {
                T item = state.items[index];
                return itemBuilder(item);
              },
            ),
          ],
        );
      }),
    );
  }
}
