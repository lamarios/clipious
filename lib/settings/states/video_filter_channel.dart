import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:invidious/channels/models/channel.dart';
import 'package:invidious/globals.dart';

import '../models/db/video_filter.dart';

part 'video_filter_channel.g.dart';

const String allChannels = 'all';

class VideoFilterChannelCubit extends Cubit<VideoFilterChannelState> {
  VideoFilterChannelCubit(super.initialState) {
    onReady();
  }

  onReady() {
    getChannel();
  }

  bool hasChannel() {
    return state.filters.isNotEmpty && state.filters[0].channelId != null && state.filters[0].channelId != allChannels;
  }

  Future<void> getChannel() async {
    if (state.filters.isNotEmpty && state.filters[0].channelId != null && state.filters[0].channelId != allChannels) {
      var state = this.state.copyWith();
      state.loading = true;
      emit(state);
      state = this.state.copyWith();
      state.channel = await service.getChannel(state.filters[0].channelId!);
      state.loading = false;
      emit(state);
    }
  }

  void deleteFilter(VideoFilter filter) {
    var state = this.state.copyWith();
    db.deleteFilter(filter);
    emit(state);
  }
}

@CopyWith()
class VideoFilterChannelState {
  final List<VideoFilter> filters;
  Channel? channel;
  bool loading;

  VideoFilterChannelState({required this.filters, this.channel, this.loading = false});
}
