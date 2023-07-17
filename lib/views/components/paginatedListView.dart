import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/paginatedListViewController.dart';
import '../../models/paginatedList.dart';

class PaginatedListView<T> extends StatelessWidget {
  final PaginatedList<T> paginatedList;
  final List<T>? startItems;
  final Widget Function(T item) itemBuilder;

  const PaginatedListView({Key? key, required this.paginatedList, required this.itemBuilder, this.startItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaginatedListViewController<T>>(
        init: PaginatedListViewController<T>(paginatedList: this.paginatedList, startItems: this.startItems),
        global: false,
        builder: (_) => ListView.builder(
              controller: _.scrollController,
              itemCount: _.items.length,
              itemBuilder: (BuildContext context, int index) {
                T item = _.items[index];
                return itemBuilder(item);
              },
            ));
  }
}
