// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SingleCommentState {
  Comment get comment => throw _privateConstructorUsedError;
  bool get showingChildren => throw _privateConstructorUsedError;
  VideoComments? get children => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SingleCommentStateCopyWith<SingleCommentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleCommentStateCopyWith<$Res> {
  factory $SingleCommentStateCopyWith(
          SingleCommentState value, $Res Function(SingleCommentState) then) =
      _$SingleCommentStateCopyWithImpl<$Res, SingleCommentState>;
  @useResult
  $Res call({Comment comment, bool showingChildren, VideoComments? children});
}

/// @nodoc
class _$SingleCommentStateCopyWithImpl<$Res, $Val extends SingleCommentState>
    implements $SingleCommentStateCopyWith<$Res> {
  _$SingleCommentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? showingChildren = null,
    Object? children = freezed,
  }) {
    return _then(_value.copyWith(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as Comment,
      showingChildren: null == showingChildren
          ? _value.showingChildren
          : showingChildren // ignore: cast_nullable_to_non_nullable
              as bool,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as VideoComments?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SingleCommentStateImplCopyWith<$Res>
    implements $SingleCommentStateCopyWith<$Res> {
  factory _$$SingleCommentStateImplCopyWith(_$SingleCommentStateImpl value,
          $Res Function(_$SingleCommentStateImpl) then) =
      __$$SingleCommentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Comment comment, bool showingChildren, VideoComments? children});
}

/// @nodoc
class __$$SingleCommentStateImplCopyWithImpl<$Res>
    extends _$SingleCommentStateCopyWithImpl<$Res, _$SingleCommentStateImpl>
    implements _$$SingleCommentStateImplCopyWith<$Res> {
  __$$SingleCommentStateImplCopyWithImpl(_$SingleCommentStateImpl _value,
      $Res Function(_$SingleCommentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? showingChildren = null,
    Object? children = freezed,
  }) {
    return _then(_$SingleCommentStateImpl(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as Comment,
      showingChildren: null == showingChildren
          ? _value.showingChildren
          : showingChildren // ignore: cast_nullable_to_non_nullable
              as bool,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as VideoComments?,
    ));
  }
}

/// @nodoc

class _$SingleCommentStateImpl implements _SingleCommentState {
  const _$SingleCommentStateImpl(
      {required this.comment, this.showingChildren = false, this.children});

  @override
  final Comment comment;
  @override
  @JsonKey()
  final bool showingChildren;
  @override
  final VideoComments? children;

  @override
  String toString() {
    return 'SingleCommentState(comment: $comment, showingChildren: $showingChildren, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleCommentStateImpl &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.showingChildren, showingChildren) ||
                other.showingChildren == showingChildren) &&
            (identical(other.children, children) ||
                other.children == children));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, comment, showingChildren, children);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleCommentStateImplCopyWith<_$SingleCommentStateImpl> get copyWith =>
      __$$SingleCommentStateImplCopyWithImpl<_$SingleCommentStateImpl>(
          this, _$identity);
}

abstract class _SingleCommentState implements SingleCommentState {
  const factory _SingleCommentState(
      {required final Comment comment,
      final bool showingChildren,
      final VideoComments? children}) = _$SingleCommentStateImpl;

  @override
  Comment get comment;
  @override
  bool get showingChildren;
  @override
  VideoComments? get children;
  @override
  @JsonKey(ignore: true)
  _$$SingleCommentStateImplCopyWith<_$SingleCommentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
