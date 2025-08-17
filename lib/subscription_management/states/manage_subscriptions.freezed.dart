// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_subscriptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManageSubscriptionsState {
  List<Subscription> get subs;
  List<OfflineSubscription> get offlineSubs;
  dynamic get isLoggedIn;
  bool get loading;

  /// Create a copy of ManageSubscriptionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ManageSubscriptionsStateCopyWith<ManageSubscriptionsState> get copyWith =>
      _$ManageSubscriptionsStateCopyWithImpl<ManageSubscriptionsState>(
          this as ManageSubscriptionsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ManageSubscriptionsState &&
            const DeepCollectionEquality().equals(other.subs, subs) &&
            const DeepCollectionEquality()
                .equals(other.offlineSubs, offlineSubs) &&
            const DeepCollectionEquality()
                .equals(other.isLoggedIn, isLoggedIn) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(subs),
      const DeepCollectionEquality().hash(offlineSubs),
      const DeepCollectionEquality().hash(isLoggedIn),
      loading);

  @override
  String toString() {
    return 'ManageSubscriptionsState(subs: $subs, offlineSubs: $offlineSubs, isLoggedIn: $isLoggedIn, loading: $loading)';
  }
}

/// @nodoc
abstract mixin class $ManageSubscriptionsStateCopyWith<$Res> {
  factory $ManageSubscriptionsStateCopyWith(ManageSubscriptionsState value,
          $Res Function(ManageSubscriptionsState) _then) =
      _$ManageSubscriptionsStateCopyWithImpl;
  @useResult
  $Res call(
      {List<Subscription> subs,
      List<OfflineSubscription> offlineSubs,
      dynamic isLoggedIn,
      bool loading});
}

/// @nodoc
class _$ManageSubscriptionsStateCopyWithImpl<$Res>
    implements $ManageSubscriptionsStateCopyWith<$Res> {
  _$ManageSubscriptionsStateCopyWithImpl(this._self, this._then);

  final ManageSubscriptionsState _self;
  final $Res Function(ManageSubscriptionsState) _then;

  /// Create a copy of ManageSubscriptionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subs = null,
    Object? offlineSubs = null,
    Object? isLoggedIn = freezed,
    Object? loading = null,
  }) {
    return _then(_self.copyWith(
      subs: null == subs
          ? _self.subs
          : subs // ignore: cast_nullable_to_non_nullable
              as List<Subscription>,
      offlineSubs: null == offlineSubs
          ? _self.offlineSubs
          : offlineSubs // ignore: cast_nullable_to_non_nullable
              as List<OfflineSubscription>,
      isLoggedIn: freezed == isLoggedIn
          ? _self.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as dynamic,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ManageSubscriptionsState].
extension ManageSubscriptionsStatePatterns on ManageSubscriptionsState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ManageSubscriptionsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManageSubscriptionsState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ManageSubscriptionsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManageSubscriptionsState():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ManageSubscriptionsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManageSubscriptionsState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<Subscription> subs,
            List<OfflineSubscription> offlineSubs,
            dynamic isLoggedIn,
            bool loading)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManageSubscriptionsState() when $default != null:
        return $default(
            _that.subs, _that.offlineSubs, _that.isLoggedIn, _that.loading);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<Subscription> subs,
            List<OfflineSubscription> offlineSubs,
            dynamic isLoggedIn,
            bool loading)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManageSubscriptionsState():
        return $default(
            _that.subs, _that.offlineSubs, _that.isLoggedIn, _that.loading);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<Subscription> subs,
            List<OfflineSubscription> offlineSubs,
            dynamic isLoggedIn,
            bool loading)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManageSubscriptionsState() when $default != null:
        return $default(
            _that.subs, _that.offlineSubs, _that.isLoggedIn, _that.loading);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ManageSubscriptionsState implements ManageSubscriptionsState {
  const _ManageSubscriptionsState(
      {final List<Subscription> subs = const [],
      final List<OfflineSubscription> offlineSubs = const [],
      this.isLoggedIn = false,
      this.loading = true})
      : _subs = subs,
        _offlineSubs = offlineSubs;

  final List<Subscription> _subs;
  @override
  @JsonKey()
  List<Subscription> get subs {
    if (_subs is EqualUnmodifiableListView) return _subs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subs);
  }

  final List<OfflineSubscription> _offlineSubs;
  @override
  @JsonKey()
  List<OfflineSubscription> get offlineSubs {
    if (_offlineSubs is EqualUnmodifiableListView) return _offlineSubs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_offlineSubs);
  }

  @override
  @JsonKey()
  final dynamic isLoggedIn;
  @override
  @JsonKey()
  final bool loading;

  /// Create a copy of ManageSubscriptionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ManageSubscriptionsStateCopyWith<_ManageSubscriptionsState> get copyWith =>
      __$ManageSubscriptionsStateCopyWithImpl<_ManageSubscriptionsState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ManageSubscriptionsState &&
            const DeepCollectionEquality().equals(other._subs, _subs) &&
            const DeepCollectionEquality()
                .equals(other._offlineSubs, _offlineSubs) &&
            const DeepCollectionEquality()
                .equals(other.isLoggedIn, isLoggedIn) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_subs),
      const DeepCollectionEquality().hash(_offlineSubs),
      const DeepCollectionEquality().hash(isLoggedIn),
      loading);

  @override
  String toString() {
    return 'ManageSubscriptionsState(subs: $subs, offlineSubs: $offlineSubs, isLoggedIn: $isLoggedIn, loading: $loading)';
  }
}

/// @nodoc
abstract mixin class _$ManageSubscriptionsStateCopyWith<$Res>
    implements $ManageSubscriptionsStateCopyWith<$Res> {
  factory _$ManageSubscriptionsStateCopyWith(_ManageSubscriptionsState value,
          $Res Function(_ManageSubscriptionsState) _then) =
      __$ManageSubscriptionsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Subscription> subs,
      List<OfflineSubscription> offlineSubs,
      dynamic isLoggedIn,
      bool loading});
}

/// @nodoc
class __$ManageSubscriptionsStateCopyWithImpl<$Res>
    implements _$ManageSubscriptionsStateCopyWith<$Res> {
  __$ManageSubscriptionsStateCopyWithImpl(this._self, this._then);

  final _ManageSubscriptionsState _self;
  final $Res Function(_ManageSubscriptionsState) _then;

  /// Create a copy of ManageSubscriptionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subs = null,
    Object? offlineSubs = null,
    Object? isLoggedIn = freezed,
    Object? loading = null,
  }) {
    return _then(_ManageSubscriptionsState(
      subs: null == subs
          ? _self._subs
          : subs // ignore: cast_nullable_to_non_nullable
              as List<Subscription>,
      offlineSubs: null == offlineSubs
          ? _self._offlineSubs
          : offlineSubs // ignore: cast_nullable_to_non_nullable
              as List<OfflineSubscription>,
      isLoggedIn: freezed == isLoggedIn
          ? _self.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as dynamic,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
