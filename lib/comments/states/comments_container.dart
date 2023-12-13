import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_container.freezed.dart';

class CommentsContainerCubit extends Cubit<CommentsContainerState> {
  CommentsContainerCubit(super.initialState);

  changeSorting(String? value) {
    var state = this.state.copyWith();
    if (value != state.sortBy) {
      emit(state.copyWith(sortBy: value ?? 'top'));
    }
  }
}

@freezed
class CommentsContainerState with _$CommentsContainerState {
  const factory CommentsContainerState(
      {@Default('youtube') String source,
      @Default('top') String sortBy}) = _CommentsContainerState;
}
