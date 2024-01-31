import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/downloads/states/download_manager.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/home/models/db/home_layout.dart';
import 'package:invidious/player/states/player.dart';
import 'package:invidious/service.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/videos/models/dislike.dart';
import 'package:invidious/videos/states/video.dart';
import 'package:mockito/annotations.dart';

import '../../test_app_cubit.dart';
import '../../test_player_cubit.dart';
import '../../test_settings_cubit.dart';
import '../../utils/server.dart';
import 'package:nock/nock.dart';

class FakeService extends Service {
  @override
  Future<Dislike> getDislikes(String videoId) async {
    throw Error();
  }
}

void main() {
  setUp(() async {
    await setUpTestsForTestServer();
  });

  tearDown(() async {
    await cleanUpTestServer();
    // nock.cleanAll();
  });

  group('Youtube dislike', () {
    test('If youtube dislike is down, it should not break the video loading', () async {
      try {
        // using service that will fail on dislikes
        service = FakeService();

        bool loggedIn = await service.isLoggedIn();
        var settingsCubit = TestSettingsCubit(SettingsState.init(), TestAppCubit(AppState(0, null, HomeLayout())));

        // using youtube dislikes
        await settingsCubit.setUseReturnYoutubeDislike(true);

        PlayerCubit player = TestPlayerCubit(PlayerState(playQueue: ListQueue()), settingsCubit);
        var video = VideoCubit(VideoState(videoId: 'dQw4w9WgXcQ', isLoggedIn: loggedIn), DownloadManagerCubit(const DownloadManagerState(), player), player, settingsCubit);
        await video.onReady();

        // we shouldn't have any errors that would override displaying video info properly
        expect(video.state.error, '');
      } finally {
        service = Service();
      }
    });
  });
}
