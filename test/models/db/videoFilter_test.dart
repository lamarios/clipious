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
        VideoTest('video title', 'id1', 1230, 'author1 name rando', 'authorid3', 'author1url', <ImageObject>[]),
        VideoTest('short video', 'id1', 60, 'author1 name rando', 'authorid2', 'author1url', <ImageObject>[]),
        VideoTest('video from author i dont want', 'id1', 1230, 'author1 i don\'t like', 'authorid', 'author1url', <ImageObject>[]),
        VideoTest('video that matches multiple filters', 'id1', 1230, 'author1 name rando', 'authorid', 'author1url', <ImageObject>[]),
        VideoTest('video 4', 'id1', 1230, 'author1 name rando', 'authorid4', 'author1url', <ImageObject>[]),
        VideoTest('video 5', 'id1', 1230, 'author1 name rando', 'authorid4', 'author1url', <ImageObject>[])
      ];
    });

    test('video title contains', () {
      VideoFilter filter = VideoFilter(value: "title", type: FilterType.title, operation: FilterOperation.contain);
      testDbClient.videoFilters = [filter];

      VideoFilter.filterVideos(videos);

      expect(videos.where((element) => element.filtered).length, 1);
    });

    test('video title does not contain', () {
      VideoFilter filter = VideoFilter(value: "title", type: FilterType.title, operation: FilterOperation.notContain);
      testDbClient.videoFilters = [filter];

      VideoFilter.filterVideos(videos);

      expect(videos.where((element) => element.filtered).length, 5);
    });

    test('video channel contains', () {
      VideoFilter filter = VideoFilter(value: "i don\'t like", type: FilterType.channelName, operation: FilterOperation.contain);
      testDbClient.videoFilters = [filter];

      VideoFilter.filterVideos(videos);

      expect(videos.where((element) => element.filtered).length, 1);
    });

    test('video channel does not contain', () {
      VideoFilter filter = VideoFilter(value: "i don\'t like", type: FilterType.channelName, operation: FilterOperation.notContain);
      testDbClient.videoFilters = [filter];

      VideoFilter.filterVideos(videos);

      expect(videos.where((element) => element.filtered).length, 5);
    });

    test('video length lower than', () {
      VideoFilter filter = VideoFilter(value: "61", type: FilterType.length, operation: FilterOperation.lowerThan);
      testDbClient.videoFilters = [filter];

      VideoFilter.filterVideos(videos);

      expect(videos.where((element) => element.filtered).length, 1);
    });

    test('video length higher than', () {
      VideoFilter filter = VideoFilter(value: "61", type: FilterType.length, operation: FilterOperation.higherThan);
      testDbClient.videoFilters = [filter];

      VideoFilter.filterVideos(videos);

      expect(videos.where((element) => element.filtered).length, 5);
    });

    test('multiple filter behavior', () {
      // exclude video shorter than 61 secs
      VideoFilter filter = VideoFilter(value: "61", type: FilterType.length, operation: FilterOperation.lowerThan);
      // exclude videos that do not contain title in their names
      VideoFilter filter2 = VideoFilter(value: "title", type: FilterType.title, operation: FilterOperation.notContain);
      testDbClient.videoFilters = [filter, filter2];

      VideoFilter.filterVideos(videos);

      expect(videos.where((element) => element.filtered).length, 5);
    });

    test('hide filter test', () {
      VideoFilter filter = VideoFilter(value: "i don\'t like", type: FilterType.channelName, operation: FilterOperation.contain);
      filter.hideFromFeed = true;
      testDbClient.videoFilters = [filter];

      VideoFilter.filterVideos(videos);

      expect(videos.length, 5);
    });

    test('whole channel filter', () {
      VideoFilter filter = VideoFilter(value: "61");
      filter.channelId = 'authorid4';
      filter.filterAll = true;
      testDbClient.videoFilters = [filter];
      VideoFilter.filterVideos(videos);

      expect(videos.where((element) => element.filtered).length, 2);
    });

    test('filter videos on a specific channel only', (){
      VideoFilter filter = VideoFilter(value: "title", type: FilterType.title, operation: FilterOperation.notContain);
      filter.channelId = 'authorid4';

      testDbClient.videoFilters = [filter];

      VideoFilter.filterVideos(videos);

      expect(videos.where((element) => element.filtered).length, 2);
    });
  });
}
