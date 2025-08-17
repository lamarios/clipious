// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_container.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentsContainerState {
  String get source;
  String get sortBy;

  /// Create a copy of CommentsContainerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentsContainerStateCopyWith<CommentsContainerState> get copyWith =>
      _$CommentsContainerStateCopyWithImpl<CommentsContainerState>(
          this as CommentsContainerState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentsContainerState &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source, sortBy);

  @override
  String toString() {
    return 'CommentsContainerState(source: $source, sortBy: $sortBy)';
  }
}

/// @nodoc
abstract mixin class $CommentsContainerStateCopyWith<$Res> {
  factory $CommentsContainerStateCopyWith(CommentsContainerState value,
          $Res Function(CommentsContainerState) _then) =
      _$CommentsContainerStateCopyWithImpl;
  @useResult
  $Res call({String source, String sortBy});
}

/// @nodoc
class _$CommentsContainerStateCopyWithImpl<$Res>
    implements $CommentsContainerStateCopyWith<$Res> {
  _$CommentsContainerStateCopyWithImpl(this._self, this._then);

  final CommentsContainerState _self;
  final $Res Function(CommentsContainerState) _then;

  /// Create a copy of CommentsContainerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? sortBy = null,
  }) {
    return _then(_self.copyWith(
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      sortBy: null == sortBy
          ? _self.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [CommentsContainerState].
extension CommentsContainerStatePatterns on CommentsContainerState {
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
    TResult Function(_CommentsContainerState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CommentsContainerState() when $default != null:
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
    TResult Function(_CommentsContainerState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommentsContainerState():
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
    TResult? Function(_CommentsContainerState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommentsContainerState() when $default != null:
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
    TResult Function(String source, String sortBy)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CommentsContainerState() when $default != null:
        return $default(_that.source, _that.sortBy);
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
    TResult Function(String source, String sortBy) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommentsContainerState():
        return $default(_that.source, _that.sortBy);
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
    TResult? Function(String source, String sortBy)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommentsContainerState() when $default != null:
        return $default(_that.source, _that.sortBy);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CommentsContainerState implements CommentsContainerState {
  const _CommentsContainerState({this.source = 'youtube', this.sortBy = 'top'});

  @override
  @JsonKey()
  final String source;
  @override
  @JsonKey()
  final String sortBy;

  /// Create a copy of CommentsContainerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CommentsContainerStateCopyWith<_CommentsContainerState> get copyWith =>
      __$CommentsContainerStateCopyWithImpl<_CommentsContainerState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentsContainerState &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source, sortBy);

  @override
  String toString() {
    return 'CommentsContainerState(source: $source, sortBy: $sortBy)';
  }
}

/// @nodoc
abstract mixin class _$CommentsContainerStateCopyWith<$Res>
    implements $CommentsContainerStateCopyWith<$Res> {
  factory _$CommentsContainerStateCopyWith(_CommentsContainerState value,
          $Res Function(_CommentsContainerState) _then) =
      __$CommentsContainerStateCopyWithImpl;
  @override
  @useResult
  $Res call({String source, String sortBy});
}

/// @nodoc
class __$CommentsContainerStateCopyWithImpl<$Res>
    implements _$CommentsContainerStateCopyWith<$Res> {
  __$CommentsContainerStateCopyWithImpl(this._self, this._then);

  final _CommentsContainerState _self;
  final $Res Function(_CommentsContainerState) _then;

  /// Create a copy of CommentsContainerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? source = null,
    Object? sortBy = null,
  }) {
    return _then(_CommentsContainerState(
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      sortBy: null == sortBy
          ? _self.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
