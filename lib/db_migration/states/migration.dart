import 'dart:io';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

import '../../downloads/models/downloaded_video.dart';
import '../../globals.dart';
import '../../home/models/db/home_layout.dart';
import '../../notifications/models/db/channel_notifications.dart';
import '../../notifications/models/db/playlist_notifications.dart';
import '../../notifications/models/db/subscription_notifications.dart';
import '../../search/models/db/search_history_item.dart';
import '../../settings/models/db/app_logs.dart';
import '../../settings/models/db/server.dart';
import '../../settings/models/db/settings.dart';
import '../../settings/models/db/video_filter.dart';
import '../../utils/isar_database.dart';
import '../../utils/obox_database.dart';
import '../../videos/models/db/dearrow_cache.dart';
import '../../videos/models/db/history_video_cache.dart';
import '../../videos/models/db/progress.dart';

part 'migration.freezed.dart';

final _log = Logger('DbMigrationCubit');

class DbMigrationCubit extends Cubit<DbMigrationState> {
  DbMigrationCubit(super.initialState) {
    init();
  }

  init() {
    // we don't want the user to be able to exit while the DB is migrating
    BackButtonInterceptor.add((stopDefaultButtonEvent, RouteInfo routeInfo) {
      return true;
    }, name: 'migrationInterceptor', zIndex: 0, ifNotYetIntercepted: true);
    migrateDb();
  }

  migrateDb() async {
    late DbClient oboxDb;
    var isarDb = db as IsarDb;

    // clearing the db first
    // most likely no use for users, but useful to test the migration process
    // multiple times
    isarDb.isar.writeTxn(() async {
      oboxDb = await DbClient.create();

      await isarDb.isar.clear();
      int done = 0;
      int total = 13;

      //check if we have any data
      final store = oboxDb.store;

      final servers = store.box<Server>().getAll();
      await isarDb.isar.servers.putAll(servers);
      done += 1;
      emit(state.copyWith(progress: done / total));

      final downloadedVideos = store.box<DownloadedVideo>().getAll();
      await isarDb.isar.downloadedVideos.putAll(downloadedVideos);
      done += 1;
      emit(state.copyWith(progress: done / total));

      final homeLayout = store.box<HomeLayout>().getAll();
      await isarDb.isar.homeLayouts.putAll(homeLayout);
      done += 1;
      emit(state.copyWith(progress: done / total));

      final channelNotification = store.box<ChannelNotification>().getAll();
      await isarDb.isar.channelNotifications.putAll(channelNotification);
      done += 1;
      emit(state.copyWith(progress: done / total));

      final playlistsNotifications = store.box<PlaylistNotification>().getAll();
      await isarDb.isar.playlistNotifications.putAll(playlistsNotifications);
      done += 1;
      emit(state.copyWith(progress: done / total));

      final subscriptionNotifications =
          store.box<SubscriptionNotification>().getAll();
      await isarDb.isar.subscriptionNotifications
          .putAll(subscriptionNotifications);
      done += 1;
      emit(state.copyWith(progress: done / total));

      final searchHistoryItems = store.box<SearchHistoryItem>().getAll();
      await isarDb.isar.searchHistoryItems.putAll(searchHistoryItems);
      done += 1;
      emit(state.copyWith(progress: done / total));

      final appLogs = store.box<AppLog>().getAll();
      await isarDb.isar.appLogs.putAll(appLogs);
      done += 1;
      emit(state.copyWith(progress: done / total));

      final settings = store.box<SettingsValue>().getAll();
      await isarDb.isar.settingsValues.putAll(settings);
      done += 1;
      emit(state.copyWith(progress: done / total));

      final videoFilters = store.box<VideoFilter>().getAll();
      await isarDb.isar.videoFilters.putAll(videoFilters);
      done += 1;
      emit(state.copyWith(progress: done / total));

      final deArrowCache = store.box<DeArrowCache>().getAll();
      await isarDb.isar.deArrowCaches.putAll(deArrowCache);
      done += 1;
      emit(state.copyWith(progress: done / total));

      final history = store.box<HistoryVideoCache>().getAll();
      await isarDb.isar.historyVideoCaches.putAll(history);
      done += 1;
      emit(state.copyWith(progress: done / total));

      final progress = store.box<Progress>().getAll();
      await isarDb.isar.progress.putAll(progress);
      done += 1;
      emit(state.copyWith(progress: done / total));

      _log.fine('Migration done');

      var oldDbPath = oboxDb.store.directoryPath;
      oboxDb.close();
      _renameOldDb(oldDbPath);
    });
    isarDb.close();

    while (state.timer > 0) {
      await Future.delayed(
        const Duration(seconds: 1),
        () => emit(state.copyWith(timer: state.timer - 1)),
      );
    }

    exit(0);
  }

  _renameOldDb(String oldPath) {
    var db = Directory(oldPath);
    db.renameSync('$oldPath-old');
  }
}

@freezed
class DbMigrationState with _$DbMigrationState {
  const factory DbMigrationState(
      {@Default(0) double progress,
      @Default(10) int timer}) = _DbMigrationState;
}
