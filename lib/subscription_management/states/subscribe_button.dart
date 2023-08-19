import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../../globals.dart';

part 'subscribe_button.g.dart';

class SubscribeButtonCubit extends Cubit<SubscribeButtonState> {
  SubscribeButtonCubit(super.initialState) {
    onReady();
  }

  toggleSubscription() async {
    var state = this.state.copyWith();
    state.loading = true;
    emit(state);

    state = this.state.copyWith();
    bool wasSubscribed = state.isSubscribed;
    bool success = false;
    if (wasSubscribed) {
      success = await service.unSubscribe(state.channelId);
    } else {
      success = await service.subscribe(state.channelId);
    }
    bool isSubscribed = await service.isSubscribedToChannel(state.channelId);
    if (!success || isSubscribed == wasSubscribed) {
      return toggleSubscription();
    }
    state.isSubscribed = isSubscribed;
    state.loading = false;
    emit(state);
  }

  Future<void> onReady() async {
    var state = this.state.copyWith();
    bool isSubscribed = await service.isSubscribedToChannel(state.channelId);
    state.isSubscribed = isSubscribed;
    state.loading = false;
    emit(state);
  }
}

@CopyWith(constructor: "_")
class SubscribeButtonState {
  static generateTags(String channelId) {
    return 'subscribe-button-$channelId';
  }

  String channelId;
  bool isSubscribed = false;
  bool loading = true;
  bool isLoggedIn = db.isLoggedInToCurrentServer();

  SubscribeButtonState({required this.channelId});

  SubscribeButtonState._(this.channelId, this.isSubscribed, this.loading, this.isLoggedIn);
}
