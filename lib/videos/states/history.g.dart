// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HistoryItemStateCWProxy {
  HistoryItemState videoId(String videoId);

  HistoryItemState loading(bool loading);

  HistoryItemState cachedVid(HistoryVideoCache? cachedVid);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HistoryItemState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HistoryItemState(...).copyWith(id: 12, name: "My name")
  /// ````
  HistoryItemState call({
    String? videoId,
    bool? loading,
    HistoryVideoCache? cachedVid,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHistoryItemState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHistoryItemState.copyWith.fieldName(...)`
class _$HistoryItemStateCWProxyImpl implements _$HistoryItemStateCWProxy {
  const _$HistoryItemStateCWProxyImpl(this._value);

  final HistoryItemState _value;

  @override
  HistoryItemState videoId(String videoId) => this(videoId: videoId);

  @override
  HistoryItemState loading(bool loading) => this(loading: loading);

  @override
  HistoryItemState cachedVid(HistoryVideoCache? cachedVid) =>
      this(cachedVid: cachedVid);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HistoryItemState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HistoryItemState(...).copyWith(id: 12, name: "My name")
  /// ````
  HistoryItemState call({
    Object? videoId = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? cachedVid = const $CopyWithPlaceholder(),
  }) {
    return HistoryItemState._(
      videoId == const $CopyWithPlaceholder() || videoId == null
          ? _value.videoId
          // ignore: cast_nullable_to_non_nullable
          : videoId as String,
      loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      cachedVid == const $CopyWithPlaceholder()
          ? _value.cachedVid
          // ignore: cast_nullable_to_non_nullable
          : cachedVid as HistoryVideoCache?,
    );
  }
}

extension $HistoryItemStateCopyWith on HistoryItemState {
  /// Returns a callable class that can be used as follows: `instanceOfHistoryItemState.copyWith(...)` or like so:`instanceOfHistoryItemState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HistoryItemStateCWProxy get copyWith => _$HistoryItemStateCWProxyImpl(this);
}
