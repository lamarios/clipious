// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoFilterState {
  List<VideoFilter> get filters;
  bool get hideFilteredVideos;

  /// Create a copy of VideoFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoFilterStateCopyWith<VideoFilterState> get copyWith =>
      _$VideoFilterStateCopyWithImpl<VideoFilterState>(
          this as VideoFilterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoFilterState &&
            const DeepCollectionEquality().equals(other.filters, filters) &&
            (identical(other.hideFilteredVideos, hideFilteredVideos) ||
                other.hideFilteredVideos == hideFilteredVideos));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(filters), hideFilteredVideos);

  @override
  String toString() {
    return 'VideoFilterState(filters: $filters, hideFilteredVideos: $hideFilteredVideos)';
  }
}

/// @nodoc
abstract mixin class $VideoFilterStateCopyWith<$Res> {
  factory $VideoFilterStateCopyWith(
          VideoFilterState value, $Res Function(VideoFilterState) _then) =
      _$VideoFilterStateCopyWithImpl;
  @useResult
  $Res call({List<VideoFilter> filters, bool hideFilteredVideos});
}

/// @nodoc
class _$VideoFilterStateCopyWithImpl<$Res>
    implements $VideoFilterStateCopyWith<$Res> {
  _$VideoFilterStateCopyWithImpl(this._self, this._then);

  final VideoFilterState _self;
  final $Res Function(VideoFilterState) _then;

  /// Create a copy of VideoFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? hideFilteredVideos = null,
  }) {
    return _then(_self.copyWith(
      filters: null == filters
          ? _self.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<VideoFilter>,
      hideFilteredVideos: null == hideFilteredVideos
          ? _self.hideFilteredVideos
          : hideFilteredVideos // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [VideoFilterState].
extension VideoFilterStatePatterns on VideoFilterState {
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
    TResult Function(_VideoFilterState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoFilterState() when $default != null:
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
    TResult Function(_VideoFilterState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoFilterState():
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
    TResult? Function(_VideoFilterState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoFilterState() when $default != null:
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
    TResult Function(List<VideoFilter> filters, bool hideFilteredVideos)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoFilterState() when $default != null:
        return $default(_that.filters, _that.hideFilteredVideos);
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
    TResult Function(List<VideoFilter> filters, bool hideFilteredVideos)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoFilterState():
        return $default(_that.filters, _that.hideFilteredVideos);
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
    TResult? Function(List<VideoFilter> filters, bool hideFilteredVideos)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoFilterState() when $default != null:
        return $default(_that.filters, _that.hideFilteredVideos);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VideoFilterState implements VideoFilterState {
  const _VideoFilterState(
      {final List<VideoFilter> filters = const [],
      this.hideFilteredVideos = false})
      : _filters = filters;

  final List<VideoFilter> _filters;
  @override
  @JsonKey()
  List<VideoFilter> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  @override
  @JsonKey()
  final bool hideFilteredVideos;

  /// Create a copy of VideoFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VideoFilterStateCopyWith<_VideoFilterState> get copyWith =>
      __$VideoFilterStateCopyWithImpl<_VideoFilterState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoFilterState &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.hideFilteredVideos, hideFilteredVideos) ||
                other.hideFilteredVideos == hideFilteredVideos));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_filters), hideFilteredVideos);

  @override
  String toString() {
    return 'VideoFilterState(filters: $filters, hideFilteredVideos: $hideFilteredVideos)';
  }
}

/// @nodoc
abstract mixin class _$VideoFilterStateCopyWith<$Res>
    implements $VideoFilterStateCopyWith<$Res> {
  factory _$VideoFilterStateCopyWith(
          _VideoFilterState value, $Res Function(_VideoFilterState) _then) =
      __$VideoFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<VideoFilter> filters, bool hideFilteredVideos});
}

/// @nodoc
class __$VideoFilterStateCopyWithImpl<$Res>
    implements _$VideoFilterStateCopyWith<$Res> {
  __$VideoFilterStateCopyWithImpl(this._self, this._then);

  final _VideoFilterState _self;
  final $Res Function(_VideoFilterState) _then;

  /// Create a copy of VideoFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? filters = null,
    Object? hideFilteredVideos = null,
  }) {
    return _then(_VideoFilterState(
      filters: null == filters
          ? _self._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<VideoFilter>,
      hideFilteredVideos: null == hideFilteredVideos
          ? _self.hideFilteredVideos
          : hideFilteredVideos // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
