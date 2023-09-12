import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/notifications/models/db/subscription_notifications.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/videos/models/video_in_list.dart';
import 'package:logging/logging.dart';

import 'notifications/notifications.dart';

final backgroundService = FlutterBackgroundService();

final log = Logger('Background service');

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

  Timer.periodic(const Duration(seconds: 10), (timer) {
    print('test');
    _backgroundCheck();
  });
}

_backgroundCheck() async {
  try {
    db = await DbClient.create();
    print('we have a db ${db.isClosed}');
    await _handleSubscriptionsNotifications();
  } catch (e) {
    if (e is StateError) {
      print('app is likely running, we don\'t do anything: ${e.message}, global client ? ${db.isClosed}');
    } else {
      print('we have a background service error: ${e}');
    }
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

_handleSubscriptionsNotifications() async {
  bool isEnabled = db.getSettings(SUBSCRIPTION_NOTIFICATIONS)?.value == 'true';
  if (isEnabled) {
    final lastNotification = db.getLastSubscriptionNotification();
    print('getting feed...');
    var feed = await service.getUserFeed(maxResults: 100);

    List<VideoInList> videos = [];
    videos.addAll(feed.videos ?? []);
    videos.addAll(feed.notifications ?? []);

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
          videosToNotifyAbout = videos.length - 1 - index;
        }

        var locals = await getLocalization();

        print('$videosToNotifyAbout videos to notify about');
        if (videosToNotifyAbout > 0) {
          sendNotification(
              locals.subscriptionNotificationTitle, locals.subscriptionNotificationContent(videosToNotifyAbout),
              type: NotificationTypes.subscriptionNotifications);
        }
      }
    }
  } else {
    print('Subscription notifications not enabled');
  }
}
