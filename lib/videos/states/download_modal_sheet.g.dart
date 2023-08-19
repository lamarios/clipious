// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_modal_sheet.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DownloadModalSheetStateCWProxy {
  DownloadModalSheetState audioOnly(bool audioOnly);

  DownloadModalSheetState quality(String quality);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DownloadModalSheetState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DownloadModalSheetState(...).copyWith(id: 12, name: "My name")
  /// ````
  DownloadModalSheetState call({
    bool? audioOnly,
    String? quality,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDownloadModalSheetState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDownloadModalSheetState.copyWith.fieldName(...)`
class _$DownloadModalSheetStateCWProxyImpl implements _$DownloadModalSheetStateCWProxy {
  const _$DownloadModalSheetStateCWProxyImpl(this._value);

  final DownloadModalSheetState _value;

  @override
  DownloadModalSheetState audioOnly(bool audioOnly) => this(audioOnly: audioOnly);

  @override
  DownloadModalSheetState quality(String quality) => this(quality: quality);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DownloadModalSheetState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DownloadModalSheetState(...).copyWith(id: 12, name: "My name")
  /// ````
  DownloadModalSheetState call({
    Object? audioOnly = const $CopyWithPlaceholder(),
    Object? quality = const $CopyWithPlaceholder(),
  }) {
    return DownloadModalSheetState._(
      audioOnly == const $CopyWithPlaceholder() || audioOnly == null
          ? _value.audioOnly
          // ignore: cast_nullable_to_non_nullable
          : audioOnly as bool,
      quality == const $CopyWithPlaceholder() || quality == null
          ? _value.quality
          // ignore: cast_nullable_to_non_nullable
          : quality as String,
    );
  }
}

extension $DownloadModalSheetStateCopyWith on DownloadModalSheetState {
  /// Returns a callable class that can be used as follows: `instanceOfDownloadModalSheetState.copyWith(...)` or like so:`instanceOfDownloadModalSheetState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DownloadModalSheetStateCWProxy get copyWith => _$DownloadModalSheetStateCWProxyImpl(this);
}
