import 'package:bloc/bloc.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/notifications/models/db/channel_notifications.dart';
import 'package:invidious/notifications/models/db/playlist_notifications.dart';

import '../../settings/states/settings.dart';
import '../views/components/bell_icon.dart';

enum TurnOnStatus { ok, needToEnableBackGroundServices, needToEnableBatteryOptimization }

class BellIconCubit extends Cubit<bool> {
  final SettingsCubit settings;
  final String itemId;
  final BellIconType type;

  BellIconCubit(super.initialState, this.settings, this.itemId, this.type) {
    onInit();
  }

  void onInit() {
    if (settings.state.backgroundNotifications) {
      emit(getNotification());
    } else {
      emit(false);
    }
  }

  bool getNotification() {
    switch (type) {
      case BellIconType.channel:
        return db.getChannelNotification(itemId) != null;
      case BellIconType.playlist:
        return db.getPlaylistNotification(itemId) != null;
    }
  }

  Future<TurnOnStatus> toggle() async {
    if (!state) {
      var backgroundServices = settings.state.backgroundNotifications;
      if (!backgroundServices) {
        return TurnOnStatus.needToEnableBackGroundServices;
      }

      if (!settings.state.backgroundNotifications) {
        var settingsResponse = await settings.setBackgroundNotifications(true);
        if (settingsResponse == EnableBackGroundNotificationResponse.needBatteryOptimization) {
          return TurnOnStatus.needToEnableBatteryOptimization;
        }
      }

      emit(true);
      switch (type) {
        case BellIconType.channel:
          var channel = await service.getChannel(itemId);
          db.upsertChannelNotification(ChannelNotification(itemId, channel.author,
              channel.latestVideos?.firstOrNull?.videoId ?? '', DateTime.now().millisecondsSinceEpoch));
          break;
        case BellIconType.playlist:
          var playlist = await service.getPublicPlaylists(itemId);
          db.upsertPlaylistNotification(
              PlaylistNotification(itemId, playlist.videoCount, DateTime.now().millisecondsSinceEpoch, playlist.title));

          break;
      }
    } else {
      switch (type) {
        case BellIconType.channel:
          var notif = db.getChannelNotification(itemId);
          if (notif != null) {
            db.deleteChannelNotification(notif);
            emit(false);
          }
          break;
        case BellIconType.playlist:
          var notif = db.getPlaylistNotification(itemId);
          if (notif != null) {
            db.deletePlaylistNotification(notif);
            emit(false);
          }
      }
    }

    return TurnOnStatus.ok;
  }
}
