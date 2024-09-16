import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/extensions.dart';
import 'package:invidious/globals.dart';

import '../models/base_video.dart';

part 'download_modal_sheet.freezed.dart';

class DownloadModalSheetCubit extends Cubit<DownloadModalSheetState> {
  final BaseVideo video;

  DownloadModalSheetCubit(super.initialState, this.video) {
    init();
  }

  init() async {
    emit(state.copyWith(loading: true));
    final vid = await service.getVideo(video.videoId);

    final qualities = vid.adaptiveFormats
        .where((f) => f.encoding == 'vp9' && f.type.contains("video/webm"))
        .sortBy((f) => int.parse(f.resolution?.replaceAll('p', '') ?? '0'))
        .map((f) => f.qualityLabel ?? '')
        .where((f) => f.trim().isNotEmpty)
        .toList();

    emit(state.copyWith(
        availableQualities: qualities,
        loading: false,
        quality: qualities.last));
  }

  setAudioOnly(bool value) {
    emit(state.copyWith(audioOnly: value));
  }

  setQuality(String? quality) {
    if (quality != null) {
      emit(state.copyWith(quality: quality));
    }
  }
}

@freezed
class DownloadModalSheetState with _$DownloadModalSheetState {
  const factory DownloadModalSheetState(
      {@Default(false) bool audioOnly,
      @Default(false) bool loading,
      @Default([]) List<String> availableQualities,
      @Default('720p') String quality}) = _DownloadModalSheetState;
}
