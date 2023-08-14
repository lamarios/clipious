// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videoFilterController.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VideoFilterControllerCWProxy {
  VideoFilterController filters(List<VideoFilter>? filters);

  VideoFilterController hideFilteredVideos(bool? hideFilteredVideos);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilterController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilterController(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilterController call({
    List<VideoFilter>? filters,
    bool? hideFilteredVideos,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVideoFilterController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVideoFilterController.copyWith.fieldName(...)`
class _$VideoFilterControllerCWProxyImpl
    implements _$VideoFilterControllerCWProxy {
  const _$VideoFilterControllerCWProxyImpl(this._value);

  final VideoFilterController _value;

  @override
  VideoFilterController filters(List<VideoFilter>? filters) =>
      this(filters: filters);

  @override
  VideoFilterController hideFilteredVideos(bool? hideFilteredVideos) =>
      this(hideFilteredVideos: hideFilteredVideos);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilterController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilterController(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilterController call({
    Object? filters = const $CopyWithPlaceholder(),
    Object? hideFilteredVideos = const $CopyWithPlaceholder(),
  }) {
    return VideoFilterController(
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

extension $VideoFilterControllerCopyWith on VideoFilterController {
  /// Returns a callable class that can be used as follows: `instanceOfVideoFilterController.copyWith(...)` or like so:`instanceOfVideoFilterController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VideoFilterControllerCWProxy get copyWith =>
      _$VideoFilterControllerCWProxyImpl(this);
}
