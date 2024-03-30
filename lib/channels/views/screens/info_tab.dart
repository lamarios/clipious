import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:invidious/channels/views/components/info.dart';
import 'package:invidious/utils/views/components/placeholders.dart';

import '../../models/channel.dart';

@RoutePage()
class ChannelInfoTab extends StatelessWidget {
  final Channel? channel;
  const ChannelInfoTab({
    super.key,
    this.channel,
  });

  @override
  Widget build(BuildContext context) {
    return channel == null
        ? const ChannelPlaceHolder()
        : ChannelInfo(channel: channel!);
  }
}
