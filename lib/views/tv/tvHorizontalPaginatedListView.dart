import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/paginatedListViewController.dart';
import '../../models/paginatedList.dart';

class TvHorizontalPaginatedListView<T> extends StatelessWidget {
  final PaginatedList<T> paginatedList;
  final List<T>? startItems;
  final Widget Function(T item) itemBuilder;
  final Widget Function() getPlaceHolder;

  const TvHorizontalPaginatedListView({Key? key, required this.paginatedList, required this.itemBuilder, this.startItems, required this.getPlaceHolder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaginatedListViewController<T>>(
        init: PaginatedListViewController<T>(paginatedList: this.paginatedList, startItems: this.startItems),
        global: false,
        builder: (_) => Stack(
              children: [
                _.loading
                    ? const LinearProgressIndicator(
                        minHeight: 3,
                      )
                    : const SizedBox.shrink(),
                ListView.builder(
                  controller: _.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _.items.length + (_.loading ? 10 : 0),
                  itemBuilder: (BuildContext context, int index) => index >= _.items.length ? getPlaceHolder() : itemBuilder(_.items[index]),
                ),
              ],
            ));
  }
}
