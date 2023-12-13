import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';

part 'compact_video.freezed.dart';

class CompactVideoCubit extends Cubit<CompactVideoState> {
  CompactVideoCubit(super.initialState) {
    onReady();
  }

  void onReady() {
    getThumbnail();
  }

  getThumbnail() async {
    if (state.offlineVideo != null) {
      try {
        var path = await state.offlineVideo?.thumbnailPath;
        var file = File(path ?? 'abc');
        var exists = await file.exists();
        var hasSize = await file.length() > 0;
        if (exists && hasSize) {
          emit(state.copyWith(offlineVideoThumbnailPath: path));
        } else {
          EasyDebounce.debounce(
              '${state.offlineVideo?.videoId}-compact-view-thumbnail',
              const Duration(seconds: 1),
              getThumbnail);
        }
      } catch (e) {
        EasyDebounce.debounce(
            '${state.offlineVideo?.videoId}-compact-view-thumbnail',
            const Duration(seconds: 1),
            getThumbnail);
      }
    }
  }
}

@freezed
class CompactVideoState with _$CompactVideoState {
  const factory CompactVideoState(
      {DownloadedVideo? offlineVideo,
      String? offlineVideoThumbnailPath}) = _CompactVideoState;
}
