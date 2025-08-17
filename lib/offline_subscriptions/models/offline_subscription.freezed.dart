// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfflineSubscription {
  String get channelId;
  String get channelName;

  /// Create a copy of OfflineSubscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OfflineSubscriptionCopyWith<OfflineSubscription> get copyWith =>
      _$OfflineSubscriptionCopyWithImpl<OfflineSubscription>(
          this as OfflineSubscription, _$identity);

  /// Serializes this OfflineSubscription to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OfflineSubscription &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, channelId, channelName);

  @override
  String toString() {
    return 'OfflineSubscription(channelId: $channelId, channelName: $channelName)';
  }
}

/// @nodoc
abstract mixin class $OfflineSubscriptionCopyWith<$Res> {
  factory $OfflineSubscriptionCopyWith(
          OfflineSubscription value, $Res Function(OfflineSubscription) _then) =
      _$OfflineSubscriptionCopyWithImpl;
  @useResult
  $Res call({String channelId, String channelName});
}

/// @nodoc
class _$OfflineSubscriptionCopyWithImpl<$Res>
    implements $OfflineSubscriptionCopyWith<$Res> {
  _$OfflineSubscriptionCopyWithImpl(this._self, this._then);

  final OfflineSubscription _self;
  final $Res Function(OfflineSubscription) _then;

  /// Create a copy of OfflineSubscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
  }) {
    return _then(_self.copyWith(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _self.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [OfflineSubscription].
extension OfflineSubscriptionPatterns on OfflineSubscription {
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
    TResult Function(_OfflineSubscription value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OfflineSubscription() when $default != null:
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
    TResult Function(_OfflineSubscription value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfflineSubscription():
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
    TResult? Function(_OfflineSubscription value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfflineSubscription() when $default != null:
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
    TResult Function(String channelId, String channelName)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OfflineSubscription() when $default != null:
        return $default(_that.channelId, _that.channelName);
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
    TResult Function(String channelId, String channelName) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfflineSubscription():
        return $default(_that.channelId, _that.channelName);
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
    TResult? Function(String channelId, String channelName)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfflineSubscription() when $default != null:
        return $default(_that.channelId, _that.channelName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OfflineSubscription implements OfflineSubscription {
  const _OfflineSubscription(
      {required this.channelId, required this.channelName});
  factory _OfflineSubscription.fromJson(Map<String, dynamic> json) =>
      _$OfflineSubscriptionFromJson(json);

  @override
  final String channelId;
  @override
  final String channelName;

  /// Create a copy of OfflineSubscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OfflineSubscriptionCopyWith<_OfflineSubscription> get copyWith =>
      __$OfflineSubscriptionCopyWithImpl<_OfflineSubscription>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OfflineSubscriptionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OfflineSubscription &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, channelId, channelName);

  @override
  String toString() {
    return 'OfflineSubscription(channelId: $channelId, channelName: $channelName)';
  }
}

/// @nodoc
abstract mixin class _$OfflineSubscriptionCopyWith<$Res>
    implements $OfflineSubscriptionCopyWith<$Res> {
  factory _$OfflineSubscriptionCopyWith(_OfflineSubscription value,
          $Res Function(_OfflineSubscription) _then) =
      __$OfflineSubscriptionCopyWithImpl;
  @override
  @useResult
  $Res call({String channelId, String channelName});
}

/// @nodoc
class __$OfflineSubscriptionCopyWithImpl<$Res>
    implements _$OfflineSubscriptionCopyWith<$Res> {
  __$OfflineSubscriptionCopyWithImpl(this._self, this._then);

  final _OfflineSubscription _self;
  final $Res Function(_OfflineSubscription) _then;

  /// Create a copy of OfflineSubscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
  }) {
    return _then(_OfflineSubscription(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _self.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
