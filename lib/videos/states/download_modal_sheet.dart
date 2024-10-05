import 'package:bloc/bloc.dart';
import 'package:clipious/videos/models/video.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clipious/extensions.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/videos/models/adaptive_format.dart';

part 'download_modal_sheet.freezed.dart';

class DownloadModalSheetCubit extends Cubit<DownloadModalSheetState> {
  final Video video;

  DownloadModalSheetCubit(super.initialState, this.video) {
    init();
  }

  init() async {
    emit(state.copyWith(loading: true));
    final vid = await service.getVideo(video.videoId);

    final qualities = (vid.adaptiveFormats ?? [])
        .where((f) => f.encoding == 'vp9' && f.type.contains("video/webm"))
        .sortBy((f) => int.parse(f.resolution?.replaceAll('p', '') ?? '0'))
        .where(
            (f) => f.qualityLabel != null && f.qualityLabel!.trim().isNotEmpty)
        .toList();

    emit(state.copyWith(
        availableQualities: qualities,
        loading: false,
        quality: qualities.last.qualityLabel!));
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
      @Default([]) List<AdaptiveFormat> availableQualities,
      @Default('720p') String quality}) = _DownloadModalSheetState;
}
