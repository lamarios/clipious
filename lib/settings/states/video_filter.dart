import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:logging/logging.dart';

import '../models/db/video_filter.dart';
import 'video_filter_channel.dart';

part 'video_filter.g.dart';

final Logger log = Logger('VideoFilterController');

class VideoFilterCubit extends Cubit<VideoFilterState> {
  VideoFilterCubit(super.initialState) {
    refreshFilters();
  }

  onReady() {
    refreshFilters();
  }

  refreshFilters() {
    var state = this.state.copyWith();
    state.filters = db.getAllFilters();
    state.filters.sort((a, b) {
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
    log.fine('found ${state.filters.length} filters');
    emit(state);
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
    var state = this.state.copyWith();
    state.hideFilteredVideos = value;
    emit(state);
  }
}

@CopyWith()
class VideoFilterState {
  List<VideoFilter> filters;
  bool hideFilteredVideos;

  VideoFilterState({List<VideoFilter>? filters, bool? hideFilteredVideos})
      : filters = filters ?? [],
        hideFilteredVideos = hideFilteredVideos ?? (db.getSettings(HIDE_FILTERED_VIDEOS)?.value == true);
}
