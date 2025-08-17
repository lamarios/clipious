// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_filter_channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoFilterChannelState {
  List<VideoFilter> get filters;
  Channel? get channel;
  bool get loading;

  /// Create a copy of VideoFilterChannelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoFilterChannelStateCopyWith<VideoFilterChannelState> get copyWith =>
      _$VideoFilterChannelStateCopyWithImpl<VideoFilterChannelState>(
          this as VideoFilterChannelState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoFilterChannelState &&
            const DeepCollectionEquality().equals(other.filters, filters) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(filters), channel, loading);

  @override
  String toString() {
    return 'VideoFilterChannelState(filters: $filters, channel: $channel, loading: $loading)';
  }
}

/// @nodoc
abstract mixin class $VideoFilterChannelStateCopyWith<$Res> {
  factory $VideoFilterChannelStateCopyWith(VideoFilterChannelState value,
          $Res Function(VideoFilterChannelState) _then) =
      _$VideoFilterChannelStateCopyWithImpl;
  @useResult
  $Res call({List<VideoFilter> filters, Channel? channel, bool loading});
}

/// @nodoc
class _$VideoFilterChannelStateCopyWithImpl<$Res>
    implements $VideoFilterChannelStateCopyWith<$Res> {
  _$VideoFilterChannelStateCopyWithImpl(this._self, this._then);

  final VideoFilterChannelState _self;
  final $Res Function(VideoFilterChannelState) _then;

  /// Create a copy of VideoFilterChannelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? channel = freezed,
    Object? loading = null,
  }) {
    return _then(_self.copyWith(
      filters: null == filters
          ? _self.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<VideoFilter>,
      channel: freezed == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [VideoFilterChannelState].
extension VideoFilterChannelStatePatterns on VideoFilterChannelState {
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
    TResult Function(_VideoFilterChannelState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoFilterChannelState() when $default != null:
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
    TResult Function(_VideoFilterChannelState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoFilterChannelState():
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
    TResult? Function(_VideoFilterChannelState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoFilterChannelState() when $default != null:
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
    TResult Function(List<VideoFilter> filters, Channel? channel, bool loading)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoFilterChannelState() when $default != null:
        return $default(_that.filters, _that.channel, _that.loading);
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
    TResult Function(List<VideoFilter> filters, Channel? channel, bool loading)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoFilterChannelState():
        return $default(_that.filters, _that.channel, _that.loading);
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
            List<VideoFilter> filters, Channel? channel, bool loading)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoFilterChannelState() when $default != null:
        return $default(_that.filters, _that.channel, _that.loading);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VideoFilterChannelState implements VideoFilterChannelState {
  const _VideoFilterChannelState(
      {required final List<VideoFilter> filters,
      this.channel,
      this.loading = false})
      : _filters = filters;

  final List<VideoFilter> _filters;
  @override
  List<VideoFilter> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  @override
  final Channel? channel;
  @override
  @JsonKey()
  final bool loading;

  /// Create a copy of VideoFilterChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VideoFilterChannelStateCopyWith<_VideoFilterChannelState> get copyWith =>
      __$VideoFilterChannelStateCopyWithImpl<_VideoFilterChannelState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoFilterChannelState &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_filters), channel, loading);

  @override
  String toString() {
    return 'VideoFilterChannelState(filters: $filters, channel: $channel, loading: $loading)';
  }
}

/// @nodoc
abstract mixin class _$VideoFilterChannelStateCopyWith<$Res>
    implements $VideoFilterChannelStateCopyWith<$Res> {
  factory _$VideoFilterChannelStateCopyWith(_VideoFilterChannelState value,
          $Res Function(_VideoFilterChannelState) _then) =
      __$VideoFilterChannelStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<VideoFilter> filters, Channel? channel, bool loading});
}

/// @nodoc
class __$VideoFilterChannelStateCopyWithImpl<$Res>
    implements _$VideoFilterChannelStateCopyWith<$Res> {
  __$VideoFilterChannelStateCopyWithImpl(this._self, this._then);

  final _VideoFilterChannelState _self;
  final $Res Function(_VideoFilterChannelState) _then;

  /// Create a copy of VideoFilterChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? filters = null,
    Object? channel = freezed,
    Object? loading = null,
  }) {
    return _then(_VideoFilterChannelState(
      filters: null == filters
          ? _self._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<VideoFilter>,
      channel: freezed == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
