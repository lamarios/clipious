// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SingleCommentState {
  Comment get comment;
  bool get showingChildren;
  VideoComments? get children;

  /// Create a copy of SingleCommentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SingleCommentStateCopyWith<SingleCommentState> get copyWith =>
      _$SingleCommentStateCopyWithImpl<SingleCommentState>(
          this as SingleCommentState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SingleCommentState &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.showingChildren, showingChildren) ||
                other.showingChildren == showingChildren) &&
            (identical(other.children, children) ||
                other.children == children));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, comment, showingChildren, children);

  @override
  String toString() {
    return 'SingleCommentState(comment: $comment, showingChildren: $showingChildren, children: $children)';
  }
}

/// @nodoc
abstract mixin class $SingleCommentStateCopyWith<$Res> {
  factory $SingleCommentStateCopyWith(
          SingleCommentState value, $Res Function(SingleCommentState) _then) =
      _$SingleCommentStateCopyWithImpl;
  @useResult
  $Res call({Comment comment, bool showingChildren, VideoComments? children});
}

/// @nodoc
class _$SingleCommentStateCopyWithImpl<$Res>
    implements $SingleCommentStateCopyWith<$Res> {
  _$SingleCommentStateCopyWithImpl(this._self, this._then);

  final SingleCommentState _self;
  final $Res Function(SingleCommentState) _then;

  /// Create a copy of SingleCommentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? showingChildren = null,
    Object? children = freezed,
  }) {
    return _then(_self.copyWith(
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as Comment,
      showingChildren: null == showingChildren
          ? _self.showingChildren
          : showingChildren // ignore: cast_nullable_to_non_nullable
              as bool,
      children: freezed == children
          ? _self.children
          : children // ignore: cast_nullable_to_non_nullable
              as VideoComments?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SingleCommentState].
extension SingleCommentStatePatterns on SingleCommentState {
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
    TResult Function(_SingleCommentState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SingleCommentState() when $default != null:
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
    TResult Function(_SingleCommentState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleCommentState():
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
    TResult? Function(_SingleCommentState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleCommentState() when $default != null:
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
            Comment comment, bool showingChildren, VideoComments? children)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SingleCommentState() when $default != null:
        return $default(_that.comment, _that.showingChildren, _that.children);
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
            Comment comment, bool showingChildren, VideoComments? children)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleCommentState():
        return $default(_that.comment, _that.showingChildren, _that.children);
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
            Comment comment, bool showingChildren, VideoComments? children)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleCommentState() when $default != null:
        return $default(_that.comment, _that.showingChildren, _that.children);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SingleCommentState implements SingleCommentState {
  const _SingleCommentState(
      {required this.comment, this.showingChildren = false, this.children});

  @override
  final Comment comment;
  @override
  @JsonKey()
  final bool showingChildren;
  @override
  final VideoComments? children;

  /// Create a copy of SingleCommentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SingleCommentStateCopyWith<_SingleCommentState> get copyWith =>
      __$SingleCommentStateCopyWithImpl<_SingleCommentState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SingleCommentState &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.showingChildren, showingChildren) ||
                other.showingChildren == showingChildren) &&
            (identical(other.children, children) ||
                other.children == children));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, comment, showingChildren, children);

  @override
  String toString() {
    return 'SingleCommentState(comment: $comment, showingChildren: $showingChildren, children: $children)';
  }
}

/// @nodoc
abstract mixin class _$SingleCommentStateCopyWith<$Res>
    implements $SingleCommentStateCopyWith<$Res> {
  factory _$SingleCommentStateCopyWith(
          _SingleCommentState value, $Res Function(_SingleCommentState) _then) =
      __$SingleCommentStateCopyWithImpl;
  @override
  @useResult
  $Res call({Comment comment, bool showingChildren, VideoComments? children});
}

/// @nodoc
class __$SingleCommentStateCopyWithImpl<$Res>
    implements _$SingleCommentStateCopyWith<$Res> {
  __$SingleCommentStateCopyWithImpl(this._self, this._then);

  final _SingleCommentState _self;
  final $Res Function(_SingleCommentState) _then;

  /// Create a copy of SingleCommentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? comment = null,
    Object? showingChildren = null,
    Object? children = freezed,
  }) {
    return _then(_SingleCommentState(
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as Comment,
      showingChildren: null == showingChildren
          ? _self.showingChildren
          : showingChildren // ignore: cast_nullable_to_non_nullable
              as bool,
      children: freezed == children
          ? _self.children
          : children // ignore: cast_nullable_to_non_nullable
              as VideoComments?,
    ));
  }
}

// dart format on
