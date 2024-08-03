import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/offline_subscriptions/models/offline_subscription.dart';

import '../../globals.dart';

part 'subscribe_button.freezed.dart';

class SubscribeButtonCubit extends Cubit<SubscribeButtonState> {
  SubscribeButtonCubit(super.initialState) {
    onReady();
  }

  setAccountSubscription(bool subscribed) async {
    emit(state.copyWith(loading: true));

    bool wasSubscribed = state.isAccountSubscribed;
    bool success = false;
    if (!subscribed) {
      success = await service.unSubscribe(state.channelId);
    } else {
      success = await service.subscribe(state.channelId);
    }
    bool isSubscribed = await service.isSubscribedToChannel(state.channelId);
    if (!success || isSubscribed == wasSubscribed) {
      return setAccountSubscription(subscribed);
    }
    emit(state.copyWith(loading: false, isAccountSubscribed: isSubscribed));
  }

  setOfflineSubscription(bool subscribed) async {
    if (subscribed) {
      final channel = await service.getChannel(state.channelId);
      await db.addOfflineSubscription(OfflineSubscription(
          channelId: state.channelId, channelName: channel.author));
    } else {
      await db.deleteOfflineSubscription(state.channelId);
    }
    emit(state.copyWith(isOfflineSubscribed: subscribed));
  }

  Future<void> onReady() async {
    var isLoggedIn = await service.isLoggedIn();

    bool isAccountSubscribed =
        isLoggedIn && await service.isSubscribedToChannel(state.channelId);

    bool isOfflineSubscribed = await db.isOfflineSubscribed(state.channelId);
    emit(state.copyWith(
        loading: false,
        isOfflineSubscribed: isOfflineSubscribed,
        isAccountSubscribed: isAccountSubscribed,
        isLoggedIn: isLoggedIn));
  }

  Future<void> unsubscribe() async {
    emit(state.copyWith(loading: true));

    if (state.isAccountSubscribed) {
      await setAccountSubscription(false);
    }

    if (state.isOfflineSubscribed) {
      await setOfflineSubscription(false);
    }

    emit(state.copyWith(loading: false));
  }
}

@freezed
class SubscribeButtonState with _$SubscribeButtonState {
  const factory SubscribeButtonState({
    required String channelId,
    @Default(false) bool isOfflineSubscribed,
    @Default(false) bool isAccountSubscribed,
    @Default(true) bool loading,
    required bool isLoggedIn,
  }) = _SubscribeButtonState;

  const SubscribeButtonState._();

  bool get isSubscribed => isOfflineSubscribed || isAccountSubscribed;

  static SubscribeButtonState init(String channelId) {
    return SubscribeButtonState(channelId: channelId, isLoggedIn: false);
  }
}
