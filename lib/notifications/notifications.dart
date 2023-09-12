import 'package:flutter_local_notifications/flutter_local_notifications.dart';

enum NotificationTypes {
  subscriptionNotifications(
      id: 'subscription-notifications',
      description: 'Get notifications about your subscriptions',
      name: 'New subscription videos',
      importance: Importance.low,
      priority: Priority.low);

  final String id, name, description;
  final Importance importance;
  final Priority priority;

  const NotificationTypes(
      {required this.id,
      required this.name,
      required this.description,
      required this.importance,
      required this.priority});
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

void onDidReceiveNotificationResponse(NotificationResponse details) {}

sendNotification(String title, String message, {required NotificationTypes type, String? payload}) async {
  final AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(type.id, type.name,
      channelDescription: type.description, importance: type.importance, priority: type.priority, ticker: 'ticker');
  final NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(
    0,
    title,
    message,
    notificationDetails,
    payload: payload,
  );
}
