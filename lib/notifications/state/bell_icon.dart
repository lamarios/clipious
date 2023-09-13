import 'package:bloc/bloc.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/notifications/models/db/channel_notifications.dart';

import '../../settings/states/settings.dart';

enum TurnOnStatus { ok, needToEnableBackGroundServices, needToEnableBatteryOptimization }

class BellIconCubit extends Cubit<bool> {
  final SettingsCubit settings;
  final String channelId;

  BellIconCubit(super.initialState, this.settings, this.channelId) {
    onInit();
  }

  void onInit() {
    if (settings.state.backgroundNotifications) {
      emit(db.getChannelNotification(channelId) != null);
    } else {
      emit(false);
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
      var channel = await service.getChannel(channelId);

      db.upsertChannelNotification(ChannelNotification(channelId, channel.author,
          channel.latestVideos?.firstOrNull?.videoId ?? '', DateTime.now().millisecondsSinceEpoch));
    } else {
      var notif = db.getChannelNotification(channelId);
      if (notif != null) {
        db.deleteChannelNotification(notif);
        emit(false);
      }
    }

    return TurnOnStatus.ok;
  }
}
