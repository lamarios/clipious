import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:clipious/notifications/models/db/channel_notifications.dart';
import 'package:clipious/router.dart';
import 'package:clipious/settings/states/channel_notifications.dart';
import 'package:clipious/utils.dart';

class ChannelNotificationList extends StatelessWidget {
  const ChannelNotificationList({super.key});

  deleteNotification(BuildContext context, ChannelNotification notif) {
    var cubit = context.read<ChannelNotificationListCubit>();
    var locals = AppLocalizations.of(context)!;
    okCancelDialog(
        context,
        locals.deleteChannelNotificationTitle,
        locals.deleteChannelNotificationContent,
        () => cubit.deleteNotification(notif));
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return BlocProvider(
        create: (context) => ChannelNotificationListCubit([]),
        child: BlocBuilder<ChannelNotificationListCubit,
            List<ChannelNotification>>(builder: (context, channels) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: channels.length,
              itemBuilder: (context, index) {
                var notif = channels[index];
                return Container(
                  key: ValueKey(notif.channelId),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: index % 2 != 0
                          ? colors.secondaryContainer.withOpacity(0.5)
                          : colors.surface,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () => AutoRouter.of(context)
                        .push(ChannelRoute(channelId: notif.channelId)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(notif.channelName),
                        IconButton(
                            onPressed: () => deleteNotification(context, notif),
                            icon: const Icon(Icons.clear))
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }));
  }
}
