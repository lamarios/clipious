import 'package:flutter_test/flutter_test.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/subscription_management/states/subscribe_button.dart';

import '../utils/memorydb.dart';
import '../utils/server.dart';

void main() {
  setUp(() async {
    db = MemoryDB();
    var server = await getLoggedInTestServer();
    db.upsertServer(server);
  });

  test('test subscribe button', () async {
    var channelId = 'UCHDxYLv8iovIbhrfl16CNyg';
    var button = SubscribeButtonCubit(SubscribeButtonState.init(channelId));

    // the cubit checks subscription status on start
    await button.onReady();
    // we unsubscribe just to make sure server is clean
    await service.unSubscribe(channelId);
    await button.toggleSubscription();
    var subscribed = await service.isSubscribedToChannel(channelId);
    expect(subscribed, true);
    await button.toggleSubscription();
    subscribed = await service.isSubscribedToChannel(channelId);
    expect(subscribed, false);
  });
}
