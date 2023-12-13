import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/extensions.dart';
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
      logger.fine('Issue setting subscription unsub request: $success  isSubscribed: $isSubscribed');
      return unsubscribe(authorId);
    }

    refreshSubs();
  }

  refreshSubs() async {
    emit(state.copyWith(loading: true));
    var subs = (await service.getSubscriptions()).sortBy((e) => e.author).toList();
    emit(state.copyWith(subs: subs, loading: false));
  }
}

@freezed
class ManageSubscriptionsState with _$ManageSubscriptionsState {
  const factory ManageSubscriptionsState({
    @Default([]) List<Subscription> subs,
    @Default(true) bool loading
}) = _ManageSubscriptionsState;
}
