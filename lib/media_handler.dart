import 'package:audio_service/audio_service.dart';
import 'package:invidious/player/states/player.dart';

class MediaHandler extends BaseAudioHandler
    with
        QueueHandler, // mix in default queue callback implementations
        SeekHandler {
  final PlayerCubit controller;

  MediaHandler(this.controller);

  // mix in default seek callback implementations

  // The most common callbacks:
  @override
  Future<void> play() async {
    // All 'play' requests from all origins route to here. Implement this
    // callback to start playing audio appropriate to your app. e.g. music
    controller.play();
  }

  @override
  Future<void> pause() async {
    controller.pause();
  }

  @override
  Future<void> stop() async {
    controller.hide();
  }

  @override
  Future<void> seek(Duration position) async {
    controller.seek(position);
  }

  @override
  Future<void> skipToNext() async {
    controller.playNext();
  }

  @override
  Future<void> skipToPrevious() async {
    controller.playPrevious();
  }

  @override
  Future<void> fastForward() async {
    controller.fastForward();
  }

  @override
  Future<void> rewind() async {
    controller.rewind();
  }

  @override
  Future<void> skipToQueueItem(int index) async {
    var item = await controller.getMediaItem(index);
    mediaItem.add(item);
  }
}
