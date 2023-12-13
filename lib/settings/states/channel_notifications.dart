import 'package:bloc/bloc.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/notifications/models/db/channel_notifications.dart';
import 'package:invidious/notifications/models/db/playlist_notifications.dart';

abstract class NotificationListCubit<T> extends Cubit<List<T>> {
  NotificationListCubit(super.initialState);

  deleteNotification(T notif);
}

class ChannelNotificationListCubit
    extends NotificationListCubit<ChannelNotification> {
  ChannelNotificationListCubit(super.initialState);

  @override
  deleteNotification(ChannelNotification notif) {
    db.deleteChannelNotification(notif);
    emit(List.of(db.getAllChannelNotifications()));
  }
}

class PlaylistNotificationListCubit
    extends NotificationListCubit<PlaylistNotification> {
  PlaylistNotificationListCubit(super.initialState);

  @override
  deleteNotification(PlaylistNotification notif) {
    db.deletePlaylistNotification(notif);
    emit(List.of(db.getAllPlaylistNotifications()));
  }
}
