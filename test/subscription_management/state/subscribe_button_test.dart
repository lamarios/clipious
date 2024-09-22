import 'package:flutter_test/flutter_test.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/subscription_management/states/subscribe_button.dart';

import '../../utils/server.dart';

void main() {
  setUp(() async => await setUpTestsForTestServer());

  tearDown(() async => await cleanUpTestServer());

  test('test subscribe button', () async {
    var channelId = 'UCHDxYLv8iovIbhrfl16CNyg';
    var button = SubscribeButtonCubit(SubscribeButtonState.init(channelId));

    // the cubit checks subscription status on start
    await button.onReady();
    var subscribed = await service.isSubscribedToChannel(channelId);
    // we unsubscribe just to make sure server is clean
    await button.unsubscribe();
    var sub1 = await service.isSubscribedToChannel(channelId);
    expect(sub1, !subscribed);
    await button.setAccountSubscription(subscribed);
    var sub2 = await service.isSubscribedToChannel(channelId);
    expect(sub2, subscribed);
  });
}
