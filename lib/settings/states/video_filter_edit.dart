import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/search/models/search_type.dart';
import 'package:logging/logging.dart';

import '../../channels/models/channel.dart';
import '../models/db/video_filter.dart';

part 'video_filter_edit.g.dart';

final log = Logger('Video Filter Edit Controller');

class VideoFilterEditCubit extends Cubit<VideoFilterEditState> {
  VideoFilterEditCubit(super.initialState) {
    onReady();
  }

  void onReady() async {
    if (state.filter?.channelId != null) {
      var state = this.state.copyWith();
      state.channel = await service.getChannel(state.filter?.channelId ?? '');
      emit(state);
    }
    ensureFilter();
  }

  @override
  close() async {
    state.valueController.dispose();
    super.close();
  }

  void ensureFilter() {
    state.filter ??= VideoFilter(value: "");
    if ((state.filter?.daysOfWeek ?? wholeWeek).isEmpty) {
      state.filter?.daysOfWeek = wholeWeek;
    }

    if ((state.filter?.startTime ?? '').isEmpty) {
      state.filter?.startTime = defaultStartTime;
    }
    if ((state.filter?.endTime ?? '').isEmpty) {
      state.filter?.endTime = defaultEndTime;
    }
  }

  void setType(FilterType? value) {
    var state = this.state.copyWith();
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
    var state = this.state.copyWith();
    if (value != null) {
      state.filter?.operation = value;
    }

    emit(state);
  }

  void valueChanged(String value) {
    var state = this.state.copyWith();
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
    var state = this.state.copyWith();
    state.channel = value;
    state.filter?.channelId = state.channel?.authorId;
    emit(state);
  }

  void channelHideAll(bool? value) {
    var state = this.state.copyWith();
    state.filter?.filterAll = value ?? false;
    emit(state);
  }

  channelClear() {
    var state = this.state.copyWith();
    state.channel = null;
    state.filter?.channelId = null;
    emit(state);
  }

  set showDateSettings(bool show) {
    var state = this.state.copyWith();
    state.showDateSettings = show;
    if (!show) {
      state.filter?.daysOfWeek = wholeWeek;
      state.filter?.startTime = defaultStartTime;
      state.filter?.endTime = defaultEndTime;
    }
    emit(state);
  }

  void hideOnFilteredChanged(bool value) {
    var state = this.state.copyWith();
    state.filter?.hideFromFeed = value;
    emit(state);
  }

  toggleDay(int e) {
    var days = List.of(state.filter?.daysOfWeek ?? wholeWeek);
    if (days.contains(e)) {
      if (days.length >= 2) days.remove(e);
    } else {
      days.add(e);
    }
    var filter = state.filter;
    filter?.daysOfWeek = days;
    emit(state.copyWith(filter: filter));
  }

  bool get showDateSettings =>
      state.showDateSettings ||
      (state.filter?.daysOfWeek.length ?? wholeWeek.length) != wholeWeek.length ||
      (state.filter?.startTime ?? defaultStartTime) != defaultStartTime ||
      (state.filter?.endTime ?? defaultEndTime) != defaultEndTime;

  setStartTime(String newTime) {
    var state = this.state.copyWith();
    var comparison = newTime.compareTo(state.filter?.endTime ?? defaultEndTime);
    if (comparison < 0) {
      state.filter?.startTime = newTime;
      emit(state);
    }
  }

  setEndTime(String newTime) {
    var state = this.state.copyWith();
    var comparison = newTime.compareTo(state.filter?.startTime ?? defaultStartTime);
    if (comparison > 0) {
      state.filter?.endTime = newTime;
      emit(state);
    }
  }
}

@CopyWith(constructor: "_")
class VideoFilterEditState {
  VideoFilter? filter;
  int searchPage;
  Channel? channel;
  List<Channel> channelResults;
  bool showDateSettings = false;

  TextEditingController valueController;

  VideoFilterEditState({this.filter, this.searchPage = 1, this.channel, List<Channel>? channelResults, TextEditingController? valueController})
      : channelResults = channelResults ?? [],
        valueController = valueController ?? TextEditingController(text: filter?.value ?? '');

  VideoFilterEditState._(this.filter, this.searchPage, this.channel, this.channelResults, this.valueController, this.showDateSettings);
}
