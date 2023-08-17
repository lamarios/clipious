// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_container.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CommentsContainerStateCWProxy {
  CommentsContainerState source(String source);

  CommentsContainerState sortBy(String sortBy);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CommentsContainerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CommentsContainerState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommentsContainerState call({
    String? source,
    String? sortBy,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCommentsContainerState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCommentsContainerState.copyWith.fieldName(...)`
class _$CommentsContainerStateCWProxyImpl
    implements _$CommentsContainerStateCWProxy {
  const _$CommentsContainerStateCWProxyImpl(this._value);

  final CommentsContainerState _value;

  @override
  CommentsContainerState source(String source) => this(source: source);

  @override
  CommentsContainerState sortBy(String sortBy) => this(sortBy: sortBy);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CommentsContainerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CommentsContainerState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommentsContainerState call({
    Object? source = const $CopyWithPlaceholder(),
    Object? sortBy = const $CopyWithPlaceholder(),
  }) {
    return CommentsContainerState._(
      source == const $CopyWithPlaceholder() || source == null
          ? _value.source
          // ignore: cast_nullable_to_non_nullable
          : source as String,
      sortBy == const $CopyWithPlaceholder() || sortBy == null
          ? _value.sortBy
          // ignore: cast_nullable_to_non_nullable
          : sortBy as String,
    );
  }
}

extension $CommentsContainerStateCopyWith on CommentsContainerState {
  /// Returns a callable class that can be used as follows: `instanceOfCommentsContainerState.copyWith(...)` or like so:`instanceOfCommentsContainerState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CommentsContainerStateCWProxy get copyWith =>
      _$CommentsContainerStateCWProxyImpl(this);
}
