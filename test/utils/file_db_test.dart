import 'package:flutter_test/flutter_test.dart';
import 'package:clipious/notifications/models/db/channel_notifications.dart';
import 'package:clipious/notifications/models/db/playlist_notifications.dart';
import 'package:clipious/notifications/models/db/subscription_notifications.dart';
import 'package:clipious/utils/file_db.dart';

main() {
  tearDown(() async {
    await FileDB().clearDb();
  });

  test('subscription notification file db', () async {
    FileDB db = FileDB();

    var n = await db.getLastSubscriptionNotification();
    expect(n == null, true);

    await db.setLastSubscriptionNotification(SubscriptionNotification("abc", 123));
    n = await db.getLastSubscriptionNotification();
    expect(n != null, true);
    expect(n!.lastSeenVideoId, "abc");
    expect(n.timestamp, 123);
  });

  test('test playlist notifications file db', () async {
    FileDB db = FileDB();

    var notifs = await db.getAllPlaylistNotifications();
    expect(notifs.isEmpty, true);

    await db.upsertPlaylistNotification(PlaylistNotification("abc", 5, 1234, "My playlist"));
    notifs = await db.getAllPlaylistNotifications();
    expect(notifs.length, 1);

    var n = await db.getPlaylistNotification("abc");
    expect(n != null, true);
    expect(n!.playlistId, "abc");
    expect(n.lastVideoCount, 5);
    expect(n.timestamp, 1234);
    expect(n.playlistName, "My playlist");

    // we shouldn't be able to change the playlistId
    n.lastVideoCount = 6;
    n.timestamp = 1235;
    n.playlistName = "new name";

    await db.upsertPlaylistNotification(n);

    // making sure we're not creating new entries on edit
    notifs = await db.getAllPlaylistNotifications();
    expect(notifs.length, 1);



    n = await db.getPlaylistNotification("abc");
    expect(n != null, true);
    expect(n!.playlistId, "abc");
    expect(n.lastVideoCount, 6);
    expect(n.timestamp, 1235);
    expect(n.playlistName, "new name");

    // testing the method to directly set video count
    await db.setPlaylistNotificationLastViewedVideo("abc", 7);
    n = await db.getPlaylistNotification("abc");
    expect(n != null, true);
    expect(n!.playlistId, "abc");
    expect(n.lastVideoCount, 7);
    // not testing timestamp as it is set by the method
    expect(n.playlistName, "new name");

    // i can have more than one notifications
    var newNotif = PlaylistNotification("123", 123, 123, "another playlist");
    await db.upsertPlaylistNotification(newNotif);

    notifs = await db.getAllPlaylistNotifications();
    expect(notifs.length, 2);

    //we should be able to get notifications separately if there are more than one
    n = await db.getPlaylistNotification("123");
    expect(n != null, true);
    expect(n!.playlistId, "123");

    n = await db.getPlaylistNotification("abc");
    expect(n != null, true);
    expect(n!.playlistId, "abc");

    // we remove everything to test
    await db.deletePlaylistNotification(n);
    await db.deletePlaylistNotification(newNotif);

    notifs = await db.getAllPlaylistNotifications();
    expect(notifs.length, 0);

    // i should be able to try to delete something that doesn't exist without problem
    await db.deletePlaylistNotification(PlaylistNotification("anotherid", 123, 123, "oops"));
  });

  test('Channel notifications', () async {
    FileDB db = FileDB();

    var notifs = await db.getAllChannelNotifications();
    expect(notifs.isEmpty, true);

    await db.upsertChannelNotification(ChannelNotification("abc", "channel1", "abc", 123));
    notifs = await db.getAllChannelNotifications();
    expect(notifs.length, 1);

    var n = await db.getChannelNotification("abc");
    expect(n != null, true);
    expect(n!.channelId, "abc");
    expect(n.lastSeenVideoId, "abc");
    expect(n.timestamp, 123);
    expect(n.channelName, "channel1");

    // we shouldn't be able to change the playlistId
    n.lastSeenVideoId = "def";
    n.timestamp = 1235;
    n.channelName = "new channel1";

    await db.upsertChannelNotification(n);

    // making sure we're not creating new entries on edit
    notifs = await db.getAllChannelNotifications();
    expect(notifs.length, 1);

    n = await db.getChannelNotification("abc");
    expect(n != null, true);
    expect(n!.channelId, "abc");
    expect(n.lastSeenVideoId, "def");
    expect(n.timestamp, 1235);
    expect(n.channelName, "new channel1");


    // testing the method to directly set video count
    await db.setChannelNotificationLastViewedVideo("abc", "aaa");
    n = await db.getChannelNotification("abc");
    expect(n != null, true);
    expect(n!.channelId, "abc");
    expect(n.lastSeenVideoId, "aaa");
    expect(n.channelName, "new channel1");

    // i can have more than one notifications
    var newNotif = ChannelNotification("abcd", "channel1", "abc", 123);
    await db.upsertChannelNotification(newNotif);

    // i should be able to get all notifs properly if there's more than 1
    n = await db.getChannelNotification("abcd");
    expect(n != null, true);
    expect(n!.channelId, "abcd");

    // we try the first one again
    n = await db.getChannelNotification("abc");
    expect(n != null, true);
    expect(n!.channelId, "abc");

    notifs = await db.getAllChannelNotifications();
    expect(notifs.length, 2);

    // we remove everything to test
    await db.deleteChannelNotification(n);
    await db.deleteChannelNotification(newNotif);

    notifs = await db.getAllChannelNotifications();
    expect(notifs.length, 0);

    // i should be able to try to delete something that doesn't exist without problem
    await db.deleteChannelNotification(ChannelNotification("fdafa", "channelNamefdsfas", "fsdfsdf", 1313));
  });
}
