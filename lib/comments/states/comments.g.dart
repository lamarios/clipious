// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CommentsStateCWProxy {
  CommentsState video(BaseVideo video);

  CommentsState loadingComments(bool loadingComments);

  CommentsState comments(VideoComments comments);

  CommentsState continuationLoaded(bool continuationLoaded);

  CommentsState continuation(String? continuation);

  CommentsState error(String error);

  CommentsState source(String? source);

  CommentsState sortBy(String? sortBy);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CommentsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CommentsState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommentsState call({
    BaseVideo? video,
    bool? loadingComments,
    VideoComments? comments,
    bool? continuationLoaded,
    String? continuation,
    String? error,
    String? source,
    String? sortBy,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCommentsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCommentsState.copyWith.fieldName(...)`
class _$CommentsStateCWProxyImpl implements _$CommentsStateCWProxy {
  const _$CommentsStateCWProxyImpl(this._value);

  final CommentsState _value;

  @override
  CommentsState video(BaseVideo video) => this(video: video);

  @override
  CommentsState loadingComments(bool loadingComments) =>
      this(loadingComments: loadingComments);

  @override
  CommentsState comments(VideoComments comments) => this(comments: comments);

  @override
  CommentsState continuationLoaded(bool continuationLoaded) =>
      this(continuationLoaded: continuationLoaded);

  @override
  CommentsState continuation(String? continuation) =>
      this(continuation: continuation);

  @override
  CommentsState error(String error) => this(error: error);

  @override
  CommentsState source(String? source) => this(source: source);

  @override
  CommentsState sortBy(String? sortBy) => this(sortBy: sortBy);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CommentsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CommentsState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommentsState call({
    Object? video = const $CopyWithPlaceholder(),
    Object? loadingComments = const $CopyWithPlaceholder(),
    Object? comments = const $CopyWithPlaceholder(),
    Object? continuationLoaded = const $CopyWithPlaceholder(),
    Object? continuation = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? source = const $CopyWithPlaceholder(),
    Object? sortBy = const $CopyWithPlaceholder(),
  }) {
    return CommentsState._(
      video == const $CopyWithPlaceholder() || video == null
          ? _value.video
          // ignore: cast_nullable_to_non_nullable
          : video as BaseVideo,
      loadingComments == const $CopyWithPlaceholder() || loadingComments == null
          ? _value.loadingComments
          // ignore: cast_nullable_to_non_nullable
          : loadingComments as bool,
      comments == const $CopyWithPlaceholder() || comments == null
          ? _value.comments
          // ignore: cast_nullable_to_non_nullable
          : comments as VideoComments,
      continuationLoaded == const $CopyWithPlaceholder() ||
              continuationLoaded == null
          ? _value.continuationLoaded
          // ignore: cast_nullable_to_non_nullable
          : continuationLoaded as bool,
      continuation == const $CopyWithPlaceholder()
          ? _value.continuation
          // ignore: cast_nullable_to_non_nullable
          : continuation as String?,
      error == const $CopyWithPlaceholder() || error == null
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as String,
      source == const $CopyWithPlaceholder()
          ? _value.source
          // ignore: cast_nullable_to_non_nullable
          : source as String?,
      sortBy == const $CopyWithPlaceholder()
          ? _value.sortBy
          // ignore: cast_nullable_to_non_nullable
          : sortBy as String?,
    );
  }
}

extension $CommentsStateCopyWith on CommentsState {
  /// Returns a callable class that can be used as follows: `instanceOfCommentsState.copyWith(...)` or like so:`instanceOfCommentsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CommentsStateCWProxy get copyWith => _$CommentsStateCWProxyImpl(this);
}
