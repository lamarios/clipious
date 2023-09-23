import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logging/logging.dart';

import '../globals.dart';
import '../router.dart';
import 'models/db/subscription_notifications.dart';

final log = Logger('notifications');

const String playlistId = "playlistId", lastSeenVideo = "lastSeenVideo", channelId = "channelId";

enum NotificationTypes {
  foregroundService(
      id: 'foreground-service', description: 'Checks for new videos from sources you selected', name: 'Foreground service', idSpace: 4000000, playSound: false, importance: Importance.low),
  subscription(id: 'subscription-notifications', description: 'Get notifications about your subscriptions', name: 'New subscription videos', idSpace: 1000000),
  channel(id: 'channel-notifications', description: 'Get notifications from selected channels (bell icon)', name: 'Channel new videos', idSpace: 2000000),
  playlist(id: 'playlist-notifications', description: 'Get notification from selected playlists (bell icon)', name: 'Playlist new videos', idSpace: 3000000);

  final Importance importance;
  final String id, name, description;
  final bool playSound;

  // to prevent notifications with the same id, when sending notifications this will do idSpace+id
  final int idSpace;

  int getId(int id) {
    return idSpace + id;
  }

  const NotificationTypes({required this.id, required this.name, required this.description, required this.idSpace, this.playSound = true, this.importance = Importance.defaultImportance});
}

final FlutterLocalNotificationsPlugin notifications = FlutterLocalNotificationsPlugin();

initializeNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await notifications.initialize(initializationSettings, onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);

  for (var channel in NotificationTypes.values) {
    notifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(AndroidNotificationChannel(channel.id, channel.name, importance: channel.importance, playSound: channel.playSound, description: channel.description));
  }
}

void onDidReceiveNotificationResponse(NotificationResponse details) {
  if (details.payload != null) {
    Map<String, String> payload = Map.castFrom(jsonDecode(details.payload!));
    NotificationTypes type = NotificationTypes.values.firstWhere((element) => element.id == payload['type']);
    switch (type) {
      case NotificationTypes.channel:
        log.fine('Launching channel screen $payload');
        appRouter.push(ChannelRoute(channelId: payload[channelId]!));
        db.setChannelNotificationLastViewedVideo(payload[channelId]!, payload[lastSeenVideo]!);
        break;
      case NotificationTypes.playlist:
        log.fine('Launching playlist screen $payload');
        service.getPublicPlaylists(payload[playlistId]!).then((value) {
          appRouter.push(PlaylistViewRoute(playlist: value, canDeleteVideos: false));
          db.setPlaylistNotificationLastViewedVideo(value.playlistId, value.videoCount);
        });
        break;
      case NotificationTypes.subscription:
        appRouter.push(const SubscriptionRoute());
        db.setLastSubscriptionNotification(SubscriptionNotification(payload[lastSeenVideo]!, DateTime.now().millisecondsSinceEpoch));
        break;
      default:
        return;
    }
  }
}

/*
class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    print("notification tapped ${receivedAction.payload} ");
    if (receivedAction.payload != null && receivedAction.payload!.isNotEmpty) {
      var payload = receivedAction.payload!;
      if (receivedAction.channelKey == NotificationTypes.channel.id && payload.containsKey(channelId) && payload.containsKey(lastSeenVideo)) {
        log.fine('Launching channel screen ${receivedAction.payload}');
        appRouter.push(ChannelRoute(channelId: payload[channelId]!));
        db.setChannelNotificationLastViewedVideo(payload[channelId]!, payload[lastSeenVideo]!);
      } else if (receivedAction.channelKey == NotificationTypes.playlist.id && payload.containsKey(playlistId)) {
        log.fine('Launching playlist screen ${receivedAction.payload}');
        service.getPublicPlaylists(payload[playlistId]!).then((value) {
          appRouter.push(PlaylistViewRoute(playlist: value, canDeleteVideos: false));
          db.setPlaylistNotificationLastViewedVideo(value.playlistId, value.videoCount);
        });
      } else if (receivedAction.channelKey == NotificationTypes.subscription.id && payload.containsKey(lastSeenVideo)) {
        appRouter.push(const SubscriptionRoute());
        db.setLastSubscriptionNotification(SubscriptionNotification(payload[lastSeenVideo]!, DateTime
            .now()
            .millisecondsSinceEpoch));
      }
    }
  }
// Your code goes here
}
*/

sendNotification(String title, String message, {required NotificationTypes type, Map<String, String>? payload, int id = 0}) async {
  final AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(type.id, type.name, channelDescription: type.description, importance: type.importance, priority: Priority.defaultPriority, ticker: 'ticker');
  NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

  payload?.putIfAbsent("type", () => type.id);

  await notifications.show(type.getId(id), title, message, notificationDetails, payload: payload != null ? json.encode(payload) : '');
}
