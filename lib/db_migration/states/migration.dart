import 'dart:io';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/utils/sembast_sqflite_database.dart';
import 'package:logging/logging.dart';
import 'package:sembast/sembast.dart';

import '../../downloads/models/downloaded_video.dart';
import '../../home/models/db/home_layout.dart';
import '../../notifications/models/db/channel_notifications.dart';
import '../../notifications/models/db/playlist_notifications.dart';
import '../../notifications/models/db/subscription_notifications.dart';
import '../../search/models/db/search_history_item.dart';
import '../../settings/models/db/app_logs.dart';
import '../../settings/models/db/server.dart';
import '../../settings/models/db/settings.dart';
import '../../settings/models/db/video_filter.dart';
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
    try {
      _log.fine('hello ? ');
      late DbClient oboxDb;

      // making sure we start from empty DB
      var sdb = db as SembastSqfDb;
      await sdb.appLogsStore.delete(sdb.db);
      await sdb.downloadedVideosStore.delete(sdb.db);
      await sdb.homeLayoutStore.delete(sdb.db);
      await sdb.searchHistoryStore.delete(sdb.db);
      await sdb.serversStore.delete(sdb.db);
      await sdb.videoFiltersStore.delete(sdb.db);
      await sdb.settingsStore.delete(sdb.db);
      await sdb.deArrowCacheStore.delete(sdb.db);
      await sdb.historyVideoCacheStore.delete(sdb.db);
      await sdb.progressStore.delete(sdb.db);

      // clearing the db first
      // most likely no use for users, but useful to test the migration process
      // multiple times
      oboxDb = await DbClient.create();

      int done = 0;
      int total = 13;

      //check if we have any data
      final store = oboxDb.store;

      final servers = store.box<Server>().getAll();
      for (var s in servers) {
        await db.upsertServer(s);
      }

      done += 1;
      emit(state.copyWith(progress: done / total));

      final downloadedVideos = store.box<DownloadedVideo>().getAll();
      for (var d in downloadedVideos) {
        await db.upsertDownload(d);
      }
      done += 1;
      emit(state.copyWith(progress: done / total));

      final homeLayout = store.box<HomeLayout>().getAll();
      for (var h in homeLayout) {
        await db.upsertHomeLayout(h);
      }

      done += 1;
      emit(state.copyWith(progress: done / total));

      final channelNotification = store.box<ChannelNotification>().getAll();
      for (var c in channelNotification) {
        await fileDb.upsertChannelNotification(c);
      }
      done += 1;
      emit(state.copyWith(progress: done / total));

      final playlistsNotifications = store.box<PlaylistNotification>().getAll();
      for (var p in playlistsNotifications) {
        await fileDb.upsertPlaylistNotification(p);
      }
      done += 1;
      emit(state.copyWith(progress: done / total));

      final subscriptionNotifications =
          store.box<SubscriptionNotification>().getAll();
      for (var s in subscriptionNotifications) {
        await fileDb.setLastSubscriptionNotification(s);
      }
      done += 1;
      emit(state.copyWith(progress: done / total));

      final searchHistoryItems = store.box<SearchHistoryItem>().getAll();
      for (var s in searchHistoryItems) {
        await db.addToSearchHistory(s);
      }

      done += 1;
      emit(state.copyWith(progress: done / total));

      final appLogs = store.box<AppLog>().getAll();
      for (var a in appLogs) {
        await db.insertLogs(a);
      }
      done += 1;
      emit(state.copyWith(progress: done / total));

      final settings = store.box<SettingsValue>().getAll();
      for (var s in settings) {
        await db.saveSetting(s);
      }

      done += 1;
      emit(state.copyWith(progress: done / total));

      final videoFilters = store.box<VideoFilter>().getAll();
      for (var v in videoFilters) {
        await db.saveFilter(v);
      }
      done += 1;
      emit(state.copyWith(progress: done / total));

      final deArrowCache = store.box<DeArrowCache>().getAll();
      for (var d in deArrowCache) {
        await db.upsertDeArrowCache(d);
      }

      done += 1;
      emit(state.copyWith(progress: done / total));

      final history = store.box<HistoryVideoCache>().getAll();
      for (var h in history) {
        await db.upsertHistoryVideo(h);
      }
      done += 1;
      emit(state.copyWith(progress: done / total));

      final progress = store.box<Progress>().getAll();
      for (var p in progress) {
        await db.saveProgress(p);
      }
      done += 1;
      emit(state.copyWith(progress: done / total));

      _log.fine('Migration done');

      var oldDbPath = oboxDb.store.directoryPath;
      oboxDb.close();
      _renameOldDb(oldDbPath);

      db.close();

      while (state.timer > 0) {
        await Future.delayed(
          const Duration(seconds: 1),
          () => emit(state.copyWith(timer: state.timer - 1)),
        );
      }

      exit(0);
    } catch (e) {
      log.severe("Error running migrations", e);
    }
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
