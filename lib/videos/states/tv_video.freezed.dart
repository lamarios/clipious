// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TvVideoState {
  bool get showImage;

  /// Create a copy of TvVideoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TvVideoStateCopyWith<TvVideoState> get copyWith =>
      _$TvVideoStateCopyWithImpl<TvVideoState>(
          this as TvVideoState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TvVideoState &&
            (identical(other.showImage, showImage) ||
                other.showImage == showImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showImage);

  @override
  String toString() {
    return 'TvVideoState(showImage: $showImage)';
  }
}

/// @nodoc
abstract mixin class $TvVideoStateCopyWith<$Res> {
  factory $TvVideoStateCopyWith(
          TvVideoState value, $Res Function(TvVideoState) _then) =
      _$TvVideoStateCopyWithImpl;
  @useResult
  $Res call({bool showImage});
}

/// @nodoc
class _$TvVideoStateCopyWithImpl<$Res> implements $TvVideoStateCopyWith<$Res> {
  _$TvVideoStateCopyWithImpl(this._self, this._then);

  final TvVideoState _self;
  final $Res Function(TvVideoState) _then;

  /// Create a copy of TvVideoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showImage = null,
  }) {
    return _then(_self.copyWith(
      showImage: null == showImage
          ? _self.showImage
          : showImage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [TvVideoState].
extension TvVideoStatePatterns on TvVideoState {
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
    TResult Function(_TvVideoState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvVideoState() when $default != null:
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
    TResult Function(_TvVideoState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvVideoState():
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
    TResult? Function(_TvVideoState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvVideoState() when $default != null:
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
    TResult Function(bool showImage)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvVideoState() when $default != null:
        return $default(_that.showImage);
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
    TResult Function(bool showImage) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvVideoState():
        return $default(_that.showImage);
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
    TResult? Function(bool showImage)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvVideoState() when $default != null:
        return $default(_that.showImage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TvVideoState implements TvVideoState {
  const _TvVideoState({this.showImage = true});

  @override
  @JsonKey()
  final bool showImage;

  /// Create a copy of TvVideoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TvVideoStateCopyWith<_TvVideoState> get copyWith =>
      __$TvVideoStateCopyWithImpl<_TvVideoState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TvVideoState &&
            (identical(other.showImage, showImage) ||
                other.showImage == showImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showImage);

  @override
  String toString() {
    return 'TvVideoState(showImage: $showImage)';
  }
}

/// @nodoc
abstract mixin class _$TvVideoStateCopyWith<$Res>
    implements $TvVideoStateCopyWith<$Res> {
  factory _$TvVideoStateCopyWith(
          _TvVideoState value, $Res Function(_TvVideoState) _then) =
      __$TvVideoStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool showImage});
}

/// @nodoc
class __$TvVideoStateCopyWithImpl<$Res>
    implements _$TvVideoStateCopyWith<$Res> {
  __$TvVideoStateCopyWithImpl(this._self, this._then);

  final _TvVideoState _self;
  final $Res Function(_TvVideoState) _then;

  /// Create a copy of TvVideoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? showImage = null,
  }) {
    return _then(_TvVideoState(
      showImage: null == showImage
          ? _self.showImage
          : showImage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
