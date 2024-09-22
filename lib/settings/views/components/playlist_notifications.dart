import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/notifications/models/db/playlist_notifications.dart';
import 'package:clipious/router.dart';
import 'package:clipious/settings/states/channel_notifications.dart';
import 'package:clipious/utils.dart';

class PlaylistNotificationList extends StatelessWidget {
  const PlaylistNotificationList({super.key});

  deleteNotification(BuildContext context, PlaylistNotification notif) {
    var cubit = context.read<PlaylistNotificationListCubit>();
    var locals = AppLocalizations.of(context)!;
    okCancelDialog(
        context,
        locals.deletePlaylistNotificationTitle,
        locals.deletePlaylistNotificationContent,
        () => cubit.deleteNotification(notif));
  }

  openPlaylist(BuildContext context, String playlistId) {
    service.getPublicPlaylists(playlistId).then((value) => {
          if (context.mounted)
            {
              AutoRouter.of(context).push(
                  PlaylistViewRoute(playlist: value, canDeleteVideos: false))
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return BlocProvider(
        create: (context) => PlaylistNotificationListCubit([]),
        child: BlocBuilder<PlaylistNotificationListCubit,
            List<PlaylistNotification>>(builder: (context, channels) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: channels.length,
              itemBuilder: (context, index) {
                var notif = channels[index];
                return Container(
                  key: ValueKey(notif.playlistId),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: index % 2 != 0
                          ? colors.secondaryContainer.withOpacity(0.5)
                          : colors.surface,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () => openPlaylist(context, notif.playlistId),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(notif.playlistName),
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
