// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_filter.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VideoFilterModelCWProxy {
  VideoFilterModel filters(List<VideoFilter>? filters);

  VideoFilterModel hideFilteredVideos(bool? hideFilteredVideos);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilterModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilterModel(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilterModel call({
    List<VideoFilter>? filters,
    bool? hideFilteredVideos,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVideoFilterModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVideoFilterModel.copyWith.fieldName(...)`
class _$VideoFilterModelCWProxyImpl implements _$VideoFilterModelCWProxy {
  const _$VideoFilterModelCWProxyImpl(this._value);

  final VideoFilterModel _value;

  @override
  VideoFilterModel filters(List<VideoFilter>? filters) =>
      this(filters: filters);

  @override
  VideoFilterModel hideFilteredVideos(bool? hideFilteredVideos) =>
      this(hideFilteredVideos: hideFilteredVideos);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilterModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilterModel(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilterModel call({
    Object? filters = const $CopyWithPlaceholder(),
    Object? hideFilteredVideos = const $CopyWithPlaceholder(),
  }) {
    return VideoFilterModel(
      filters: filters == const $CopyWithPlaceholder()
          ? _value.filters
          // ignore: cast_nullable_to_non_nullable
          : filters as List<VideoFilter>?,
      hideFilteredVideos: hideFilteredVideos == const $CopyWithPlaceholder()
          ? _value.hideFilteredVideos
          // ignore: cast_nullable_to_non_nullable
          : hideFilteredVideos as bool?,
    );
  }
}

extension $VideoFilterModelCopyWith on VideoFilterModel {
  /// Returns a callable class that can be used as follows: `instanceOfVideoFilterModel.copyWith(...)` or like so:`instanceOfVideoFilterModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VideoFilterModelCWProxy get copyWith => _$VideoFilterModelCWProxyImpl(this);
}
