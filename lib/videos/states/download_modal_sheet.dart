import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_modal_sheet.freezed.dart';

class DownloadModalSheetCubit extends Cubit<DownloadModalSheetState> {
  DownloadModalSheetCubit(super.initialState);

  setAudioOnly(bool value) {
    emit(state.copyWith(audioOnly: value));
  }

  setQuality(String quality) {
    emit(state.copyWith(quality: quality));
  }
}

@freezed
class DownloadModalSheetState with _$DownloadModalSheetState {
  const factory DownloadModalSheetState({@Default(false) bool audioOnly, @Default('720p') String quality}) = _DownloadModalSheetState;
}
