// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SelectListStateCWProxy<T> {
  SelectListState<T> filteredItems(List<T> filteredItems);

  SelectListState<T> loading(bool loading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SelectListState<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SelectListState<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  SelectListState<T> call({
    List<T>? filteredItems,
    bool? loading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSelectListState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSelectListState.copyWith.fieldName(...)`
class _$SelectListStateCWProxyImpl<T> implements _$SelectListStateCWProxy<T> {
  const _$SelectListStateCWProxyImpl(this._value);

  final SelectListState<T> _value;

  @override
  SelectListState<T> filteredItems(List<T> filteredItems) =>
      this(filteredItems: filteredItems);

  @override
  SelectListState<T> loading(bool loading) => this(loading: loading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SelectListState<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SelectListState<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  SelectListState<T> call({
    Object? filteredItems = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
  }) {
    return SelectListState<T>._(
      filteredItems == const $CopyWithPlaceholder() || filteredItems == null
          ? _value.filteredItems
          // ignore: cast_nullable_to_non_nullable
          : filteredItems as List<T>,
      loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
    );
  }
}

extension $SelectListStateCopyWith<T> on SelectListState<T> {
  /// Returns a callable class that can be used as follows: `instanceOfSelectListState.copyWith(...)` or like so:`instanceOfSelectListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SelectListStateCWProxy<T> get copyWith =>
      _$SelectListStateCWProxyImpl<T>(this);
}
