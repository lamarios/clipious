import 'package:flutter_test/flutter_test.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/videos/states/add_to_playlist.dart';

import '../../utils/server.dart';

void main() {
  setUp(() async => setUpTestsForTestServer());

  tearDown(() async => await cleanUpTestServer());

  test('like video', () async {
    const videoId = 'dQw4w9WgXcQ';
    var cubit = AddToPlaylistCubit(const AddToPlaylistController(videoId));
    await cubit.onReady();
    expect(cubit.state.playlists.length, 0);
    expect(cubit.state.playListCount, 0);
    expect(cubit.state.isVideoLiked, false);

    await cubit.toggleLike();
    await cubit.onReady();
    // liking a video, should create the like playlist if it does not exist
    expect(cubit.state.playlists.length, 1);
    expect(cubit.state.playlists.any((element) => element.title == likePlaylistName), true);
    expect(cubit.state.playListCount, 1);
    expect(cubit.state.isVideoLiked, true);

    await cubit.toggleLike();
    await cubit.onReady();

    expect(cubit.state.playlists.length, 1);
    expect(cubit.state.playlists.any((element) => element.title == likePlaylistName), true);
    expect(cubit.state.playListCount, 0);
    expect(cubit.state.isVideoLiked, false);
  });

  test('add to playlist ', () async {
    // creating a new playlist
    await service.createPlayList("test playlist", "public");

    const videoId = 'dQw4w9WgXcQ';
    var cubit = AddToPlaylistCubit(const AddToPlaylistController(videoId));
    await cubit.onReady();
    expect(cubit.state.playlists.length, 1);
    expect(cubit.state.playListCount, 0);
    expect(cubit.state.isVideoLiked, false);

    await cubit.addToPlaylist(cubit.state.playlists.first.playlistId);
    await cubit.onReady();

    expect(cubit.state.playlists.length, 1);
    expect(cubit.state.playListCount, 1);
    expect(cubit.state.isVideoLiked, false);


  });
}
