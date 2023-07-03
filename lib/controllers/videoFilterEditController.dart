import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoFilterController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/searchType.dart';
import 'package:logging/logging.dart';

import '../models/channel.dart';
import '../models/db/videoFilter.dart';

class VideoFilterEditController extends GetxController {
  final log = Logger('Video Filter Edit Controller');
  VideoFilter? filter;
  int searchPage = 1;
  Channel? channel;
  List<Channel> channelResults = [];

  late final TextEditingController valueController;

  VideoFilterEditController({this.filter}) {
    valueController = TextEditingController(text: filter?.value ?? '');
  }

  @override
  void onReady() async {
    super.onReady();
    if (filter?.channelId != null) {
      channel = await service.getChannel(filter?.channelId ?? '');
      update();
    }
  }

  @override
  void onClose() {
    valueController.dispose();
    super.onClose();
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
    log.fine('Filter value changed: $value');
    update();
  }

  bool isFilterValid() {
    return (filter != null && filter?.channelId != null && (filter?.filterAll ?? false)) || (filter != null && filter?.type != null && filter?.operation != null && (filter?.value ?? '').isNotEmpty);
  }

  void onSave() {
    if (filter != null) {
      filter?.channelId = channel?.authorId;
      log.fine('hide all ? ${filter?.filterAll}');
      db.saveFilter(filter!);
      VideoFilterController.to()?.refreshFilters();
      navigatorKey.currentState?.pop();
    }
  }

  Future<List<Channel>> searchChannel(String query) async {
    if (query.trim() == '') return [];
    var searchResults = await service.search(query, type: SearchType.channel, page: searchPage);
    return searchResults.channels;
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

  selectChannel(Channel? value) {
    ensureFilter();
    channel = value;
    filter?.channelId = channel?.authorId;
    update();
  }

  void channelHideAll(bool? value) {
    ensureFilter();
    filter?.filterAll = value ?? false;
    update();
  }

  channelClear() {
    ensureFilter();
    channel = null;
    filter?.channelId = null;
    update();
  }

  void hideOnFilteredChanged(bool value) {
    ensureFilter();
    filter?.hideFromFeed = value;
    update();
  }
}
