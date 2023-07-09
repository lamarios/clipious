import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/video.dart';
import 'package:logging/logging.dart';
import '../controllers/videoController_test.dart';
import '../mocks/db.dart';
import '../mocks/service.dart';
import '../test_utils.dart';

Future<void> main() async {
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

  testWidgets('Test video widget', (tester) async {
    await tester.pumpWidget(const LocalizedTest(
      child: VideoView(
        videoId: videoControllerTestVideoId,
      ),
    ));
    final loadingFinder = find.byType(CircularProgressIndicator);

    expect(loadingFinder, findsOneWidget);

/*
    await tester.runAsync(() async {
      await tester.pumpAndSettle(Duration(milliseconds: 100), EnginePhase.paint, Duration(minutes: 1));
      final titleFinder = find.text('EVGA');

      expect(titleFinder, findsWidgets);
    });
*/

  });
}
