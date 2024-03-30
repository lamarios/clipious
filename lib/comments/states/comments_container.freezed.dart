// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_container.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommentsContainerState {
  String get source => throw _privateConstructorUsedError;
  String get sortBy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentsContainerStateCopyWith<CommentsContainerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsContainerStateCopyWith<$Res> {
  factory $CommentsContainerStateCopyWith(CommentsContainerState value,
          $Res Function(CommentsContainerState) then) =
      _$CommentsContainerStateCopyWithImpl<$Res, CommentsContainerState>;
  @useResult
  $Res call({String source, String sortBy});
}

/// @nodoc
class _$CommentsContainerStateCopyWithImpl<$Res,
        $Val extends CommentsContainerState>
    implements $CommentsContainerStateCopyWith<$Res> {
  _$CommentsContainerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? sortBy = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentsContainerStateImplCopyWith<$Res>
    implements $CommentsContainerStateCopyWith<$Res> {
  factory _$$CommentsContainerStateImplCopyWith(
          _$CommentsContainerStateImpl value,
          $Res Function(_$CommentsContainerStateImpl) then) =
      __$$CommentsContainerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String source, String sortBy});
}

/// @nodoc
class __$$CommentsContainerStateImplCopyWithImpl<$Res>
    extends _$CommentsContainerStateCopyWithImpl<$Res,
        _$CommentsContainerStateImpl>
    implements _$$CommentsContainerStateImplCopyWith<$Res> {
  __$$CommentsContainerStateImplCopyWithImpl(
      _$CommentsContainerStateImpl _value,
      $Res Function(_$CommentsContainerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? sortBy = null,
  }) {
    return _then(_$CommentsContainerStateImpl(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CommentsContainerStateImpl implements _CommentsContainerState {
  const _$CommentsContainerStateImpl(
      {this.source = 'youtube', this.sortBy = 'top'});

  @override
  @JsonKey()
  final String source;
  @override
  @JsonKey()
  final String sortBy;

  @override
  String toString() {
    return 'CommentsContainerState(source: $source, sortBy: $sortBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsContainerStateImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source, sortBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsContainerStateImplCopyWith<_$CommentsContainerStateImpl>
      get copyWith => __$$CommentsContainerStateImplCopyWithImpl<
          _$CommentsContainerStateImpl>(this, _$identity);
}

abstract class _CommentsContainerState implements CommentsContainerState {
  const factory _CommentsContainerState(
      {final String source,
      final String sortBy}) = _$CommentsContainerStateImpl;

  @override
  String get source;
  @override
  String get sortBy;
  @override
  @JsonKey(ignore: true)
  _$$CommentsContainerStateImplCopyWith<_$CommentsContainerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
