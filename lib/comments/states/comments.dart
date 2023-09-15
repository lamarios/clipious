import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:invidious/comments/models/video_comments.dart';
import 'package:invidious/videos/models/base_video.dart';

import '../../globals.dart';
import '../../settings/models/errors/invidiousServiceError.dart';

part 'comments.g.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit(super.initialState) {
    onReady();
  }

  onReady() {
    getComments();
  }

  loadMore() async {
    var state = this.state.copyWith();
    state.loadingComments = true;
    emit(state);

    state = this.state.copyWith();
    VideoComments comments = await service.getComments(state.video.videoId, continuation: state.continuation);

    state.comments.comments.addAll(comments.comments);
    state.continuation = comments.continuation;
    state.loadingComments = false;
    emit(state);
  }

  getComments() async {
    var state = this.state.copyWith();
    state.error = '';
    state.loadingComments = true;
    state.comments = VideoComments(0, state.video.videoId, '', []);
    emit(state);

    state = this.state.copyWith();

    try {
      VideoComments comments = await service.getComments(state.video.videoId,
          continuation: state.continuation, sortBy: state.sortBy, source: state.source);
      state.comments = comments;
      state.loadingComments = false;
      state.continuation = comments.continuation;
      emit(state);
    } catch (err) {
      state = this.state.copyWith();
      if (err is InvidiousServiceError) {
        state.error = err.message;
        emit(state);
      } else {
        state.error = err.toString();
        emit(state);
        rethrow;
      }
    }
  }
}

@CopyWith(constructor: "_")
class CommentsState {
  final BaseVideo video;
  bool loadingComments = true;
  late VideoComments comments;
  bool continuationLoaded = false;
  String? continuation;
  String error = '';
  String? source;
  String? sortBy;

  CommentsState({required this.video, this.continuation, this.source, this.sortBy}) {
    comments = VideoComments(0, video.videoId, '', []);
  }

  CommentsState._(this.video, this.loadingComments, this.comments, this.continuationLoaded, this.continuation,
      this.error, this.source, this.sortBy);
}
