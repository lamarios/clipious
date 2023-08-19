import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:invidious/extensions.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../globals.dart';
import '../models/subscription.dart';

part 'manage_subscriptions.g.dart';

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
    var state = this.state.copyWith();
    state.loading = true;
    emit(state);
    state = this.state.copyWith();
    state.subs = (await service.getSubscriptions()).sortBy((e) => e.author).toList();
    state.loading = false;
    emit(state);
    state.refreshController.refreshCompleted();
  }
}

@CopyWith()
class ManageSubscriptionsState {
  List<Subscription> subs;
  bool loading;
  RefreshController refreshController;

  ManageSubscriptionsState({List<Subscription>? subs, bool? loading = true, RefreshController? refreshController})
      : subs = subs ?? [],
        loading = loading ?? true,
        refreshController = refreshController ?? RefreshController(initialRefresh: false);
}
