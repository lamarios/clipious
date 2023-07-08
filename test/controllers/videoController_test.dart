import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invidious/controllers/videoController.dart';
import 'package:invidious/globals.dart';
import 'package:logging/logging.dart';

import '../mocks/db.dart';
import '../mocks/service.dart';

const videoControllerTestVideoId = 'videoControllerId';
const videoControllerTestVideoIdFailed = 'videoControllerIdFailed';

Future<void> main() async {
  late VideoController _;

  setUpAll(
    () {
      Logger.root.level = Level.FINEST; // defaults to Level.INFO
      Logger.root.onRecord.listen((record) {
        debugPrint('[${record.level.name}] [${record.loggerName}] ${record.message}');
      });
      TestWidgetsFlutterBinding.ensureInitialized();
      db = TestDbClient();
      setClient();
    },
  );

  group('Video controller tests', () {
    setUp(() async {
      _ = VideoController(videoId: videoControllerTestVideoId);
      await _.onReady();
    });

    test('we can load a video', () async {
      expect(_.video, isNotNull);
      expect(_.video!.title, contains('EVGA'));
    });

    test('toggle play recommendation', () {
      bool current = _.playRecommendedNext;
      _.togglePlayRecommendedNext(true);

      expect(_.playRecommendedNext, true);

      _.togglePlayRecommendedNext(false);
      expect(_.playRecommendedNext, false);
    });
  });

  group('Video controller with failed video', () {
    test('we have a proper error recorded', () async {
      _ = VideoController(videoId: videoControllerTestVideoIdFailed);
      try {
        await _.onReady();
        fail("we shouldn't reach here as the loading is supposed to fail");
      } catch (e) {
        expect(_.error, "video not available in your country");
      }
    });
  });
}
