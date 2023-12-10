import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/search/models/search_type.dart';
import 'package:logging/logging.dart';

import '../../channels/models/channel.dart';
import '../models/db/video_filter.dart';

part 'video_filter_edit.freezed.dart';

final log = Logger('Video Filter Edit Controller');

class VideoFilterEditCubit extends Cubit<VideoFilterEditState> {
  late final TextEditingController valueController;

  VideoFilterEditCubit(super.initialState) {
    valueController = TextEditingController(text: state.filter?.value ?? '');
    onReady();
  }

  void onReady() async {
    if (state.filter?.channelId != null) {
      var channel = await service.getChannel(state.filter?.channelId ?? '');
      emit(state.copyWith(channel: channel));
    }
    ensureFilter();
  }

  @override
  close() async {
    valueController.dispose();
    super.close();
  }

  void ensureFilter() {
    var filter = state.filter?.copyWith();
    filter ??= VideoFilter(value: "");
    if ((filter.daysOfWeek ?? wholeWeek).isEmpty) {
      filter.daysOfWeek = wholeWeek;
    }

    if ((filter.startTime ?? '').isEmpty) {
      filter.startTime = defaultStartTime;
    }
    if ((filter.endTime ?? '').isEmpty) {
      filter.endTime = defaultEndTime;
    }
    emit(state.copyWith(filter: filter));
  }

  void setType(FilterType? value) {
    var filter = state.filter?.copyWith();
    if (value != null) {
      filter?.type = value;
      filter?.operation = null;
      filter?.value = '';
    }

    emit(state.copyWith(filter: filter));
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
    var filter = state.filter?.copyWith();
    if (value != null) {
      filter?.operation = value;
    }

    emit(state.copyWith(filter: filter));
  }

  void valueChanged(String value) {
    var filter = state.filter?.copyWith();
    filter?.value = value;
    log.fine('Filter value changed: $value');
    emit(state.copyWith(filter: filter));
  }

  bool isFilterValid() {
    return (state.filter != null && state.filter?.channelId != null && (state.filter?.filterAll ?? false)) ||
        (state.filter != null &&
            state.filter?.type != null &&
            state.filter?.operation != null &&
            (state.filter?.value ?? '').isNotEmpty);
  }

  void onSave() {
    if (state.filter != null) {
      state.filter?.channelId = state.channel?.authorId;
      log.fine('hide all ? ${state.filter?.filterAll}');
      db.saveFilter(state.filter!);
      // VideoFilterController.to()?.refreshFilters();
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
    var filter = state.filter?.copyWith();
    filter?.channelId = state.channel?.authorId;
    emit(state.copyWith(channel: value, filter:  filter));
  }

  void channelHideAll(bool? value) {
    var filter = state.filter?.copyWith();
    filter?.filterAll = value ?? false;
    emit(state.copyWith(filter: filter));
  }

  channelClear() {
    var filter = state.filter?.copyWith();
    filter?.channelId = null;
    emit(state.copyWith(channel: null, filter: filter));
  }

  set showDateSettings(bool show) {
    var filter = state.filter?.copyWith();
    if (!show) {
      filter?.daysOfWeek = wholeWeek;
      filter?.startTime = defaultStartTime;
      filter?.endTime = defaultEndTime;
    }
    emit(state.copyWith(showDateSettings: show, filter: filter));
  }

  void hideOnFilteredChanged(bool value) {
    var filter = state.filter?.copyWith();
    filter?.hideFromFeed = value;
    emit(state.copyWith(filter: filter));
  }

  toggleDay(int e) {
    var days = List.of(state.filter?.daysOfWeek ?? wholeWeek);
    if (days.contains(e)) {
      if (days.length >= 2) days.remove(e);
    } else {
      days.add(e);
    }
    var filter = state.filter?.copyWith();
    filter?.daysOfWeek = days;
    emit(state.copyWith(filter: filter));
  }

  bool get showDateSettings =>
      state.showDateSettings ||
      (state.filter?.daysOfWeek.length ?? wholeWeek.length) != wholeWeek.length ||
      (state.filter?.startTime ?? defaultStartTime) != defaultStartTime ||
      (state.filter?.endTime ?? defaultEndTime) != defaultEndTime;

  setStartTime(String newTime) {
    var comparison = newTime.compareTo(state.filter?.endTime ?? defaultEndTime);
    if (comparison < 0) {
      var filter = state.filter?.copyWith();
      filter?.startTime = newTime;
      emit(state.copyWith(filter: filter));
    }
  }

  setEndTime(String newTime) {
    var comparison = newTime.compareTo(state.filter?.startTime ?? defaultStartTime);
    if (comparison > 0) {
      var filter = state.filter?.copyWith();
      filter?.endTime = newTime;
      emit(state.copyWith(filter: filter));
    }
  }
}

@freezed
class VideoFilterEditState with _$VideoFilterEditState {
  const factory VideoFilterEditState({
    VideoFilter? filter,
    @Default(1) int searchPage,
    Channel? channel,
    @Default([]) List<Channel> channelResults,
    @Default(false) showDateSettings,
}) = _VideoFilterEditState;

}
