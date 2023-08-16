// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_search.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TvSearchControllerCWProxy {
  TvSearchState resultFocus(FocusNode resultFocus);

  TvSearchState searchFocus(FocusNode searchFocus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TvSearchController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TvSearchController(...).copyWith(id: 12, name: "My name")
  /// ````
  TvSearchState call({
    FocusNode? resultFocus,
    FocusNode? searchFocus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTvSearchController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTvSearchController.copyWith.fieldName(...)`
class _$TvSearchControllerCWProxyImpl implements _$TvSearchControllerCWProxy {
  const _$TvSearchControllerCWProxyImpl(this._value);

  final TvSearchState _value;

  @override
  TvSearchState resultFocus(FocusNode resultFocus) => this(resultFocus: resultFocus);

  @override
  TvSearchState searchFocus(FocusNode searchFocus) => this(searchFocus: searchFocus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TvSearchController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TvSearchController(...).copyWith(id: 12, name: "My name")
  /// ````
  TvSearchState call({
    Object? resultFocus = const $CopyWithPlaceholder(),
    Object? searchFocus = const $CopyWithPlaceholder(),
  }) {
    return TvSearchState._(
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

extension $TvSearchControllerCopyWith on TvSearchState {
  /// Returns a callable class that can be used as follows: `instanceOfTvSearchController.copyWith(...)` or like so:`instanceOfTvSearchController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TvSearchControllerCWProxy get copyWith => _$TvSearchControllerCWProxyImpl(this);
}
