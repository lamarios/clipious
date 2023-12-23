
import 'package:flutter_test/flutter_test.dart';
import 'package:invidious/channels/states/channel.dart';
import 'package:invidious/globals.dart';

import '../../utils/server.dart';

void main() {
  setUp(() async => setUpTestsForTestServer());

  tearDown(() => cleanUpTestServer());

  test('channel subscription', () async {
    const channelId = 'UCl2mFZoRqjw_ELax4Yisf6w';
    var channel = ChannelCubit(const ChannelController(channelId: channelId));
    await channel.onReady();

    expect(channel.state.channel != null, true);

    await channel.toggleSubscription();
    expect(channel.state.isSubscribed, true);
    var subbed = await service.isSubscribedToChannel(channelId);
    expect(subbed, true);
    await channel.toggleSubscription();
    expect(channel.state.isSubscribed, false);
    subbed = await  service.isSubscribedToChannel(channelId);
    expect(subbed, false);
  });
}
