import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoFilterController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/channel.dart';

import '../models/db/videoFilter.dart';

part 'VideoFilterChannelController.g.dart';

const String allChannels = 'all';

class VideoFilterChannelCubit extends Cubit<VideoFilterChannelController> {
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
  emit(VideoFilterChannelController state) {
    super.emit(state.copyWith());
  }

  void deleteFilter(VideoFilter filter) {
    db.deleteFilter(filter);
    emit(state);
  }
}

@CopyWith()
class VideoFilterChannelController extends GetxController {
  final List<VideoFilter> filters;
  Channel? channel;
  bool loading;

  VideoFilterChannelController({required this.filters, this.channel, this.loading = false});
}
