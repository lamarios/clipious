// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryItemState {
  String get videoId;
  bool get loading;
  HistoryVideoCache? get cachedVid;

  /// Create a copy of HistoryItemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HistoryItemStateCopyWith<HistoryItemState> get copyWith =>
      _$HistoryItemStateCopyWithImpl<HistoryItemState>(
          this as HistoryItemState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HistoryItemState &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.cachedVid, cachedVid) ||
                other.cachedVid == cachedVid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoId, loading, cachedVid);

  @override
  String toString() {
    return 'HistoryItemState(videoId: $videoId, loading: $loading, cachedVid: $cachedVid)';
  }
}

/// @nodoc
abstract mixin class $HistoryItemStateCopyWith<$Res> {
  factory $HistoryItemStateCopyWith(
          HistoryItemState value, $Res Function(HistoryItemState) _then) =
      _$HistoryItemStateCopyWithImpl;
  @useResult
  $Res call({String videoId, bool loading, HistoryVideoCache? cachedVid});
}

/// @nodoc
class _$HistoryItemStateCopyWithImpl<$Res>
    implements $HistoryItemStateCopyWith<$Res> {
  _$HistoryItemStateCopyWithImpl(this._self, this._then);

  final HistoryItemState _self;
  final $Res Function(HistoryItemState) _then;

  /// Create a copy of HistoryItemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = null,
    Object? loading = null,
    Object? cachedVid = freezed,
  }) {
    return _then(_self.copyWith(
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      cachedVid: freezed == cachedVid
          ? _self.cachedVid
          : cachedVid // ignore: cast_nullable_to_non_nullable
              as HistoryVideoCache?,
    ));
  }
}

/// Adds pattern-matching-related methods to [HistoryItemState].
extension HistoryItemStatePatterns on HistoryItemState {
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
    TResult Function(_HistoryItemState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HistoryItemState() when $default != null:
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
    TResult Function(_HistoryItemState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryItemState():
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
    TResult? Function(_HistoryItemState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryItemState() when $default != null:
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
            String videoId, bool loading, HistoryVideoCache? cachedVid)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HistoryItemState() when $default != null:
        return $default(_that.videoId, _that.loading, _that.cachedVid);
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
    TResult Function(String videoId, bool loading, HistoryVideoCache? cachedVid)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryItemState():
        return $default(_that.videoId, _that.loading, _that.cachedVid);
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
            String videoId, bool loading, HistoryVideoCache? cachedVid)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryItemState() when $default != null:
        return $default(_that.videoId, _that.loading, _that.cachedVid);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HistoryItemState implements HistoryItemState {
  const _HistoryItemState(
      {required this.videoId, this.loading = true, this.cachedVid});

  @override
  final String videoId;
  @override
  @JsonKey()
  final bool loading;
  @override
  final HistoryVideoCache? cachedVid;

  /// Create a copy of HistoryItemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HistoryItemStateCopyWith<_HistoryItemState> get copyWith =>
      __$HistoryItemStateCopyWithImpl<_HistoryItemState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HistoryItemState &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.cachedVid, cachedVid) ||
                other.cachedVid == cachedVid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoId, loading, cachedVid);

  @override
  String toString() {
    return 'HistoryItemState(videoId: $videoId, loading: $loading, cachedVid: $cachedVid)';
  }
}

/// @nodoc
abstract mixin class _$HistoryItemStateCopyWith<$Res>
    implements $HistoryItemStateCopyWith<$Res> {
  factory _$HistoryItemStateCopyWith(
          _HistoryItemState value, $Res Function(_HistoryItemState) _then) =
      __$HistoryItemStateCopyWithImpl;
  @override
  @useResult
  $Res call({String videoId, bool loading, HistoryVideoCache? cachedVid});
}

/// @nodoc
class __$HistoryItemStateCopyWithImpl<$Res>
    implements _$HistoryItemStateCopyWith<$Res> {
  __$HistoryItemStateCopyWithImpl(this._self, this._then);

  final _HistoryItemState _self;
  final $Res Function(_HistoryItemState) _then;

  /// Create a copy of HistoryItemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoId = null,
    Object? loading = null,
    Object? cachedVid = freezed,
  }) {
    return _then(_HistoryItemState(
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      cachedVid: freezed == cachedVid
          ? _self.cachedVid
          : cachedVid // ignore: cast_nullable_to_non_nullable
              as HistoryVideoCache?,
    ));
  }
}

// dart format on
