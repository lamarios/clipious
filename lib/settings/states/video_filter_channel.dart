import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:get/get.dart';
import 'package:invidious/settings/states/video_filter.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/channel.dart';

import '../models/db/video_filter.dart';

part 'video_filter_channel.g.dart';

const String allChannels = 'all';

class VideoFilterChannelCubit extends Cubit<VideoFilterChannelModel> {
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
      state.loading = true;
      state.update();
      state.channel = await service.getChannel(state.filters[0].channelId!);
      state.loading = false;
    }
    emit(state);
  }

  @override
  emit(VideoFilterChannelModel state) {
    super.emit(state.copyWith());
  }

  void deleteFilter(VideoFilter filter) {
    db.deleteFilter(filter);
    emit(state);
  }
}

@CopyWith()
class VideoFilterChannelModel extends GetxController {
  final List<VideoFilter> filters;
  Channel? channel;
  bool loading;

  VideoFilterChannelModel({required this.filters, this.channel, this.loading = false});
}
