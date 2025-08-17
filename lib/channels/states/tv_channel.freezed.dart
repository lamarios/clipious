// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TvChannelController {
  bool get showBackground;
  bool get hasShorts;
  bool get hasVideos;
  bool get hasStreams;
  bool get hasPlaylist;

  /// Create a copy of TvChannelController
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TvChannelControllerCopyWith<TvChannelController> get copyWith =>
      _$TvChannelControllerCopyWithImpl<TvChannelController>(
          this as TvChannelController, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TvChannelController &&
            (identical(other.showBackground, showBackground) ||
                other.showBackground == showBackground) &&
            (identical(other.hasShorts, hasShorts) ||
                other.hasShorts == hasShorts) &&
            (identical(other.hasVideos, hasVideos) ||
                other.hasVideos == hasVideos) &&
            (identical(other.hasStreams, hasStreams) ||
                other.hasStreams == hasStreams) &&
            (identical(other.hasPlaylist, hasPlaylist) ||
                other.hasPlaylist == hasPlaylist));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showBackground, hasShorts,
      hasVideos, hasStreams, hasPlaylist);

  @override
  String toString() {
    return 'TvChannelController(showBackground: $showBackground, hasShorts: $hasShorts, hasVideos: $hasVideos, hasStreams: $hasStreams, hasPlaylist: $hasPlaylist)';
  }
}

/// @nodoc
abstract mixin class $TvChannelControllerCopyWith<$Res> {
  factory $TvChannelControllerCopyWith(
          TvChannelController value, $Res Function(TvChannelController) _then) =
      _$TvChannelControllerCopyWithImpl;
  @useResult
  $Res call(
      {bool showBackground,
      bool hasShorts,
      bool hasVideos,
      bool hasStreams,
      bool hasPlaylist});
}

/// @nodoc
class _$TvChannelControllerCopyWithImpl<$Res>
    implements $TvChannelControllerCopyWith<$Res> {
  _$TvChannelControllerCopyWithImpl(this._self, this._then);

  final TvChannelController _self;
  final $Res Function(TvChannelController) _then;

  /// Create a copy of TvChannelController
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showBackground = null,
    Object? hasShorts = null,
    Object? hasVideos = null,
    Object? hasStreams = null,
    Object? hasPlaylist = null,
  }) {
    return _then(_self.copyWith(
      showBackground: null == showBackground
          ? _self.showBackground
          : showBackground // ignore: cast_nullable_to_non_nullable
              as bool,
      hasShorts: null == hasShorts
          ? _self.hasShorts
          : hasShorts // ignore: cast_nullable_to_non_nullable
              as bool,
      hasVideos: null == hasVideos
          ? _self.hasVideos
          : hasVideos // ignore: cast_nullable_to_non_nullable
              as bool,
      hasStreams: null == hasStreams
          ? _self.hasStreams
          : hasStreams // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPlaylist: null == hasPlaylist
          ? _self.hasPlaylist
          : hasPlaylist // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [TvChannelController].
extension TvChannelControllerPatterns on TvChannelController {
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
    TResult Function(_TvChannelController value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvChannelController() when $default != null:
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
    TResult Function(_TvChannelController value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvChannelController():
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
    TResult? Function(_TvChannelController value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvChannelController() when $default != null:
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
    TResult Function(bool showBackground, bool hasShorts, bool hasVideos,
            bool hasStreams, bool hasPlaylist)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvChannelController() when $default != null:
        return $default(_that.showBackground, _that.hasShorts, _that.hasVideos,
            _that.hasStreams, _that.hasPlaylist);
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
    TResult Function(bool showBackground, bool hasShorts, bool hasVideos,
            bool hasStreams, bool hasPlaylist)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvChannelController():
        return $default(_that.showBackground, _that.hasShorts, _that.hasVideos,
            _that.hasStreams, _that.hasPlaylist);
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
    TResult? Function(bool showBackground, bool hasShorts, bool hasVideos,
            bool hasStreams, bool hasPlaylist)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvChannelController() when $default != null:
        return $default(_that.showBackground, _that.hasShorts, _that.hasVideos,
            _that.hasStreams, _that.hasPlaylist);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TvChannelController implements TvChannelController {
  const _TvChannelController(
      {this.showBackground = false,
      this.hasShorts = false,
      this.hasVideos = false,
      this.hasStreams = false,
      this.hasPlaylist = false});

  @override
  @JsonKey()
  final bool showBackground;
  @override
  @JsonKey()
  final bool hasShorts;
  @override
  @JsonKey()
  final bool hasVideos;
  @override
  @JsonKey()
  final bool hasStreams;
  @override
  @JsonKey()
  final bool hasPlaylist;

  /// Create a copy of TvChannelController
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TvChannelControllerCopyWith<_TvChannelController> get copyWith =>
      __$TvChannelControllerCopyWithImpl<_TvChannelController>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TvChannelController &&
            (identical(other.showBackground, showBackground) ||
                other.showBackground == showBackground) &&
            (identical(other.hasShorts, hasShorts) ||
                other.hasShorts == hasShorts) &&
            (identical(other.hasVideos, hasVideos) ||
                other.hasVideos == hasVideos) &&
            (identical(other.hasStreams, hasStreams) ||
                other.hasStreams == hasStreams) &&
            (identical(other.hasPlaylist, hasPlaylist) ||
                other.hasPlaylist == hasPlaylist));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showBackground, hasShorts,
      hasVideos, hasStreams, hasPlaylist);

  @override
  String toString() {
    return 'TvChannelController(showBackground: $showBackground, hasShorts: $hasShorts, hasVideos: $hasVideos, hasStreams: $hasStreams, hasPlaylist: $hasPlaylist)';
  }
}

/// @nodoc
abstract mixin class _$TvChannelControllerCopyWith<$Res>
    implements $TvChannelControllerCopyWith<$Res> {
  factory _$TvChannelControllerCopyWith(_TvChannelController value,
          $Res Function(_TvChannelController) _then) =
      __$TvChannelControllerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool showBackground,
      bool hasShorts,
      bool hasVideos,
      bool hasStreams,
      bool hasPlaylist});
}

/// @nodoc
class __$TvChannelControllerCopyWithImpl<$Res>
    implements _$TvChannelControllerCopyWith<$Res> {
  __$TvChannelControllerCopyWithImpl(this._self, this._then);

  final _TvChannelController _self;
  final $Res Function(_TvChannelController) _then;

  /// Create a copy of TvChannelController
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? showBackground = null,
    Object? hasShorts = null,
    Object? hasVideos = null,
    Object? hasStreams = null,
    Object? hasPlaylist = null,
  }) {
    return _then(_TvChannelController(
      showBackground: null == showBackground
          ? _self.showBackground
          : showBackground // ignore: cast_nullable_to_non_nullable
              as bool,
      hasShorts: null == hasShorts
          ? _self.hasShorts
          : hasShorts // ignore: cast_nullable_to_non_nullable
              as bool,
      hasVideos: null == hasVideos
          ? _self.hasVideos
          : hasVideos // ignore: cast_nullable_to_non_nullable
              as bool,
      hasStreams: null == hasStreams
          ? _self.hasStreams
          : hasStreams // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPlaylist: null == hasPlaylist
          ? _self.hasPlaylist
          : hasPlaylist // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
