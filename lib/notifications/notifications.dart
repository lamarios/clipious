import 'dart:ffi';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:invidious/main.dart';
import 'package:invidious/myRouteObserver.dart';

const openChannel = "open-channel";
const openSubscriptions = "open-subscriptions";

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
      payloadPrefix: openChannel);

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

void onDidReceiveNotificationResponse(NotificationResponse details) {
  if (details.payload != null && details.payload!.isNotEmpty) {
    var split = details.payload!.split(":");
    switch (split[0]) {
      case openChannel:
        navigatorKey.currentState?.pushNamed(PATH_CHANNEL, arguments: split[1]);
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
