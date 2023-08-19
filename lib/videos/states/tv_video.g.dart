// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_video.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TvVideoStateCWProxy {
  TvVideoState scrollController(ScrollController? scrollController);

  TvVideoState showImage(bool showImage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TvVideoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TvVideoState(...).copyWith(id: 12, name: "My name")
  /// ````
  TvVideoState call({
    ScrollController? scrollController,
    bool? showImage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTvVideoState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTvVideoState.copyWith.fieldName(...)`
class _$TvVideoStateCWProxyImpl implements _$TvVideoStateCWProxy {
  const _$TvVideoStateCWProxyImpl(this._value);

  final TvVideoState _value;

  @override
  TvVideoState scrollController(ScrollController? scrollController) =>
      this(scrollController: scrollController);

  @override
  TvVideoState showImage(bool showImage) => this(showImage: showImage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TvVideoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TvVideoState(...).copyWith(id: 12, name: "My name")
  /// ````
  TvVideoState call({
    Object? scrollController = const $CopyWithPlaceholder(),
    Object? showImage = const $CopyWithPlaceholder(),
  }) {
    return TvVideoState._(
      scrollController == const $CopyWithPlaceholder()
          ? _value.scrollController
          // ignore: cast_nullable_to_non_nullable
          : scrollController as ScrollController?,
      showImage == const $CopyWithPlaceholder() || showImage == null
          ? _value.showImage
          // ignore: cast_nullable_to_non_nullable
          : showImage as bool,
    );
  }
}

extension $TvVideoStateCopyWith on TvVideoState {
  /// Returns a callable class that can be used as follows: `instanceOfTvVideoState.copyWith(...)` or like so:`instanceOfTvVideoState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TvVideoStateCWProxy get copyWith => _$TvVideoStateCWProxyImpl(this);
}
