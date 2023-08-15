// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tvSearchController.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TvSearchControllerCWProxy {
  TvSearchController resultFocus(FocusNode resultFocus);

  TvSearchController searchFocus(FocusNode searchFocus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TvSearchController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TvSearchController(...).copyWith(id: 12, name: "My name")
  /// ````
  TvSearchController call({
    FocusNode? resultFocus,
    FocusNode? searchFocus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTvSearchController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTvSearchController.copyWith.fieldName(...)`
class _$TvSearchControllerCWProxyImpl implements _$TvSearchControllerCWProxy {
  const _$TvSearchControllerCWProxyImpl(this._value);

  final TvSearchController _value;

  @override
  TvSearchController resultFocus(FocusNode resultFocus) =>
      this(resultFocus: resultFocus);

  @override
  TvSearchController searchFocus(FocusNode searchFocus) =>
      this(searchFocus: searchFocus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TvSearchController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TvSearchController(...).copyWith(id: 12, name: "My name")
  /// ````
  TvSearchController call({
    Object? resultFocus = const $CopyWithPlaceholder(),
    Object? searchFocus = const $CopyWithPlaceholder(),
  }) {
    return TvSearchController._(
      resultFocus == const $CopyWithPlaceholder() || resultFocus == null
          ? _value.resultFocus
          // ignore: cast_nullable_to_non_nullable
          : resultFocus as FocusNode,
      searchFocus == const $CopyWithPlaceholder() || searchFocus == null
          ? _value.searchFocus
          // ignore: cast_nullable_to_non_nullable
          : searchFocus as FocusNode,
    );
  }
}

extension $TvSearchControllerCopyWith on TvSearchController {
  /// Returns a callable class that can be used as follows: `instanceOfTvSearchController.copyWith(...)` or like so:`instanceOfTvSearchController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TvSearchControllerCWProxy get copyWith =>
      _$TvSearchControllerCWProxyImpl(this);
}
