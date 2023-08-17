import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:get/get.dart';

import '../models/comment.dart';
import '../models/video_comments.dart';

part 'single_comment.g.dart';

class SingleCommentCubit extends Cubit<SingleCommentState> {
  SingleCommentCubit(super.initialState);

  toggleShowChildren() {
    var state = this.state.copyWith();
    state.showingChildren = !state.showingChildren;
    emit(state);
  }
}

@CopyWith(constructor: "_")
class SingleCommentState {
  bool showingChildren = false;
  Comment comment;

  VideoComments? children;

  SingleCommentState({required this.comment});

  SingleCommentState._(this.showingChildren, this.comment, this.children);
}
