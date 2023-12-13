// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommentsState {
  BaseVideo get video => throw _privateConstructorUsedError;
  bool get loadingComments => throw _privateConstructorUsedError;
  String? get continuation => throw _privateConstructorUsedError;
  bool get continuationLoaded => throw _privateConstructorUsedError;
  VideoComments get comments => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get sortBy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentsStateCopyWith<CommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsStateCopyWith<$Res> {
  factory $CommentsStateCopyWith(
          CommentsState value, $Res Function(CommentsState) then) =
      _$CommentsStateCopyWithImpl<$Res, CommentsState>;
  @useResult
  $Res call(
      {BaseVideo video,
      bool loadingComments,
      String? continuation,
      bool continuationLoaded,
      VideoComments comments,
      String error,
      String? source,
      String? sortBy});
}

/// @nodoc
class _$CommentsStateCopyWithImpl<$Res, $Val extends CommentsState>
    implements $CommentsStateCopyWith<$Res> {
  _$CommentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = null,
    Object? loadingComments = null,
    Object? continuation = freezed,
    Object? continuationLoaded = null,
    Object? comments = null,
    Object? error = null,
    Object? source = freezed,
    Object? sortBy = freezed,
  }) {
    return _then(_value.copyWith(
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as BaseVideo,
      loadingComments: null == loadingComments
          ? _value.loadingComments
          : loadingComments // ignore: cast_nullable_to_non_nullable
              as bool,
      continuation: freezed == continuation
          ? _value.continuation
          : continuation // ignore: cast_nullable_to_non_nullable
              as String?,
      continuationLoaded: null == continuationLoaded
          ? _value.continuationLoaded
          : continuationLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as VideoComments,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentsStateImplCopyWith<$Res>
    implements $CommentsStateCopyWith<$Res> {
  factory _$$CommentsStateImplCopyWith(
          _$CommentsStateImpl value, $Res Function(_$CommentsStateImpl) then) =
      __$$CommentsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseVideo video,
      bool loadingComments,
      String? continuation,
      bool continuationLoaded,
      VideoComments comments,
      String error,
      String? source,
      String? sortBy});
}

/// @nodoc
class __$$CommentsStateImplCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res, _$CommentsStateImpl>
    implements _$$CommentsStateImplCopyWith<$Res> {
  __$$CommentsStateImplCopyWithImpl(
      _$CommentsStateImpl _value, $Res Function(_$CommentsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = null,
    Object? loadingComments = null,
    Object? continuation = freezed,
    Object? continuationLoaded = null,
    Object? comments = null,
    Object? error = null,
    Object? source = freezed,
    Object? sortBy = freezed,
  }) {
    return _then(_$CommentsStateImpl(
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as BaseVideo,
      loadingComments: null == loadingComments
          ? _value.loadingComments
          : loadingComments // ignore: cast_nullable_to_non_nullable
              as bool,
      continuation: freezed == continuation
          ? _value.continuation
          : continuation // ignore: cast_nullable_to_non_nullable
              as String?,
      continuationLoaded: null == continuationLoaded
          ? _value.continuationLoaded
          : continuationLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as VideoComments,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CommentsStateImpl implements _CommentsState {
  const _$CommentsStateImpl(
      {required this.video,
      this.loadingComments = true,
      this.continuation,
      this.continuationLoaded = false,
      required this.comments,
      this.error = '',
      this.source,
      this.sortBy});

  @override
  final BaseVideo video;
  @override
  @JsonKey()
  final bool loadingComments;
  @override
  final String? continuation;
  @override
  @JsonKey()
  final bool continuationLoaded;
  @override
  final VideoComments comments;
  @override
  @JsonKey()
  final String error;
  @override
  final String? source;
  @override
  final String? sortBy;

  @override
  String toString() {
    return 'CommentsState(video: $video, loadingComments: $loadingComments, continuation: $continuation, continuationLoaded: $continuationLoaded, comments: $comments, error: $error, source: $source, sortBy: $sortBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsStateImpl &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.loadingComments, loadingComments) ||
                other.loadingComments == loadingComments) &&
            (identical(other.continuation, continuation) ||
                other.continuation == continuation) &&
            (identical(other.continuationLoaded, continuationLoaded) ||
                other.continuationLoaded == continuationLoaded) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, video, loadingComments,
      continuation, continuationLoaded, comments, error, source, sortBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsStateImplCopyWith<_$CommentsStateImpl> get copyWith =>
      __$$CommentsStateImplCopyWithImpl<_$CommentsStateImpl>(this, _$identity);
}

abstract class _CommentsState implements CommentsState {
  const factory _CommentsState(
      {required final BaseVideo video,
      final bool loadingComments,
      final String? continuation,
      final bool continuationLoaded,
      required final VideoComments comments,
      final String error,
      final String? source,
      final String? sortBy}) = _$CommentsStateImpl;

  @override
  BaseVideo get video;
  @override
  bool get loadingComments;
  @override
  String? get continuation;
  @override
  bool get continuationLoaded;
  @override
  VideoComments get comments;
  @override
  String get error;
  @override
  String? get source;
  @override
  String? get sortBy;
  @override
  @JsonKey(ignore: true)
  _$$CommentsStateImplCopyWith<_$CommentsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
