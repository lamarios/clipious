import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/comments/models/video_comments.dart';
import 'package:invidious/videos/models/base_video.dart';

import '../../globals.dart';
import '../../settings/models/errors/invidiousServiceError.dart';

part 'comments.freezed.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit(super.initialState) {
    onReady();
  }

  onReady() {
    getComments();
  }

  loadMore() async {
    var state = this.state.copyWith();
    emit(state.copyWith(loadingComments: true));

    state = this.state.copyWith();
    VideoComments comments = await service.getComments(state.video.videoId,
        continuation: state.continuation);

    var stateComments = state.comments;
    stateComments.comments.addAll(comments.comments);
    emit(state.copyWith(
        comments: stateComments,
        continuation: comments.continuation,
        loadingComments: false));
  }

  getComments() async {
    var state = this.state.copyWith();
    emit(state.copyWith(
        error: '',
        loadingComments: true,
        comments: VideoComments(0, state.video.videoId, '', [])));

    state = this.state.copyWith();

    try {
      VideoComments comments = await service.getComments(state.video.videoId,
          continuation: state.continuation,
          sortBy: state.sortBy,
          source: state.source);
      emit(state.copyWith(
          comments: comments,
          loadingComments: false,
          continuation: comments.continuation));
    } catch (err) {
      state = this.state.copyWith();
      if (err is InvidiousServiceError) {
        emit(state.copyWith(error: err.message));
      } else {
        emit(state.copyWith(error: err.toString()));
        rethrow;
      }
    }
  }
}

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState(
      {required BaseVideo video,
      @Default(true) bool loadingComments,
      String? continuation,
      @Default(false) bool continuationLoaded,
      required VideoComments comments,
      @Default('') String error,
      String? source,
      String? sortBy}) = _CommentsState;

  static CommentsState init(
      {required BaseVideo video,
      bool? loadingComments,
      String? continuation,
      bool? continuationLoaded,
      String? error,
      String? source,
      String? sortBy}) {
    var comments = VideoComments(0, video.videoId, continuation, []);

    return CommentsState(
        video: video,
        comments: comments,
        loadingComments: loadingComments ?? true,
        continuation: continuation,
        continuationLoaded: continuationLoaded ?? false,
        error: error ?? '',
        source: source,
        sortBy: sortBy);
  }
}
