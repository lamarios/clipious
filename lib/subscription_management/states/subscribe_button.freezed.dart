// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscribe_button.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscribeButtonState {
  String get channelId;
  bool get isOfflineSubscribed;
  bool get isAccountSubscribed;
  bool get loading;
  bool get isLoggedIn;

  /// Create a copy of SubscribeButtonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscribeButtonStateCopyWith<SubscribeButtonState> get copyWith =>
      _$SubscribeButtonStateCopyWithImpl<SubscribeButtonState>(
          this as SubscribeButtonState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscribeButtonState &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.isOfflineSubscribed, isOfflineSubscribed) ||
                other.isOfflineSubscribed == isOfflineSubscribed) &&
            (identical(other.isAccountSubscribed, isAccountSubscribed) ||
                other.isAccountSubscribed == isAccountSubscribed) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, isOfflineSubscribed,
      isAccountSubscribed, loading, isLoggedIn);

  @override
  String toString() {
    return 'SubscribeButtonState(channelId: $channelId, isOfflineSubscribed: $isOfflineSubscribed, isAccountSubscribed: $isAccountSubscribed, loading: $loading, isLoggedIn: $isLoggedIn)';
  }
}

/// @nodoc
abstract mixin class $SubscribeButtonStateCopyWith<$Res> {
  factory $SubscribeButtonStateCopyWith(SubscribeButtonState value,
          $Res Function(SubscribeButtonState) _then) =
      _$SubscribeButtonStateCopyWithImpl;
  @useResult
  $Res call(
      {String channelId,
      bool isOfflineSubscribed,
      bool isAccountSubscribed,
      bool loading,
      bool isLoggedIn});
}

/// @nodoc
class _$SubscribeButtonStateCopyWithImpl<$Res>
    implements $SubscribeButtonStateCopyWith<$Res> {
  _$SubscribeButtonStateCopyWithImpl(this._self, this._then);

  final SubscribeButtonState _self;
  final $Res Function(SubscribeButtonState) _then;

  /// Create a copy of SubscribeButtonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? isOfflineSubscribed = null,
    Object? isAccountSubscribed = null,
    Object? loading = null,
    Object? isLoggedIn = null,
  }) {
    return _then(_self.copyWith(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      isOfflineSubscribed: null == isOfflineSubscribed
          ? _self.isOfflineSubscribed
          : isOfflineSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccountSubscribed: null == isAccountSubscribed
          ? _self.isAccountSubscribed
          : isAccountSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: null == isLoggedIn
          ? _self.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubscribeButtonState].
extension SubscribeButtonStatePatterns on SubscribeButtonState {
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
    TResult Function(_SubscribeButtonState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscribeButtonState() when $default != null:
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
    TResult Function(_SubscribeButtonState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscribeButtonState():
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
    TResult? Function(_SubscribeButtonState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscribeButtonState() when $default != null:
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
    TResult Function(String channelId, bool isOfflineSubscribed,
            bool isAccountSubscribed, bool loading, bool isLoggedIn)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscribeButtonState() when $default != null:
        return $default(_that.channelId, _that.isOfflineSubscribed,
            _that.isAccountSubscribed, _that.loading, _that.isLoggedIn);
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
    TResult Function(String channelId, bool isOfflineSubscribed,
            bool isAccountSubscribed, bool loading, bool isLoggedIn)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscribeButtonState():
        return $default(_that.channelId, _that.isOfflineSubscribed,
            _that.isAccountSubscribed, _that.loading, _that.isLoggedIn);
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
    TResult? Function(String channelId, bool isOfflineSubscribed,
            bool isAccountSubscribed, bool loading, bool isLoggedIn)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscribeButtonState() when $default != null:
        return $default(_that.channelId, _that.isOfflineSubscribed,
            _that.isAccountSubscribed, _that.loading, _that.isLoggedIn);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SubscribeButtonState extends SubscribeButtonState {
  const _SubscribeButtonState(
      {required this.channelId,
      this.isOfflineSubscribed = false,
      this.isAccountSubscribed = false,
      this.loading = true,
      required this.isLoggedIn})
      : super._();

  @override
  final String channelId;
  @override
  @JsonKey()
  final bool isOfflineSubscribed;
  @override
  @JsonKey()
  final bool isAccountSubscribed;
  @override
  @JsonKey()
  final bool loading;
  @override
  final bool isLoggedIn;

  /// Create a copy of SubscribeButtonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscribeButtonStateCopyWith<_SubscribeButtonState> get copyWith =>
      __$SubscribeButtonStateCopyWithImpl<_SubscribeButtonState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscribeButtonState &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.isOfflineSubscribed, isOfflineSubscribed) ||
                other.isOfflineSubscribed == isOfflineSubscribed) &&
            (identical(other.isAccountSubscribed, isAccountSubscribed) ||
                other.isAccountSubscribed == isAccountSubscribed) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, isOfflineSubscribed,
      isAccountSubscribed, loading, isLoggedIn);

  @override
  String toString() {
    return 'SubscribeButtonState(channelId: $channelId, isOfflineSubscribed: $isOfflineSubscribed, isAccountSubscribed: $isAccountSubscribed, loading: $loading, isLoggedIn: $isLoggedIn)';
  }
}

/// @nodoc
abstract mixin class _$SubscribeButtonStateCopyWith<$Res>
    implements $SubscribeButtonStateCopyWith<$Res> {
  factory _$SubscribeButtonStateCopyWith(_SubscribeButtonState value,
          $Res Function(_SubscribeButtonState) _then) =
      __$SubscribeButtonStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String channelId,
      bool isOfflineSubscribed,
      bool isAccountSubscribed,
      bool loading,
      bool isLoggedIn});
}

/// @nodoc
class __$SubscribeButtonStateCopyWithImpl<$Res>
    implements _$SubscribeButtonStateCopyWith<$Res> {
  __$SubscribeButtonStateCopyWithImpl(this._self, this._then);

  final _SubscribeButtonState _self;
  final $Res Function(_SubscribeButtonState) _then;

  /// Create a copy of SubscribeButtonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? isOfflineSubscribed = null,
    Object? isAccountSubscribed = null,
    Object? loading = null,
    Object? isLoggedIn = null,
  }) {
    return _then(_SubscribeButtonState(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      isOfflineSubscribed: null == isOfflineSubscribed
          ? _self.isOfflineSubscribed
          : isOfflineSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccountSubscribed: null == isAccountSubscribed
          ? _self.isAccountSubscribed
          : isAccountSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: null == isLoggedIn
          ? _self.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
