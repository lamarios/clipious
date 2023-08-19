import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'download_modal_sheet.g.dart';

class DownloadModalSheetCubit extends Cubit<DownloadModalSheetState> {
  DownloadModalSheetCubit(super.initialState);

  setAudioOnly(bool value) {
    var state = this.state.copyWith();
    state.audioOnly = value;
    emit(state);
  }

  setQuality(String quality) {
    var state = this.state.copyWith();
    state.quality = quality;
    emit(state);
  }
}

@CopyWith(constructor: "_")
class DownloadModalSheetState {
  bool audioOnly = false;
  String quality = '720p';

  DownloadModalSheetState();

  DownloadModalSheetState._(this.audioOnly, this.quality);
}
