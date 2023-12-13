import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../globals.dart';

part 'subscribe_button.freezed.dart';

class SubscribeButtonCubit extends Cubit<SubscribeButtonState> {
  SubscribeButtonCubit(super.initialState) {
    onReady();
  }

  toggleSubscription() async {
    emit(state.copyWith(loading: true));

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
    emit(state.copyWith(loading: false, isSubscribed: isSubscribed));
  }

  Future<void> onReady() async {
    bool isSubscribed = await service.isSubscribedToChannel(state.channelId);
    emit(state.copyWith(loading: false, isSubscribed: isSubscribed));
  }
}

@freezed
class SubscribeButtonState with _$SubscribeButtonState {
  const factory SubscribeButtonState({
    required String channelId,
    @Default(false) bool isSubscribed,
    @Default(true) bool loading,
    required bool isLoggedIn,
  }) = _SubscribeButtonState;

  static SubscribeButtonState init(String channelId) {
    return SubscribeButtonState(
        channelId: channelId, isLoggedIn: db.isLoggedInToCurrentServer());
  }
}
