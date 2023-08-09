import 'package:get/get.dart';
import 'package:invidious/models/baseVideo.dart';
import 'package:invidious/models/videoComments.dart';

import '../globals.dart';
import '../models/errors/invidiousServiceError.dart';

class CommentsViewController extends GetxController {
  final BaseVideo video;
  bool loadingComments = true;
  late VideoComments comments;
  bool continuationLoaded = false;
  String? continuation;
  String error = '';
  String? source;
  String? sortBy;

  CommentsViewController({required this.video, this.continuation, this.source, this.sortBy}) {
    comments = VideoComments(0, video.videoId, '', []);
  }

  @override
  onReady() {
    super.onReady();
    getComments();
  }

  loadMore() async {
    loadingComments = true;
    update();
    VideoComments comments = await service.getComments(video.videoId, continuation: continuation);

    this.comments.comments.addAll(comments.comments);
    continuation = comments.continuation;
    loadingComments = false;
    update();
  }

  getComments() async {
    error = '';
    loadingComments = true;
    this.comments = VideoComments(0, video.videoId, '', []);
    update();

    try {
      VideoComments comments = await service.getComments(video.videoId, continuation: continuation, sortBy: sortBy, source: source);
      this.comments = comments;
      loadingComments = false;
      continuation = comments.continuation;
      update();
    } catch (err) {
      if (err is InvidiousServiceError) {
        error = err.message;
        update();
      } else {
        error = err.toString();
        update();
        rethrow;
      }
    }
  }
}
