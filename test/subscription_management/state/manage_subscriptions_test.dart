import 'package:flutter_test/flutter_test.dart';
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/settings/models/db/server.dart';
import 'package:invidious/subscription_management/states/manage_subscriptions.dart';

import '../../globals.dart';
import '../../utils/memorydb.dart';
import '../../utils/server.dart';

void main() {
  setUp(() async => await setUpTestsForTestServer());

  tearDown(() async => await cleanUpTestServer());

  test('managing subscriptions', () async {
    var manager = ManageSubscriptionCubit(const ManageSubscriptionsState());
    await manager.refreshSubs();
    // the subscription manager doesn't handle subscribing as it doesn't really make sense to do it there
    const channelId = 'UCHDxYLv8iovIbhrfl16CNyg';
    await service.subscribe(channelId);
    await manager.refreshSubs();
    expect(manager.state.subs.any((element) => element.authorId == channelId), true);
    await manager.unsubscribe(channelId);
    await manager.refreshSubs();
    expect(manager.state.subs.any((element) => element.authorId == channelId), false);
  });
}
