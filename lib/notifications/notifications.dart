import 'dart:ffi';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:logging/logging.dart';

const openChannel = "open-channel";
const openSubscriptions = "open-subscriptions";
const openPublicPlaylist = "open-public-playlist";

final log = Logger('notifications');

enum NotificationTypes {
  subscriptionNotifications(
      id: 'subscription-notifications',
      description: 'Get notifications about your subscriptions',
      name: 'New subscription videos',
      importance: Importance.low,
      priority: Priority.low,
      actions: [],
      payloadPrefix: openSubscriptions),
  channelNotification(
      id: 'channel-notifications',
      description: 'Get notifications from selected channels (bell icon)',
      name: 'Channel new videos',
      importance: Importance.low,
      priority: Priority.low,
      actions: [],
      payloadPrefix: openChannel),
  playlistNotification(
      id: 'playlist-notifications',
      description: 'Get notification from selected playlists (bell icon)',
      name: 'Playlist new videos',
      importance: Importance.low,
      priority: Priority.low,
      actions: [],
      payloadPrefix: openPublicPlaylist);

  final String id, name, description;
  final Importance importance;
  final Priority priority;
  final String payloadPrefix;
  final List<AndroidNotificationAction> actions;

  const NotificationTypes(
      {required this.id,
      required this.name,
      required this.description,
      required this.importance,
      required this.priority,
      required this.actions,
      required this.payloadPrefix});
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> initializeNotifications() async {
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
}

void onNotificationAppLaunch() {
  // checking if the app was launched from a notification
  flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails().then((details) {
    log.info("App started by notification with payload: ${details?.notificationResponse?.payload}");
    if (details?.notificationResponse != null) {
      onDidReceiveNotificationResponse(details!.notificationResponse!);
    }
  });
}

void onDidReceiveNotificationResponse(NotificationResponse details) {
  if (details.payload != null && details.payload!.isNotEmpty) {
    var split = details.payload!.split(":");
    switch (split[0]) {
      case openChannel:
        log.fine('Launching channel screen ${details.payload}, navigator state: ${navigatorKey.currentState}');
        navigatorKey.currentState?.pushNamed(PATH_CHANNEL, arguments: split[1]);
        break;
      case openPublicPlaylist:
        log.fine('Launching playlist screen ${details.payload}, navigator state: ${navigatorKey.currentState}');
        service
            .getPublicPlaylists(split[1])
            .then((value) => navigatorKey.currentState?.pushNamed(pathPublicPlaylist, arguments: value));
        break;
      case openSubscriptions:
        navigatorKey.currentState?.pushNamed(pathSubscriptions);
        break;
    }
  }
}

sendNotification(String title, String message, {required NotificationTypes type, String? payload, int id = 0}) async {
  final AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(type.id, type.name,
      channelDescription: type.description,
      importance: type.importance,
      priority: type.priority,
      autoCancel: true,
      shortcutId: "test",
      ticker: 'ticker',
      actions: type.actions);

  final NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(
    id,
    title,
    message,
    notificationDetails,
    payload: payload != null ? '${type.payloadPrefix}:$payload' : null,
  );
}
