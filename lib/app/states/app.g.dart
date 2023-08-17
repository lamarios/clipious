// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppStateCWProxy {
  AppState selectedIndex(int selectedIndex);

  AppState isLoggedIn(bool isLoggedIn);

  AppState intentDataStreamSubscription(
      StreamSubscription<dynamic> intentDataStreamSubscription);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppState(...).copyWith(id: 12, name: "My name")
  /// ````
  AppState call({
    int? selectedIndex,
    bool? isLoggedIn,
    StreamSubscription<dynamic>? intentDataStreamSubscription,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppState.copyWith.fieldName(...)`
class _$AppStateCWProxyImpl implements _$AppStateCWProxy {
  const _$AppStateCWProxyImpl(this._value);

  final AppState _value;

  @override
  AppState selectedIndex(int selectedIndex) =>
      this(selectedIndex: selectedIndex);

  @override
  AppState isLoggedIn(bool isLoggedIn) => this(isLoggedIn: isLoggedIn);

  @override
  AppState intentDataStreamSubscription(
          StreamSubscription<dynamic> intentDataStreamSubscription) =>
      this(intentDataStreamSubscription: intentDataStreamSubscription);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppState(...).copyWith(id: 12, name: "My name")
  /// ````
  AppState call({
    Object? selectedIndex = const $CopyWithPlaceholder(),
    Object? isLoggedIn = const $CopyWithPlaceholder(),
    Object? intentDataStreamSubscription = const $CopyWithPlaceholder(),
  }) {
    return AppState._(
      selectedIndex == const $CopyWithPlaceholder() || selectedIndex == null
          ? _value.selectedIndex
          // ignore: cast_nullable_to_non_nullable
          : selectedIndex as int,
      isLoggedIn == const $CopyWithPlaceholder() || isLoggedIn == null
          ? _value.isLoggedIn
          // ignore: cast_nullable_to_non_nullable
          : isLoggedIn as bool,
      intentDataStreamSubscription == const $CopyWithPlaceholder() ||
              intentDataStreamSubscription == null
          ? _value.intentDataStreamSubscription
          // ignore: cast_nullable_to_non_nullable
          : intentDataStreamSubscription as StreamSubscription<dynamic>,
    );
  }
}

extension $AppStateCopyWith on AppState {
  /// Returns a callable class that can be used as follows: `instanceOfAppState.copyWith(...)` or like so:`instanceOfAppState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppStateCWProxy get copyWith => _$AppStateCWProxyImpl(this);
}
