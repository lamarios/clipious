import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/notifications/models/db/channel_notifications.dart';
import 'package:invidious/subscription_management/states/subscribe_button.dart';

import '../../../notifications/views/components/bell_icon.dart';

class SubscribeButton extends StatelessWidget {
  final String channelId;
  final String subCount;

  const SubscribeButton({super.key, required this.channelId, required this.subCount});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocProvider(
          create: (context) => SubscribeButtonCubit(SubscribeButtonState(channelId: channelId)),
          child: BlocBuilder<SubscribeButtonCubit, SubscribeButtonState>(
            builder: (context, _) {
              var cubit = context.read<SubscribeButtonCubit>();
              return SizedBox(
                  height: 25,
                  child: FilledButton.tonal(
                    onPressed: _.isLoggedIn ? cubit.toggleSubscription : null,
                    child: Row(
                      children: _.isLoggedIn
                          ? [
                              _.loading
                                  ? const SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1,
                                      ))
                                  : Icon(_.isSubscribed ? Icons.done : Icons.add),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('${(_.isSubscribed ? locals.subscribed : locals.subscribe)} | $subCount'),
                              ),
                            ]
                          : [
                              const Icon(Icons.people),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                // child: Text('${subCount.replaceAll("^0.00\$","no")} subscribers'),
                                child: Text(locals.nSubscribers(subCount.replaceAll(RegExp(r'^0.00$'), "no"))),
                              ),
                            ],
                    ),
                  ));
            },
          ),
        ),
        BellIcon(
          itemId: channelId,
          type: BellIconType.channel,
        )
      ],
    );
  }
}
