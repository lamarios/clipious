import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';

part 'compact_video.g.dart';

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
          var state = this.state.copyWith();
          state.offlineVideoThumbnailPath = path;
          emit(state);
        } else {
          EasyDebounce.debounce(
              '${state.offlineVideo?.videoId}-compact-view-thumbnail', const Duration(seconds: 1), getThumbnail);
        }
      } catch (e) {
        EasyDebounce.debounce(
            '${state.offlineVideo?.videoId}-compact-view-thumbnail', const Duration(seconds: 1), getThumbnail);
      }
    }
  }
}

@CopyWith(constructor: "_")
class CompactVideoState {
  final DownloadedVideo? offlineVideo;
  String? offlineVideoThumbnailPath;

  CompactVideoState({this.offlineVideo});

  CompactVideoState._(this.offlineVideo, this.offlineVideoThumbnailPath);
}
