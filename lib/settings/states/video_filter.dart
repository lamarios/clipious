import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/globals.dart';
import 'package:logging/logging.dart';

import '../models/db/video_filter.dart';
import 'video_filter_channel.dart';

part 'video_filter.freezed.dart';

final Logger log = Logger('VideoFilterController');

class VideoFilterCubit extends Cubit<VideoFilterState> {
  VideoFilterCubit(super.initialState) {
    refreshFilters();
  }

  onReady() {
    refreshFilters();
  }

  refreshFilters() {
    var filters = db.getAllFilters();
    filters.sort((a, b) {
      if (a.channelId == null && b.channelId != null) {
        return -1;
      } else if (b.channelId == null && a.channelId != null) {
        return 1;
      } else if (a.channelId == null && b.channelId == null) {
        return 0;
      } else {
        return a.channelId?.compareTo(b.channelId ?? '') ?? 0;
      }
    });
    log.fine('found ${filters.length} filters');
    emit(state.copyWith(filters: filters));
  }

  int sortChannels(String a, String b) {
    if (a == allChannels && b != allChannels) {
      return -1;
    } else if (b == allChannels && a != allChannels) {
      return 1;
    } else if (a == allChannels && b == allChannels) {
      return 0;
    } else {
      return a.compareTo(b);
    }
  }

  void hideOnFilteredChanged(bool value) {
    emit(state.copyWith(hideFilteredVideos: value));
  }
}

@freezed
class VideoFilterState with _$VideoFilterState {
  const factory VideoFilterState({@Default([]) List<VideoFilter> filters, @Default(false) bool hideFilteredVideos}) =
      _VideoFilterState;
}
