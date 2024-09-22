
import 'package:flutter_test/flutter_test.dart';
import 'package:clipious/channels/states/channel.dart';
import 'package:clipious/globals.dart';

import '../../utils/server.dart';

void main() {
  setUp(() async => setUpTestsForTestServer());

  tearDown(() => cleanUpTestServer());

  test('channel subscription', () async {
    const channelId = 'UCl2mFZoRqjw_ELax4Yisf6w';
    var channel = ChannelCubit(const ChannelController(channelId: channelId));
    await channel.onReady();

    var subbed = await service.isSubscribedToChannel(channelId);
    expect(channel.state.channel != null, true);

    await channel.toggleSubscription();
    expect(channel.state.isSubscribed, !subbed);
    var newSub = await service.isSubscribedToChannel(channelId);
    expect(newSub, !subbed);
    await channel.toggleSubscription();
    expect(channel.state.isSubscribed, subbed);
    newSub = await  service.isSubscribedToChannel(channelId);
    expect(newSub, subbed);
  });
}
