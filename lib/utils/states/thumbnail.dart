import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'thumbnail.freezed.dart';

final _log = Logger('ThumbnailCubit');

class ThumbnailCubit extends Cubit<ThumbnailState> {
  ThumbnailCubit(super.initialState) {
    init();
  }

  init() {
    if (state.urls.isNotEmpty) {
      emit(state.copyWith(selected: state.urls.first));
    }
  }

  onThumbnailFailed() {
    _log.info('Failed to load thumbnail, trying another one');
    if (state.urls.isNotEmpty) {
      List<String> thumbnails = List.from(state.urls);
      thumbnails.removeAt(0);
      if (thumbnails.isNotEmpty) {
        emit(state.copyWith(urls: thumbnails, selected: thumbnails[0]));
      } else {
        emit(state.copyWith(urls: thumbnails, selected: null));
      }
    } else {
      emit(state.copyWith(selected: null));
    }
  }
}

@freezed
class ThumbnailState with _$ThumbnailState {
  const factory ThumbnailState(
      {@Default([]) List<String> urls, String? selected}) = _ThumbnailState;
}
