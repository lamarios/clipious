import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clipious/extensions.dart';
import 'package:clipious/offline_subscriptions/models/offline_subscription.dart';
import 'package:logging/logging.dart';

import '../../globals.dart';
import '../models/subscription.dart';

part 'manage_subscriptions.freezed.dart';

final logger = Logger('ManageSubscriptionController');

class ManageSubscriptionCubit extends Cubit<ManageSubscriptionsState> {
  ManageSubscriptionCubit(super.initialState) {
    onReady();
  }

  void onReady() {
    refreshSubs();
  }

  unsubscribe(String authorId) async {
    bool success = await service.unSubscribe(authorId);
    bool isSubscribed = await service.isSubscribedToChannel(authorId);

    if (!success || isSubscribed) {
      logger.fine(
          'Issue setting subscription unsub request: $success  isSubscribed: $isSubscribed');
      return unsubscribe(authorId);
    }

    refreshSubs();
  }

  refreshSubs() async {
    final isLoggedIn = await service.isLoggedIn();
    emit(state.copyWith(loading: true));
    List<Subscription> subs = [];
    if (isLoggedIn) {
      subs =
          (await service.getSubscriptions()).sortBy((e) => e.author).toList();
    }
    final offlineSubs = await db.getOfflineSubscriptions();
    emit(state.copyWith(
        subs: subs,
        loading: false,
        isLoggedIn: isLoggedIn,
        offlineSubs: offlineSubs));
  }

  unsubscribeOffline(String channelId) async {
    await db.deleteOfflineSubscription(channelId);
    refreshSubs();
  }
}

@freezed
sealed class ManageSubscriptionsState with _$ManageSubscriptionsState {
  const factory ManageSubscriptionsState(
      {@Default([]) List<Subscription> subs,
      @Default([]) List<OfflineSubscription> offlineSubs,
      @Default(false) isLoggedIn,
      @Default(true) bool loading}) = _ManageSubscriptionsState;
}
