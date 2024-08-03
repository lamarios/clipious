import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/subscription_management/states/subscribe_button.dart';

import '../../../notifications/views/components/bell_icon.dart';

class SubscribeButton extends StatelessWidget {
  final String channelId;
  final String subCount;

  const SubscribeButton(
      {super.key, required this.channelId, required this.subCount});

  static showSubscriptionSheet(BuildContext context) {
    final cubit = context.read<SubscribeButtonCubit>();
    final locals = AppLocalizations.of(context)!;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (cubit.state.isLoggedIn)
              TextButton(
                  onPressed: () async {
                    await cubit.setAccountSubscription(true);
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(locals.invidiousAccount)),
            TextButton(
                onPressed: () async {
                  await cubit.setOfflineSubscription(true);
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
                child: Text(locals.onDeviceSubscriptions)),
            if (cubit.state.isLoggedIn)
              TextButton(
                  onPressed: () async {
                    await Future.wait<void>([
                      cubit.setOfflineSubscription(true),
                      cubit.setAccountSubscription(true)
                    ]);
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(locals.both)),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocProvider(
          create: (context) =>
              SubscribeButtonCubit(SubscribeButtonState.init(channelId)),
          child: BlocBuilder<SubscribeButtonCubit, SubscribeButtonState>(
            builder: (context, state) {
              var cubit = context.read<SubscribeButtonCubit>();
              return SizedBox(
                  height: 25,
                  child: FilledButton.tonal(
                    onPressed: () {
                      if (state.isSubscribed) {
                        cubit.unsubscribe();
                      } else {
                        showSubscriptionSheet(context);
                      }
                    },
                    child: Row(
                      children: [
                        state.loading
                            ? const SizedBox(
                                width: 15,
                                height: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 1,
                                ))
                            : Icon(state.isSubscribed ? Icons.done : Icons.add),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                              '${(state.isSubscribed ? locals.subscribed : locals.subscribe)} | $subCount'),
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
