// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TvSearchState {
  bool get hasVideos;
  bool get hasChannels;
  bool get hasPlaylists;

  /// Create a copy of TvSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TvSearchStateCopyWith<TvSearchState> get copyWith =>
      _$TvSearchStateCopyWithImpl<TvSearchState>(
          this as TvSearchState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TvSearchState &&
            (identical(other.hasVideos, hasVideos) ||
                other.hasVideos == hasVideos) &&
            (identical(other.hasChannels, hasChannels) ||
                other.hasChannels == hasChannels) &&
            (identical(other.hasPlaylists, hasPlaylists) ||
                other.hasPlaylists == hasPlaylists));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, hasVideos, hasChannels, hasPlaylists);

  @override
  String toString() {
    return 'TvSearchState(hasVideos: $hasVideos, hasChannels: $hasChannels, hasPlaylists: $hasPlaylists)';
  }
}

/// @nodoc
abstract mixin class $TvSearchStateCopyWith<$Res> {
  factory $TvSearchStateCopyWith(
          TvSearchState value, $Res Function(TvSearchState) _then) =
      _$TvSearchStateCopyWithImpl;
  @useResult
  $Res call({bool hasVideos, bool hasChannels, bool hasPlaylists});
}

/// @nodoc
class _$TvSearchStateCopyWithImpl<$Res>
    implements $TvSearchStateCopyWith<$Res> {
  _$TvSearchStateCopyWithImpl(this._self, this._then);

  final TvSearchState _self;
  final $Res Function(TvSearchState) _then;

  /// Create a copy of TvSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasVideos = null,
    Object? hasChannels = null,
    Object? hasPlaylists = null,
  }) {
    return _then(_self.copyWith(
      hasVideos: null == hasVideos
          ? _self.hasVideos
          : hasVideos // ignore: cast_nullable_to_non_nullable
              as bool,
      hasChannels: null == hasChannels
          ? _self.hasChannels
          : hasChannels // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPlaylists: null == hasPlaylists
          ? _self.hasPlaylists
          : hasPlaylists // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [TvSearchState].
extension TvSearchStatePatterns on TvSearchState {
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
    TResult Function(_TvSearchState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvSearchState() when $default != null:
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
    TResult Function(_TvSearchState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvSearchState():
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
    TResult? Function(_TvSearchState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvSearchState() when $default != null:
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
    TResult Function(bool hasVideos, bool hasChannels, bool hasPlaylists)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvSearchState() when $default != null:
        return $default(_that.hasVideos, _that.hasChannels, _that.hasPlaylists);
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
    TResult Function(bool hasVideos, bool hasChannels, bool hasPlaylists)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvSearchState():
        return $default(_that.hasVideos, _that.hasChannels, _that.hasPlaylists);
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
    TResult? Function(bool hasVideos, bool hasChannels, bool hasPlaylists)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvSearchState() when $default != null:
        return $default(_that.hasVideos, _that.hasChannels, _that.hasPlaylists);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TvSearchState implements TvSearchState {
  const _TvSearchState(
      {this.hasVideos = false,
      this.hasChannels = false,
      this.hasPlaylists = false});

  @override
  @JsonKey()
  final bool hasVideos;
  @override
  @JsonKey()
  final bool hasChannels;
  @override
  @JsonKey()
  final bool hasPlaylists;

  /// Create a copy of TvSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TvSearchStateCopyWith<_TvSearchState> get copyWith =>
      __$TvSearchStateCopyWithImpl<_TvSearchState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TvSearchState &&
            (identical(other.hasVideos, hasVideos) ||
                other.hasVideos == hasVideos) &&
            (identical(other.hasChannels, hasChannels) ||
                other.hasChannels == hasChannels) &&
            (identical(other.hasPlaylists, hasPlaylists) ||
                other.hasPlaylists == hasPlaylists));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, hasVideos, hasChannels, hasPlaylists);

  @override
  String toString() {
    return 'TvSearchState(hasVideos: $hasVideos, hasChannels: $hasChannels, hasPlaylists: $hasPlaylists)';
  }
}

/// @nodoc
abstract mixin class _$TvSearchStateCopyWith<$Res>
    implements $TvSearchStateCopyWith<$Res> {
  factory _$TvSearchStateCopyWith(
          _TvSearchState value, $Res Function(_TvSearchState) _then) =
      __$TvSearchStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool hasVideos, bool hasChannels, bool hasPlaylists});
}

/// @nodoc
class __$TvSearchStateCopyWithImpl<$Res>
    implements _$TvSearchStateCopyWith<$Res> {
  __$TvSearchStateCopyWithImpl(this._self, this._then);

  final _TvSearchState _self;
  final $Res Function(_TvSearchState) _then;

  /// Create a copy of TvSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hasVideos = null,
    Object? hasChannels = null,
    Object? hasPlaylists = null,
  }) {
    return _then(_TvSearchState(
      hasVideos: null == hasVideos
          ? _self.hasVideos
          : hasVideos // ignore: cast_nullable_to_non_nullable
              as bool,
      hasChannels: null == hasChannels
          ? _self.hasChannels
          : hasChannels // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPlaylists: null == hasPlaylists
          ? _self.hasPlaylists
          : hasPlaylists // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
