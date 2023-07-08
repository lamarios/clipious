import 'package:flutter_test/flutter_test.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/baseVideo.dart';
import 'package:invidious/models/db/videoFilter.dart';
import 'package:invidious/models/imageObject.dart';

import '../../mocks/db.dart';

class VideoTest extends BaseVideo {
  VideoTest(super.title, super.videoId, super.lengthSeconds, super.author, super.authorId, super.authorUrl, super.videoThumbnails);
}

Future<void> main() async {
  TestDbClient testDbClient = TestDbClient();

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    db = testDbClient;
  });

  group('Video filter tests', () {
    late List<BaseVideo> videos;
    setUp(() {
      videos = [
        VideoTest('video title', 'id1', 1230, 'author1 name rando', 'authorid', 'author1url', <ImageObject>[]),
        VideoTest('short video', 'id1', 60, 'author1 name rando', 'authorid', 'author1url', <ImageObject>[]),
        VideoTest('video from author i dont want', 'id1', 1230, 'author1 i don\'t like', 'authorid', 'author1url', <ImageObject>[]),
        VideoTest('video that matches multiple filters', 'id1', 1230, 'author1 name rando', 'authorid', 'author1url', <ImageObject>[]),
        VideoTest('video 4', 'id1', 1230, 'author1 name rando', 'authorid', 'author1url', <ImageObject>[]),
        VideoTest('video 5', 'id1', 1230, 'author1 name rando', 'authorid', 'author1url', <ImageObject>[])
      ];
    });

    test('single simple string contains filter test', () {
      VideoFilter filter = VideoFilter(value: "title", type:  FilterType.title, operation: FilterOperation.contain);
      testDbClient.videoFilters = [filter];

      VideoFilter.filterVideos(videos);

      expect(videos.where((element) => element.filtered).length, 1);
    });
  });
}
