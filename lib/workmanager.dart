import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/notifications/models/db/subscription_notifications.dart';
import 'package:clipious/settings/states/settings.dart';
import 'package:clipious/utils/file_db.dart';
import 'package:clipious/videos/models/video_in_list.dart';
import 'package:logging/logging.dart';
import 'package:workmanager/workmanager.dart';

import 'notifications/notifications.dart';

var log = Logger('background-task');
const taskName = "Clipious background refresh task";

Future<void> configureBackgroundService(SettingsCubit settings) async {
  if (settings.state.backgroundNotifications) {
    await Workmanager()
        .initialize(callbackDispatcher, isInDebugMode: kDebugMode);
  }
}

Future<void> setupTasks(SettingsCubit settings) async {
  try {
    await Workmanager().cancelByUniqueName(taskName);
  } catch (e) {
    log.fine('task not registered');
    // fail silently in case no tasks have been already defined
  }
  await Workmanager().registerPeriodicTask(taskName, taskName,
      frequency: kDebugMode
          ? const Duration(seconds: 15)
          : Duration(hours: settings.state.backgroundNotificationFrequency),
      constraints: Constraints(
          networkType: NetworkType.connected, requiresBatteryNotLow: true));
}

Future<void> stopTasks() async {
  await Workmanager().cancelAll();
}

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    log.info(
        "Native called background task: $task"); //simpleTask will be emitted here.
    if (task == taskName) {
      await _backgroundCheck();
    }
    return Future.value(true);
  });
}

_backgroundCheck() async {
  try {
    Logger.root.level =
        kDebugMode ? Level.FINEST : Level.INFO; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) async {
      debugPrint(
          '[${record.level.name}] [${record.loggerName}] ${record.message}');
    });
    db = FileDB();
    await _handleSubscriptionsNotifications();
    await _handleChannelNotifications();
    await _handlePlaylistNotifications();
  } catch (e) {
    log.severe("Error while running workmanager", e);
    rethrow;
  }
}

Future<AppLocalizations> getLocalization() async {
  List<String>? localeString;
  String dbLocale = await fileDb.getLocale() ?? Intl.getCurrentLocale();
  localeString = dbLocale.split('_');

  Locale locale = Locale.fromSubtags(
      languageCode: localeString[0],
      scriptCode: localeString.length >= 2 ? localeString[1] : null);

  return await AppLocalizations.delegate.load(locale);
}

_handlePlaylistNotifications() async {
  var notifs = await fileDb.getAllPlaylistNotifications();
  for (var n in notifs) {
    // we get the latest video,
    var videos =
        await service.getPublicPlaylists(n.playlistId, saveLastSeen: false);

    if (videos.videos.isNotEmpty) {
      if (n.lastVideoCount > 0) {
        // if in list, we calculate
        int videosToNotifyAbout = n.lastVideoCount - videos.videoCount;

        // if not we tell that list.size+ new videos are available
        var locals = await getLocalization();

        if (kDebugMode || videosToNotifyAbout > 0) {
          sendNotification(
              locals.playlistNotificationTitle(n.playlistName),
              locals.playlistNotificationContent(
                  n.playlistName, videosToNotifyAbout),
              type: NotificationTypes.playlist,
              payload: {
                playlistId: n.playlistId,
              },
              id: n.playlistId.hashCode);
        }
      }
    }
  }
}

_handleChannelNotifications() async {
  var notifs = await fileDb.getAllChannelNotifications();

  for (var n in notifs) {
    // we get the latest video,
    var videos =
        await service.getChannelVideos(n.channelId, null, saveLastSeen: false);

    if (videos.videos.isNotEmpty) {
      if (n.lastSeenVideoId.isNotEmpty) {
        // if in list, we calculate
        int videosToNotifyAbout = 0;

        int index = videos.videos
            .indexWhere((element) => element.videoId == n.lastSeenVideoId);

        if (index >= 0) {
          videosToNotifyAbout = index;
        } else {
          videosToNotifyAbout = videos.videos.length;
        }

        // if not we tell that list.size+ new videos are available
        var locals = await getLocalization();

        if (kDebugMode || videosToNotifyAbout > 0) {
          sendNotification(
              locals.channelNotificationTitle(n.channelName),
              locals.channelNotificationContent(
                  n.channelName, videosToNotifyAbout),
              type: NotificationTypes.channel,
              payload: {
                channelId: n.channelId,
                lastSeenVideo: videos.videos.first.videoId
              },
              id: n.channelId.hashCode);
        }
      }
    }
  }
}

_handleSubscriptionsNotifications() async {
  bool isEnabled = await fileDb.getSubscriptionNotifications();
  if (isEnabled && await db.isLoggedInToCurrentServer()) {
    // we need to get the last notification before we call the feed endpoint as it is going to save the last seen video
    final lastNotification = await fileDb.getLastSubscriptionNotification();
    var feed = await service.getUserFeed(maxResults: 100, saveLastSeen: false);

    List<VideoInList> videos = [];
    videos.addAll(feed.notifications ?? []);
    videos.addAll(feed.videos ?? []);

    if (videos.isNotEmpty) {
      // we don't send notification for the first run ever to avoid weird behavior
      if (lastNotification == null) {
        var toSave = SubscriptionNotification(
            videos.last.videoId, DateTime.now().millisecondsSinceEpoch);
        await fileDb.setLastSubscriptionNotification(toSave);
      } else {
        late int videosToNotifyAbout;
        int index = videos.indexWhere(
            (element) => element.videoId == lastNotification.lastSeenVideoId);
        //more than 100 videos
        if (index == -1) {
          videosToNotifyAbout = videos.length;
        } else {
          videosToNotifyAbout = index;
        }

        var locals = await getLocalization();

        if (kDebugMode || videosToNotifyAbout > 0) {
          sendNotification(locals.subscriptionNotificationTitle,
              locals.subscriptionNotificationContent(videosToNotifyAbout),
              type: NotificationTypes.subscription,
              payload: {lastSeenVideo: videos.first.videoId});
        }
      }
    }
  }
}
