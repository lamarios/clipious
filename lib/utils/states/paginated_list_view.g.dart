// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_list_view.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaginatedListViewControllerCWProxy<T> {
  PaginatedListViewController<T> scrollController(ScrollController scrollController);

  PaginatedListViewController<T> paginatedList(PaginatedList<T> paginatedList);

  PaginatedListViewController<T> items(List<T> items);

  PaginatedListViewController<T> loading(bool loading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaginatedListViewController<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaginatedListViewController<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  PaginatedListViewController<T> call({
    ScrollController? scrollController,
    PaginatedList<T>? paginatedList,
    List<T>? items,
    bool? loading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaginatedListViewController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaginatedListViewController.copyWith.fieldName(...)`
class _$PaginatedListViewControllerCWProxyImpl<T> implements _$PaginatedListViewControllerCWProxy<T> {
  const _$PaginatedListViewControllerCWProxyImpl(this._value);

  final PaginatedListViewController<T> _value;

  @override
  PaginatedListViewController<T> scrollController(ScrollController scrollController) => this(scrollController: scrollController);

  @override
  PaginatedListViewController<T> paginatedList(PaginatedList<T> paginatedList) => this(paginatedList: paginatedList);

  @override
  PaginatedListViewController<T> items(List<T> items) => this(items: items);

  @override
  PaginatedListViewController<T> loading(bool loading) => this(loading: loading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaginatedListViewController<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaginatedListViewController<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  PaginatedListViewController<T> call({
    Object? scrollController = const $CopyWithPlaceholder(),
    Object? paginatedList = const $CopyWithPlaceholder(),
    Object? items = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
  }) {
    return PaginatedListViewController<T>._(
      scrollController == const $CopyWithPlaceholder() || scrollController == null
          ? _value.scrollController
          // ignore: cast_nullable_to_non_nullable
          : scrollController as ScrollController,
      paginatedList == const $CopyWithPlaceholder() || paginatedList == null
          ? _value.paginatedList
          // ignore: cast_nullable_to_non_nullable
          : paginatedList as PaginatedList<T>,
      items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<T>,
      loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
    );
  }
}

extension $PaginatedListViewControllerCopyWith<T> on PaginatedListViewController<T> {
  /// Returns a callable class that can be used as follows: `instanceOfPaginatedListViewController.copyWith(...)` or like so:`instanceOfPaginatedListViewController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaginatedListViewControllerCWProxy<T> get copyWith => _$PaginatedListViewControllerCWProxyImpl<T>(this);
}
