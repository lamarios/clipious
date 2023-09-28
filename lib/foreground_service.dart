import 'dart:async';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/notifications/models/db/subscription_notifications.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/videos/models/video_in_list.dart';
import 'package:logging/logging.dart';

import 'notifications/notifications.dart';

const restartTimerMethod = 'restart-timer';

final backgroundService = FlutterBackgroundService();

final log = Logger('Background service');

const debugMode = kDebugMode;
// const debugMode = true;

Timer? timer;

void configureBackgroundService(SettingsCubit settings) async {
  var notif = NotificationTypes.foregroundService;

  var locals = await getLocalization();

  await backgroundService.configure(
      iosConfiguration: IosConfiguration(),
      androidConfiguration: AndroidConfiguration(
          onStart: onStart,
          autoStart: settings.state.backgroundNotifications,
          autoStartOnBoot: settings.state.backgroundNotifications,
          isForegroundMode: true,
          foregroundServiceNotificationId: notif.idSpace,
          initialNotificationTitle: locals.foregroundServiceNotificationTitle,
          initialNotificationContent: locals.foregroundServiceNotificationContent(refreshRate),
          notificationChannelId: notif.id));
}

String get refreshRate => db.getSettings(BACKGROUND_CHECK_FREQUENCY)?.value ?? "1";

@pragma('vm:entry-point')
onStart(ServiceInstance service) async {
  print("Background service started");

  DartPluginRegistrant.ensureInitialized();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    print('foreground service stopped');
    service.stopSelf();
  });

  service.on(restartTimerMethod).listen((event) async {
    await _restartTimer();
  });

  // we run the background stuff once when it starts
  _backgroundCheck();
  _restartTimer();
}

_restartTimer() async {
  print('setting background timer');
  db = await DbClient.create();
  var locals = await getLocalization();
  var title = locals.foregroundServiceNotificationTitle;
  sendNotification(title, locals.foregroundServiceNotificationContent(refreshRate), type: NotificationTypes.foregroundService);
  timer?.cancel();
  timer = Timer.periodic(debugMode ? const Duration(seconds: 60) : Duration(hours: int.parse(refreshRate)), (timer) {
    print('foreground service running');
    _backgroundCheck();
  });

  db.close();
}

_backgroundCheck() async {
  try {
    db = await DbClient.create();

    var locals = await getLocalization();
    var title = locals.foregroundServiceNotificationTitle;
    print('we have a db ${db.isClosed}');
    sendNotification(title, locals.foregroundServiceUpdatingSubscriptions, type: NotificationTypes.foregroundService);
    await _handleSubscriptionsNotifications();
    sendNotification(title, locals.foregroundServiceUpdatingChannels, type: NotificationTypes.foregroundService);
    await _handleChannelNotifications();
    sendNotification(title, locals.foregroundServiceUpdatingPlaylist, type: NotificationTypes.foregroundService);
    await _handlePlaylistNotifications();
    sendNotification(title, locals.foregroundServiceNotificationContent(refreshRate), type: NotificationTypes.foregroundService);

    service.syncHistory();
  } catch (e) {
    print('we have a background service error: ${e}');
  } finally {
    db.close();
  }
}

Future<AppLocalizations> getLocalization() async {
  List<String>? localeString;
  String dbLocale = db.getSettings(LOCALE)?.value ?? Intl.getCurrentLocale();
  localeString = dbLocale.split('_');

  print('Locale to use: $dbLocale');
  Locale locale = Locale.fromSubtags(languageCode: localeString[0], scriptCode: localeString.length >= 2 ? localeString[1] : null);

  return await AppLocalizations.delegate.load(locale);
}

_handlePlaylistNotifications() async {
  var notifs = db.getAllPlaylistNotifications();
  print('Watching ${notifs.length} playlists');
  for (var n in notifs) {
    // we get the latest video,
    var videos = await service.getPublicPlaylists(n.playlistId, saveLastSeen: false);

    if ((videos.videos ?? []).isNotEmpty) {
      if (n.lastVideoCount > 0) {
        // if in list, we calculate
        int videosToNotifyAbout = n.lastVideoCount - videos.videoCount;

        // if not we tell that list.size+ new videos are available
        var locals = await getLocalization();

        print('$videosToNotifyAbout videos from playlist ${n.playlistName} to notify about');
        if (debugMode || videosToNotifyAbout > 0) {
          sendNotification(locals.playlistNotificationTitle(n.playlistName), locals.playlistNotificationContent(n.playlistName, videosToNotifyAbout),
              type: NotificationTypes.playlist,
              payload: {
                playlistId: n.playlistId,
              },
              id: n.id);
        }
      }
    }
  }
}

_handleChannelNotifications() async {
  var notifs = db.getAllChannelNotifications();

  print('Watching ${notifs.length} channels');
  for (var n in notifs) {
    // we get the latest video,
    var videos = await service.getChannelVideos(n.channelId, null, saveLastSeen: false);

    if ((videos.videos ?? []).isNotEmpty) {
      if (n.lastSeenVideoId.isNotEmpty) {
        // if in list, we calculate
        int videosToNotifyAbout = 0;

        int index = videos.videos.indexWhere((element) => element.videoId == n.lastSeenVideoId);

        if (index >= 0) {
          videosToNotifyAbout = index;
        } else {
          videosToNotifyAbout = videos.videos.length;
        }

        // if not we tell that list.size+ new videos are available
        var locals = await getLocalization();

        print('$videosToNotifyAbout videos from channel ${n.channelName} to notify about');
        if (debugMode || videosToNotifyAbout > 0) {
          sendNotification(locals.channelNotificationTitle(n.channelName), locals.channelNotificationContent(n.channelName, videosToNotifyAbout),
              type: NotificationTypes.channel, payload: {channelId: n.channelId, lastSeenVideo: videos.videos.first.videoId}, id: n.id);
        }
      }
    }
  }
}

_handleSubscriptionsNotifications() async {
  bool isEnabled = db.getSettings(SUBSCRIPTION_NOTIFICATIONS)?.value == 'true';
  if (isEnabled && db.isLoggedInToCurrentServer()) {
    // we need to get the last notification before we call the feed endpoint as it is going to save the last seen video
    final lastNotification = db.getLastSubscriptionNotification();
    print('getting feed...');
    var feed = await service.getUserFeed(maxResults: 100, saveLastSeen: false);

    List<VideoInList> videos = [];
    videos.addAll(feed.notifications ?? []);
    videos.addAll(feed.videos ?? []);

    print('we have a feed with ${videos.length} videos');

    if (videos.isNotEmpty) {
      // we don't send notification for the first run ever to avoid weird behavior
      if (lastNotification == null) {
        var toSave = SubscriptionNotification(videos.last.videoId, DateTime.now().millisecondsSinceEpoch);
        db.setLastSubscriptionNotification(toSave);
        print('first time run');
      } else {
        late int videosToNotifyAbout;
        int index = videos.indexWhere((element) => element.videoId == lastNotification.lastSeenVideoId);
        //more than 100 videos
        if (index == -1) {
          videosToNotifyAbout = videos.length;
        } else {
          videosToNotifyAbout = index;
        }

        var locals = await getLocalization();

        print('$videosToNotifyAbout videos to notify about');
        if (debugMode || videosToNotifyAbout > 0) {
          sendNotification(locals.subscriptionNotificationTitle, locals.subscriptionNotificationContent(videosToNotifyAbout),
              type: NotificationTypes.subscription, payload: {lastSeenVideo: videos.first.videoId});
        }
      }
    }
  } else {
    print('Subscription notifications not enabled');
  }
}
