import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoFilterController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';

import '../models/channel.dart';
import '../models/db/videoFilter.dart';

class VideoFilterEditController extends GetxController {
  final String? channelId;
  VideoFilter? filter;
  Channel? channel;

  late final TextEditingController valueController;

  VideoFilterEditController({this.channelId, this.filter}) {
    valueController = TextEditingController(text: filter?.value ?? '');
  }

  @override
  void onInit() {
    super.onInit();
  }

  void ensureFilter() {
    filter ??= VideoFilter(value: "");
  }

  void setType(FilterType? value) {
    ensureFilter();
    if (value != null) {
      filter?.type = value;
      filter?.operation = null;
      filter?.value = '';
    }

    update();
  }

  List<FilterOperation> getAvailableOperations() {
    switch (filter?.type) {
      case FilterType.title:
      case FilterType.channelName:
        return [FilterOperation.contain, FilterOperation.notContain];
      case FilterType.length:
        return [FilterOperation.lowerThan, FilterOperation.higherThan];
      default:
        return [];
    }
  }

  void setOperation(FilterOperation? value) {
    ensureFilter();
    if (value != null) {
      filter?.operation = value;
    }

    update();
  }

  void valueChanged(String value) {
    ensureFilter();
    filter?.value = value;
    print(value);
    update();
  }

  bool isFilterValid() {
    return filter != null && filter?.type != null && filter?.operation != null && (filter?.value ?? '').isNotEmpty;
  }

  void onSave() {
    if (filter != null) {
      db.saveFilter(filter!);
      VideoFilterController.to()?.refreshFilters();
      navigatorKey.currentState?.pop();
    }
  }

  bool isNumberValue() {
    switch (filter?.operation) {
      case FilterOperation.higherThan:
      case FilterOperation.lowerThan:
        return true;
      default:
        return false;
    }
  }
}
