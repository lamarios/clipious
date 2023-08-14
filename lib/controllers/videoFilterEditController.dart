import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/searchType.dart';
import 'package:logging/logging.dart';

import '../models/channel.dart';
import '../models/db/videoFilter.dart';

part 'videoFilterEditController.g.dart';

final log = Logger('Video Filter Edit Controller');

class VideoFilterEditCubit extends Cubit<VideoFilterEditController> {
  VideoFilterEditCubit(super.initialState) {
    onReady();
  }

  void onReady() async {
    if (state.filter?.channelId != null) {
      state.channel = await service.getChannel(state.filter?.channelId ?? '');
      emit(state);
    }
  }

  emit(VideoFilterEditController state) {
    super.emit(state.copyWith());
  }

  @override
  close() async {
    state.valueController.dispose();
    super.close();
  }

  void ensureFilter() {
    state.filter ??= VideoFilter(value: "");
  }

  void setType(FilterType? value) {
    ensureFilter();
    if (value != null) {
      state.filter?.type = value;
      state.filter?.operation = null;
      state.filter?.value = '';
    }

    emit(state);
  }

  List<FilterOperation> getAvailableOperations() {
    switch (state.filter?.type) {
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
      state.filter?.operation = value;
    }

    emit(state);
  }

  void valueChanged(String value) {
    ensureFilter();
    state.filter?.value = value;
    log.fine('Filter value changed: $value');
    emit(state);
  }

  bool isFilterValid() {
    return (state.filter != null && state.filter?.channelId != null && (state.filter?.filterAll ?? false)) ||
        (state.filter != null && state.filter?.type != null && state.filter?.operation != null && (state.filter?.value ?? '').isNotEmpty);
  }

  void onSave() {
    if (state.filter != null) {
      state.filter?.channelId = state.channel?.authorId;
      log.fine('hide all ? ${state.filter?.filterAll}');
      db.saveFilter(state.filter!);
      // VideoFilterController.to()?.refreshFilters();
      navigatorKey.currentState?.pop();
    }
  }

  Future<List<Channel>> searchChannel(String query) async {
    if (query.trim() == '') return [];
    var searchResults = await service.search(query, type: SearchType.channel, page: state.searchPage);
    return searchResults.channels;
  }

  bool isNumberValue() {
    switch (state.filter?.operation) {
      case FilterOperation.higherThan:
      case FilterOperation.lowerThan:
        return true;
      default:
        return false;
    }
  }

  selectChannel(Channel? value) {
    ensureFilter();
    state.channel = value;
    state.filter?.channelId = state.channel?.authorId;
    emit(state);
  }

  void channelHideAll(bool? value) {
    ensureFilter();
    state.filter?.filterAll = value ?? false;
    emit(state);
  }

  channelClear() {
    ensureFilter();
    state.channel = null;
    state.filter?.channelId = null;
    emit(state);
  }

  void hideOnFilteredChanged(bool value) {
    ensureFilter();
    state.filter?.hideFromFeed = value;
    emit(state);
  }
}

@CopyWith()
class VideoFilterEditController extends GetxController {
  VideoFilter? filter;
  int searchPage;
  Channel? channel;
  List<Channel> channelResults;

  TextEditingController valueController;

  VideoFilterEditController({this.filter, this.searchPage = 1, this.channel, List<Channel>? channelResults, TextEditingController? valueController})
      : channelResults = channelResults ?? [],
        valueController = valueController ?? TextEditingController(text: filter?.value ?? '');
}
