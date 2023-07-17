import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/models/paginatedList.dart';

class PaginatedListViewController<T> extends GetxController {
  ScrollController scrollController = ScrollController();
  PaginatedList<T> paginatedList;
  List<T> items = [];
  bool loading = false;

  PaginatedListViewController({required this.paginatedList, List<T>? startItems}) {
    if (startItems != null) {
      items.addAll(startItems);
    }
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(getMore);
  }

  getMore() {
    if (paginatedList.getHasMore()) {
      print('${scrollController.hasClients}, ${scrollController.position.maxScrollExtent}, ${scrollController.offset}');
      if (scrollController.hasClients) {
        if (scrollController.position.maxScrollExtent * 0.9 < scrollController.offset) {
          print('LOAD MOAAAR');
          EasyDebounce.debounce('get-more-playlists', const Duration(milliseconds: 250), () async {
            loading = true;
            update();

            List<T> i = await paginatedList.getMoreItems();
            items.addAll(i);
            loading = false;
            update();
          });
        }
      }
    }
  }
}
