import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
    }

    update();
  }

  List<FilterOperation> getAvailableOperations() {
    switch (filter?.type) {
      case FilterType.title:
      case FilterType.channelName:
        return [FilterOperation.equal, FilterOperation.notEqual];
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
}
