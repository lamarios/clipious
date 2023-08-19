// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_subscriptions.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ManageSubscriptionsStateCWProxy {
  ManageSubscriptionsState subs(List<Subscription>? subs);

  ManageSubscriptionsState loading(bool? loading);

  ManageSubscriptionsState refreshController(RefreshController? refreshController);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ManageSubscriptionsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ManageSubscriptionsState(...).copyWith(id: 12, name: "My name")
  /// ````
  ManageSubscriptionsState call({
    List<Subscription>? subs,
    bool? loading,
    RefreshController? refreshController,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfManageSubscriptionsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfManageSubscriptionsState.copyWith.fieldName(...)`
class _$ManageSubscriptionsStateCWProxyImpl implements _$ManageSubscriptionsStateCWProxy {
  const _$ManageSubscriptionsStateCWProxyImpl(this._value);

  final ManageSubscriptionsState _value;

  @override
  ManageSubscriptionsState subs(List<Subscription>? subs) => this(subs: subs);

  @override
  ManageSubscriptionsState loading(bool? loading) => this(loading: loading);

  @override
  ManageSubscriptionsState refreshController(RefreshController? refreshController) => this(refreshController: refreshController);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ManageSubscriptionsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ManageSubscriptionsState(...).copyWith(id: 12, name: "My name")
  /// ````
  ManageSubscriptionsState call({
    Object? subs = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? refreshController = const $CopyWithPlaceholder(),
  }) {
    return ManageSubscriptionsState(
      subs: subs == const $CopyWithPlaceholder()
          ? _value.subs
          // ignore: cast_nullable_to_non_nullable
          : subs as List<Subscription>?,
      loading: loading == const $CopyWithPlaceholder()
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool?,
      refreshController: refreshController == const $CopyWithPlaceholder()
          ? _value.refreshController
          // ignore: cast_nullable_to_non_nullable
          : refreshController as RefreshController?,
    );
  }
}

extension $ManageSubscriptionsStateCopyWith on ManageSubscriptionsState {
  /// Returns a callable class that can be used as follows: `instanceOfManageSubscriptionsState.copyWith(...)` or like so:`instanceOfManageSubscriptionsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ManageSubscriptionsStateCWProxy get copyWith => _$ManageSubscriptionsStateCWProxyImpl(this);
}
