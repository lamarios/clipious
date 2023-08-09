import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:invidious/extensions.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../globals.dart';
import '../models/subscription.dart';

class ManageSubscriptionsController extends GetxController {
  final logger = Logger('ManageSubscriptionController');
  List<Subscription> subs = [];
  bool loading = true;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onReady() {
    super.onReady();
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
    loading = true;
    update();
    subs = (await service.getSubscriptions()).sortBy((e) => e.author).toList();
    loading = false;
    update();
    refreshController.refreshCompleted();
  }
}
