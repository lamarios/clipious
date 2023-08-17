// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_comment.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SingleCommentStateCWProxy {
  SingleCommentState showingChildren(bool showingChildren);

  SingleCommentState comment(Comment comment);

  SingleCommentState children(VideoComments? children);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SingleCommentState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SingleCommentState(...).copyWith(id: 12, name: "My name")
  /// ````
  SingleCommentState call({
    bool? showingChildren,
    Comment? comment,
    VideoComments? children,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSingleCommentState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSingleCommentState.copyWith.fieldName(...)`
class _$SingleCommentStateCWProxyImpl implements _$SingleCommentStateCWProxy {
  const _$SingleCommentStateCWProxyImpl(this._value);

  final SingleCommentState _value;

  @override
  SingleCommentState showingChildren(bool showingChildren) =>
      this(showingChildren: showingChildren);

  @override
  SingleCommentState comment(Comment comment) => this(comment: comment);

  @override
  SingleCommentState children(VideoComments? children) =>
      this(children: children);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SingleCommentState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SingleCommentState(...).copyWith(id: 12, name: "My name")
  /// ````
  SingleCommentState call({
    Object? showingChildren = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
    Object? children = const $CopyWithPlaceholder(),
  }) {
    return SingleCommentState._(
      showingChildren == const $CopyWithPlaceholder() || showingChildren == null
          ? _value.showingChildren
          // ignore: cast_nullable_to_non_nullable
          : showingChildren as bool,
      comment == const $CopyWithPlaceholder() || comment == null
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as Comment,
      children == const $CopyWithPlaceholder()
          ? _value.children
          // ignore: cast_nullable_to_non_nullable
          : children as VideoComments?,
    );
  }
}

extension $SingleCommentStateCopyWith on SingleCommentState {
  /// Returns a callable class that can be used as follows: `instanceOfSingleCommentState.copyWith(...)` or like so:`instanceOfSingleCommentState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SingleCommentStateCWProxy get copyWith =>
      _$SingleCommentStateCWProxyImpl(this);
}
