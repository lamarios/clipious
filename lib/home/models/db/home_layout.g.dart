// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_layout.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeLayoutCWProxy {
  HomeLayout id(int id);

  HomeLayout smallSources(List<HomeDataSource> smallSources);

  HomeLayout bigSource(HomeDataSource bigSource);

  HomeLayout showBigSource(bool showBigSource);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeLayout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeLayout(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeLayout call({
    int? id,
    List<HomeDataSource>? smallSources,
    HomeDataSource? bigSource,
    bool? showBigSource,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomeLayout.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHomeLayout.copyWith.fieldName(...)`
class _$HomeLayoutCWProxyImpl implements _$HomeLayoutCWProxy {
  const _$HomeLayoutCWProxyImpl(this._value);

  final HomeLayout _value;

  @override
  HomeLayout id(int id) => this(id: id);

  @override
  HomeLayout smallSources(List<HomeDataSource> smallSources) => this(smallSources: smallSources);

  @override
  HomeLayout bigSource(HomeDataSource bigSource) => this(bigSource: bigSource);

  @override
  HomeLayout showBigSource(bool showBigSource) => this(showBigSource: showBigSource);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeLayout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeLayout(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeLayout call({
    Object? id = const $CopyWithPlaceholder(),
    Object? smallSources = const $CopyWithPlaceholder(),
    Object? bigSource = const $CopyWithPlaceholder(),
    Object? showBigSource = const $CopyWithPlaceholder(),
  }) {
    return HomeLayout._(
      id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      smallSources == const $CopyWithPlaceholder() || smallSources == null
          ? _value.smallSources
          // ignore: cast_nullable_to_non_nullable
          : smallSources as List<HomeDataSource>,
      bigSource == const $CopyWithPlaceholder() || bigSource == null
          ? _value.bigSource
          // ignore: cast_nullable_to_non_nullable
          : bigSource as HomeDataSource,
      showBigSource == const $CopyWithPlaceholder() || showBigSource == null
          ? _value.showBigSource
          // ignore: cast_nullable_to_non_nullable
          : showBigSource as bool,
    );
  }
}

extension $HomeLayoutCopyWith on HomeLayout {
  /// Returns a callable class that can be used as follows: `instanceOfHomeLayout.copyWith(...)` or like so:`instanceOfHomeLayout.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeLayoutCWProxy get copyWith => _$HomeLayoutCWProxyImpl(this);
}
