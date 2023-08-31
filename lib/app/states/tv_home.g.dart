// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_home.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TvHomeStateCWProxy {
  TvHomeState expandMenu(bool expandMenu);

  TvHomeState scrollController(ScrollController scrollController);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TvHomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TvHomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  TvHomeState call({
    bool? expandMenu,
    ScrollController? scrollController,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTvHomeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTvHomeState.copyWith.fieldName(...)`
class _$TvHomeStateCWProxyImpl implements _$TvHomeStateCWProxy {
  const _$TvHomeStateCWProxyImpl(this._value);

  final TvHomeState _value;

  @override
  TvHomeState expandMenu(bool expandMenu) => this(expandMenu: expandMenu);

  @override
  TvHomeState scrollController(ScrollController scrollController) =>
      this(scrollController: scrollController);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TvHomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TvHomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  TvHomeState call({
    Object? expandMenu = const $CopyWithPlaceholder(),
    Object? scrollController = const $CopyWithPlaceholder(),
  }) {
    return TvHomeState._(
      expandMenu == const $CopyWithPlaceholder() || expandMenu == null
          ? _value.expandMenu
          // ignore: cast_nullable_to_non_nullable
          : expandMenu as bool,
      scrollController == const $CopyWithPlaceholder() ||
              scrollController == null
          ? _value.scrollController
          // ignore: cast_nullable_to_non_nullable
          : scrollController as ScrollController,
    );
  }
}

extension $TvHomeStateCopyWith on TvHomeState {
  /// Returns a callable class that can be used as follows: `instanceOfTvHomeState.copyWith(...)` or like so:`instanceOfTvHomeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TvHomeStateCWProxy get copyWith => _$TvHomeStateCWProxyImpl(this);
}
