import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/comment.dart';
import '../models/video_comments.dart';

part 'single_comment.freezed.dart';

class SingleCommentCubit extends Cubit<SingleCommentState> {
  SingleCommentCubit(super.initialState);

  toggleShowChildren() {
    var state = this.state.copyWith();
    emit(state.copyWith(showingChildren: !state.showingChildren));
  }
}

@freezed
class SingleCommentState with _$SingleCommentState {
  const factory SingleCommentState(
      {required Comment comment, @Default(false) bool showingChildren, VideoComments? children}) = _SingleCommentState;
}
