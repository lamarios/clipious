import 'dart:async';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/notifications/models/db/subscription_notifications.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/videos/models/video_in_list.dart';
import 'package:logging/logging.dart';

import 'notifications/notifications.dart';

final backgroundService = FlutterBackgroundService();

final log = Logger('Background service');

// const debugMode = kDebugMode;
const debugMode = true;

void configureBackgroundService(SettingsCubit settings) {
  backgroundService.configure(
      iosConfiguration: IosConfiguration(),
      androidConfiguration: AndroidConfiguration(
          onStart: onStart,
          autoStart: settings.state.backgroundNotifications,
          autoStartOnBoot: settings.state.backgroundNotifications,
          isForegroundMode: false));
}

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
    print('Background service stopped');
    service.stopSelf();
  });

  Timer.periodic(debugMode ? const Duration(seconds: 60) : const Duration(hours: 2), (timer) {
    print('back ground service running');
    _backgroundCheck();
  });
}

_backgroundCheck() async {
  try {
    db = await DbClient.create();
    print('we have a db ${db.isClosed}');
    await _handleSubscriptionsNotifications();
    await _handleChannelNotifications();
    await _handlePlaylistNotifications();
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
  Locale locale =
      Locale.fromSubtags(languageCode: localeString[0], scriptCode: localeString.length >= 2 ? localeString[1] : null);

  return await AppLocalizations.delegate.load(locale);
}

_handlePlaylistNotifications() async {
  var notifs = db.getAllPlaylistNotifications();
  print('Watching ${notifs.length} playlists');
  for (var n in notifs) {
    // we get the latest video,
    var videos = await service.getPublicPlaylists(n.playlistId);

    if ((videos.videos ?? []).isNotEmpty) {
      if (n.lastVideoCount > 0) {
        // if in list, we calculate
        int videosToNotifyAbout = n.lastVideoCount - videos.videoCount;

        // if not we tell that list.size+ new videos are available
        var locals = await getLocalization();

        print('$videosToNotifyAbout videos from playlist ${n.playlistName} to notify about');
        if (debugMode || videosToNotifyAbout > 0) {
          sendNotification(locals.playlistNotificationTitle(n.playlistName),
              locals.playlistNotificationContent(n.playlistName, videosToNotifyAbout),
              type: NotificationTypes.playlistNotification, payload: n.playlistId, id: n.id);
        }
      }

      n.lastVideoCount = videos.videoCount;
      n.timestamp = DateTime.now().millisecondsSinceEpoch;
      db.upsertPlaylistNotification(n);
    }
  }
}

_handleChannelNotifications() async {
  var notifs = db.getAllChannelNotifications();

  print('Watching ${notifs.length} channels');
  for (var n in notifs) {
    // we get the latest video,
    var videos = await service.getChannelVideos(n.channelId, null);

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
          sendNotification(locals.channelNotificationTitle(n.channelName),
              locals.channelNotificationContent(n.channelName, videosToNotifyAbout),
              type: NotificationTypes.channelNotification, payload: n.channelId, id: n.id);
        }
      }

      n.lastSeenVideoId = videos.videos.first.videoId;
      n.timestamp = DateTime.now().millisecondsSinceEpoch;
      db.upsertChannelNotification(n);
    }
  }
}

_handleSubscriptionsNotifications() async {
  bool isEnabled = db.getSettings(SUBSCRIPTION_NOTIFICATIONS)?.value == 'true';
  if (isEnabled && db.isLoggedInToCurrentServer()) {
    // we need to get the last notification before we call the feed endpoint as it is going to save the last seen video
    final lastNotification = db.getLastSubscriptionNotification();
    print('getting feed...');
    var feed = await service.getUserFeed(maxResults: 100);

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
          sendNotification(
              locals.subscriptionNotificationTitle, locals.subscriptionNotificationContent(videosToNotifyAbout),
              type: NotificationTypes.subscriptionNotifications, payload: '');
        }
      }
    }
  } else {
    print('Subscription notifications not enabled');
  }
}
