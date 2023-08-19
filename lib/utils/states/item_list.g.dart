// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ItemListStateCWProxy<T> {
  ItemListState<T> itemList(PaginatedList<T> itemList);

  ItemListState<T> refreshController(RefreshController refreshController);

  ItemListState<T> items(List<T> items);

  ItemListState<T> loading(bool loading);

  ItemListState<T> imageCache(Map<String, Image> imageCache);

  ItemListState<T> scrollController(ScrollController scrollController);

  ItemListState<T> error(ItemListErrors error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItemListState<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItemListState<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  ItemListState<T> call({
    PaginatedList<T>? itemList,
    RefreshController? refreshController,
    List<T>? items,
    bool? loading,
    Map<String, Image>? imageCache,
    ScrollController? scrollController,
    ItemListErrors? error,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfItemListState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfItemListState.copyWith.fieldName(...)`
class _$ItemListStateCWProxyImpl<T> implements _$ItemListStateCWProxy<T> {
  const _$ItemListStateCWProxyImpl(this._value);

  final ItemListState<T> _value;

  @override
  ItemListState<T> itemList(PaginatedList<T> itemList) => this(itemList: itemList);

  @override
  ItemListState<T> refreshController(RefreshController refreshController) => this(refreshController: refreshController);

  @override
  ItemListState<T> items(List<T> items) => this(items: items);

  @override
  ItemListState<T> loading(bool loading) => this(loading: loading);

  @override
  ItemListState<T> imageCache(Map<String, Image> imageCache) => this(imageCache: imageCache);

  @override
  ItemListState<T> scrollController(ScrollController scrollController) => this(scrollController: scrollController);

  @override
  ItemListState<T> error(ItemListErrors error) => this(error: error);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItemListState<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItemListState<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  ItemListState<T> call({
    Object? itemList = const $CopyWithPlaceholder(),
    Object? refreshController = const $CopyWithPlaceholder(),
    Object? items = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? imageCache = const $CopyWithPlaceholder(),
    Object? scrollController = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return ItemListState<T>._(
      itemList == const $CopyWithPlaceholder() || itemList == null
          ? _value.itemList
          // ignore: cast_nullable_to_non_nullable
          : itemList as PaginatedList<T>,
      refreshController == const $CopyWithPlaceholder() || refreshController == null
          ? _value.refreshController
          // ignore: cast_nullable_to_non_nullable
          : refreshController as RefreshController,
      items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<T>,
      loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      imageCache == const $CopyWithPlaceholder() || imageCache == null
          ? _value.imageCache
          // ignore: cast_nullable_to_non_nullable
          : imageCache as Map<String, Image>,
      scrollController == const $CopyWithPlaceholder() || scrollController == null
          ? _value.scrollController
          // ignore: cast_nullable_to_non_nullable
          : scrollController as ScrollController,
      error == const $CopyWithPlaceholder() || error == null
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as ItemListErrors,
    );
  }
}

extension $ItemListStateCopyWith<T> on ItemListState<T> {
  /// Returns a callable class that can be used as follows: `instanceOfItemListState.copyWith(...)` or like so:`instanceOfItemListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ItemListStateCWProxy<T> get copyWith => _$ItemListStateCWProxyImpl<T>(this);
}
