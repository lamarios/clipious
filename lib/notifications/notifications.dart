import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/notifications/models/db/subscription_notifications.dart';
import 'package:invidious/router.dart';
import 'package:logging/logging.dart';

final log = Logger('notifications');

const String playlistId = "playlistId",
    lastSeenVideo = "lastSeenVideo",
    channelId = "channelId";

enum NotificationTypes {
  foregroundService(
      id: 'foreground-service',
      description: 'Checks for new videos from sources you selected',
      name: 'Foreground service',
      idSpace: 4000000,
      playSound: false,
      importance: NotificationImportance.Min),
  subscription(
      id: 'subscription-notifications',
      description: 'Get notifications about your subscriptions',
      name: 'New subscription videos',
      idSpace: 1000000),
  channel(
      id: 'channel-notifications',
      description: 'Get notifications from selected channels (bell icon)',
      name: 'Channel new videos',
      idSpace: 2000000),
  playlist(
      id: 'playlist-notifications',
      description: 'Get notification from selected playlists (bell icon)',
      name: 'Playlist new videos',
      idSpace: 3000000);

  final NotificationImportance importance;
  final String id, name, description;
  final bool playSound;

  // to prevent notifications with the same id, when sending notifications this will do idSpace+id
  final int idSpace;

  const NotificationTypes(
      {required this.id,
      required this.name,
      required this.description,
      required this.idSpace,
      this.playSound = true,
      this.importance = NotificationImportance.Default});
}

initializeNotifications() {
  var defaultIcon = 'resource://drawable/app_icon';
  AwesomeNotifications().initialize(
      defaultIcon,
      NotificationTypes.values
          .map((e) => NotificationChannel(
              icon: defaultIcon,
              channelKey: e.id,
              channelName: e.name,
              channelDescription: e.description,
              playSound: e.playSound,
              enableVibration: e.playSound,
              importance: e.importance))
          .toList(),
      debug: kDebugMode);
}

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.payload != null && receivedAction.payload!.isNotEmpty) {
      var payload = receivedAction.payload!;
      if (receivedAction.channelKey == NotificationTypes.channel.id &&
          payload.containsKey(channelId) &&
          payload.containsKey(lastSeenVideo)) {
        log.fine('Launching channel screen ${receivedAction.payload}');
        appRouter.push(ChannelRoute(channelId: payload[channelId]!));
        await fileDb.setChannelNotificationLastViewedVideo(
            payload[channelId]!, payload[lastSeenVideo]!);
      } else if (receivedAction.channelKey == NotificationTypes.playlist.id &&
          payload.containsKey(playlistId)) {
        log.fine('Launching playlist screen ${receivedAction.payload}');
        service.getPublicPlaylists(payload[playlistId]!).then((value) async {
          appRouter
              .push(PlaylistViewRoute(playlist: value, canDeleteVideos: false));
          await fileDb.setPlaylistNotificationLastViewedVideo(
              value.playlistId, value.videoCount);
        });
      } else if (receivedAction.channelKey ==
              NotificationTypes.subscription.id &&
          payload.containsKey(lastSeenVideo)) {
        appRouter.push(const SubscriptionRoute());
        await fileDb.setLastSubscriptionNotification(SubscriptionNotification(
            payload[lastSeenVideo]!, DateTime.now().millisecondsSinceEpoch));
      }
    }
  }
// Your code goes here
}

sendNotification(String title, String message,
    {required NotificationTypes type,
    Map<String, String>? payload,
    int id = 0}) async {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: type.idSpace + id,
          payload: payload,
          channelKey: type.id,
          title: title,
          body: message,
          actionType: ActionType.Default));
}
