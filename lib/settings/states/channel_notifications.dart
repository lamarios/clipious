import 'package:bloc/bloc.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/notifications/models/db/channel_notifications.dart';

class ChannelNotificationListCubit extends Cubit<List<ChannelNotification>>{
  ChannelNotificationListCubit(super.initialState);

  deleteNotification(ChannelNotification notif) {
    db.deleteChannelNotification(notif);
    emit(List.of(db.getAllChannelNotifications()));
  }



}