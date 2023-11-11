// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchable_dynamic_select_from_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SearchableSelectFromListStateCWProxy<T> {
  SearchableSelectFromListState<T> items(List<T> items);

  SearchableSelectFromListState<T> controller(TextEditingController controller);

  SearchableSelectFromListState<T> loading(bool loading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchableSelectFromListState<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchableSelectFromListState<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchableSelectFromListState<T> call({
    List<T>? items,
    TextEditingController? controller,
    bool? loading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSearchableSelectFromListState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSearchableSelectFromListState.copyWith.fieldName(...)`
class _$SearchableSelectFromListStateCWProxyImpl<T>
    implements _$SearchableSelectFromListStateCWProxy<T> {
  const _$SearchableSelectFromListStateCWProxyImpl(this._value);

  final SearchableSelectFromListState<T> _value;

  @override
  SearchableSelectFromListState<T> items(List<T> items) => this(items: items);

  @override
  SearchableSelectFromListState<T> controller(
          TextEditingController controller) =>
      this(controller: controller);

  @override
  SearchableSelectFromListState<T> loading(bool loading) =>
      this(loading: loading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchableSelectFromListState<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchableSelectFromListState<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchableSelectFromListState<T> call({
    Object? items = const $CopyWithPlaceholder(),
    Object? controller = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
  }) {
    return SearchableSelectFromListState<T>._(
      items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<T>,
      controller == const $CopyWithPlaceholder() || controller == null
          ? _value.controller
          // ignore: cast_nullable_to_non_nullable
          : controller as TextEditingController,
      loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
    );
  }
}

extension $SearchableSelectFromListStateCopyWith<T>
    on SearchableSelectFromListState<T> {
  /// Returns a callable class that can be used as follows: `instanceOfSearchableSelectFromListState.copyWith(...)` or like so:`instanceOfSearchableSelectFromListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SearchableSelectFromListStateCWProxy<T> get copyWith =>
      _$SearchableSelectFromListStateCWProxyImpl<T>(this);
}
