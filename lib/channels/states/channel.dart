import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../../globals.dart';
import '../models/channel.dart';

part 'channel.g.dart';

class ChannelCubit extends Cubit<ChannelController> {
  ChannelCubit(super.initialState) {
    onReady();
  }

  Future<void> onReady() async {
    var state = this.state.copyWith();
    bool isSubscribed = await service.isSubscribedToChannel(state.channelId);
    Channel channel = await service.getChannel(state.channelId);

    state.channel = channel;
    state.loading = false;
    state.isSubscribed = isSubscribed;
    emit(state);
  }

/*
  @override
  close() async {
    state.controller?.dispose();
    super.close();
  }
*/

  selectIndex(int index) {
    var state = this.state.copyWith();
    state.selectedIndex = index;
    emit(state);
  }

  toggleSubscription() async {
    var state = this.state.copyWith();
    if (state.channel != null) {
      if (state.isSubscribed) {
        await service.unSubscribe(state.channel!.authorId);
      } else {
        await service.subscribe(state.channel!.authorId);
      }
      bool isSubscribed = await service.isSubscribedToChannel(state.channel!.authorId);

      state.isSubscribed = isSubscribed;
      emit(state);
    }
  }
}

@CopyWith(constructor: "_")
class ChannelController {
  String channelId;
  bool isSubscribed = false;
  int selectedIndex = 0;
  Channel? channel;
  bool loading = true;
  bool smallHeader = false;
  double barHeight = 200;
  double barOpacity = 1;

  ChannelController(this.channelId);

  ChannelController._(this.channelId, this.isSubscribed, this.selectedIndex, this.channel, this.loading,
      this.smallHeader, this.barHeight, this.barOpacity);
}
