// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_subscriptions.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ManageSubscriptionsControllerCWProxy {
  ManageSubscriptionsController subs(List<Subscription>? subs);

  ManageSubscriptionsController loading(bool? loading);

  ManageSubscriptionsController refreshController(
      RefreshController? refreshController);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ManageSubscriptionsController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ManageSubscriptionsController(...).copyWith(id: 12, name: "My name")
  /// ````
  ManageSubscriptionsController call({
    List<Subscription>? subs,
    bool? loading,
    RefreshController? refreshController,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfManageSubscriptionsController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfManageSubscriptionsController.copyWith.fieldName(...)`
class _$ManageSubscriptionsControllerCWProxyImpl
    implements _$ManageSubscriptionsControllerCWProxy {
  const _$ManageSubscriptionsControllerCWProxyImpl(this._value);

  final ManageSubscriptionsController _value;

  @override
  ManageSubscriptionsController subs(List<Subscription>? subs) =>
      this(subs: subs);

  @override
  ManageSubscriptionsController loading(bool? loading) =>
      this(loading: loading);

  @override
  ManageSubscriptionsController refreshController(
          RefreshController? refreshController) =>
      this(refreshController: refreshController);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ManageSubscriptionsController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ManageSubscriptionsController(...).copyWith(id: 12, name: "My name")
  /// ````
  ManageSubscriptionsController call({
    Object? subs = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? refreshController = const $CopyWithPlaceholder(),
  }) {
    return ManageSubscriptionsController(
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

extension $ManageSubscriptionsControllerCopyWith
    on ManageSubscriptionsController {
  /// Returns a callable class that can be used as follows: `instanceOfManageSubscriptionsController.copyWith(...)` or like so:`instanceOfManageSubscriptionsController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ManageSubscriptionsControllerCWProxy get copyWith =>
      _$ManageSubscriptionsControllerCWProxyImpl(this);
}
