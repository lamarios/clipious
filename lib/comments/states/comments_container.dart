import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'comments_container.g.dart';

class CommentsContainerCubit extends Cubit<CommentsContainerState> {
  CommentsContainerCubit(super.initialState);

  changeSorting(String? value) {
    var state = this.state.copyWith();
    if (value != state.sortBy) {
      state.sortBy = value ?? 'top';
      emit(state);
    }
  }
}

@CopyWith(constructor: "_")
class CommentsContainerState {
  String source = 'youtube';
  String sortBy = 'top';

  CommentsContainerState();

  CommentsContainerState._(this.source, this.sortBy);
}
