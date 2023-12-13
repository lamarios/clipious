// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_video.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BaseVideoCWProxy {
  BaseVideo videoId(String videoId);

  BaseVideo title(String title);

  BaseVideo lengthSeconds(int lengthSeconds);

  BaseVideo author(String? author);

  BaseVideo authorId(String? authorId);

  BaseVideo authorUrl(String? authorUrl);

  BaseVideo videoThumbnails(List<ImageObject> videoThumbnails);

  BaseVideo filtered(bool filtered);

  BaseVideo matchedFilters(List<VideoFilter> matchedFilters);

  BaseVideo filterHide(bool filterHide);

  BaseVideo deArrowed(bool deArrowed);

  BaseVideo deArrowThumbnailUrl(String? deArrowThumbnailUrl);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseVideo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseVideo(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseVideo call({
    String? videoId,
    String? title,
    int? lengthSeconds,
    String? author,
    String? authorId,
    String? authorUrl,
    List<ImageObject>? videoThumbnails,
    bool? filtered,
    List<VideoFilter>? matchedFilters,
    bool? filterHide,
    bool? deArrowed,
    String? deArrowThumbnailUrl,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBaseVideo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBaseVideo.copyWith.fieldName(...)`
class _$BaseVideoCWProxyImpl implements _$BaseVideoCWProxy {
  const _$BaseVideoCWProxyImpl(this._value);

  final BaseVideo _value;

  @override
  BaseVideo videoId(String videoId) => this(videoId: videoId);

  @override
  BaseVideo title(String title) => this(title: title);

  @override
  BaseVideo lengthSeconds(int lengthSeconds) => this(lengthSeconds: lengthSeconds);

  @override
  BaseVideo author(String? author) => this(author: author);

  @override
  BaseVideo authorId(String? authorId) => this(authorId: authorId);

  @override
  BaseVideo authorUrl(String? authorUrl) => this(authorUrl: authorUrl);

  @override
  BaseVideo videoThumbnails(List<ImageObject> videoThumbnails) => this(videoThumbnails: videoThumbnails);

  @override
  BaseVideo filtered(bool filtered) => this(filtered: filtered);

  @override
  BaseVideo matchedFilters(List<VideoFilter> matchedFilters) => this(matchedFilters: matchedFilters);

  @override
  BaseVideo filterHide(bool filterHide) => this(filterHide: filterHide);

  @override
  BaseVideo deArrowed(bool deArrowed) => this(deArrowed: deArrowed);

  @override
  BaseVideo deArrowThumbnailUrl(String? deArrowThumbnailUrl) => this(deArrowThumbnailUrl: deArrowThumbnailUrl);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseVideo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseVideo(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseVideo call({
    Object? videoId = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? lengthSeconds = const $CopyWithPlaceholder(),
    Object? author = const $CopyWithPlaceholder(),
    Object? authorId = const $CopyWithPlaceholder(),
    Object? authorUrl = const $CopyWithPlaceholder(),
    Object? videoThumbnails = const $CopyWithPlaceholder(),
    Object? filtered = const $CopyWithPlaceholder(),
    Object? matchedFilters = const $CopyWithPlaceholder(),
    Object? filterHide = const $CopyWithPlaceholder(),
    Object? deArrowed = const $CopyWithPlaceholder(),
    Object? deArrowThumbnailUrl = const $CopyWithPlaceholder(),
  }) {
    return BaseVideo._(
      videoId == const $CopyWithPlaceholder() || videoId == null
          ? _value.videoId
          // ignore: cast_nullable_to_non_nullable
          : videoId as String,
      title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      lengthSeconds == const $CopyWithPlaceholder() || lengthSeconds == null
          ? _value.lengthSeconds
          // ignore: cast_nullable_to_non_nullable
          : lengthSeconds as int,
      author == const $CopyWithPlaceholder()
          ? _value.author
          // ignore: cast_nullable_to_non_nullable
          : author as String?,
      authorId == const $CopyWithPlaceholder()
          ? _value.authorId
          // ignore: cast_nullable_to_non_nullable
          : authorId as String?,
      authorUrl == const $CopyWithPlaceholder()
          ? _value.authorUrl
          // ignore: cast_nullable_to_non_nullable
          : authorUrl as String?,
      videoThumbnails == const $CopyWithPlaceholder() || videoThumbnails == null
          ? _value.videoThumbnails
          // ignore: cast_nullable_to_non_nullable
          : videoThumbnails as List<ImageObject>,
      filtered == const $CopyWithPlaceholder() || filtered == null
          ? _value.filtered
          // ignore: cast_nullable_to_non_nullable
          : filtered as bool,
      matchedFilters == const $CopyWithPlaceholder() || matchedFilters == null
          ? _value.matchedFilters
          // ignore: cast_nullable_to_non_nullable
          : matchedFilters as List<VideoFilter>,
      filterHide == const $CopyWithPlaceholder() || filterHide == null
          ? _value.filterHide
          // ignore: cast_nullable_to_non_nullable
          : filterHide as bool,
      deArrowed == const $CopyWithPlaceholder() || deArrowed == null
          ? _value.deArrowed
          // ignore: cast_nullable_to_non_nullable
          : deArrowed as bool,
      deArrowThumbnailUrl == const $CopyWithPlaceholder()
          ? _value.deArrowThumbnailUrl
          // ignore: cast_nullable_to_non_nullable
          : deArrowThumbnailUrl as String?,
    );
  }
}

extension $BaseVideoCopyWith on BaseVideo {
  /// Returns a callable class that can be used as follows: `instanceOfBaseVideo.copyWith(...)` or like so:`instanceOfBaseVideo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BaseVideoCWProxy get copyWith => _$BaseVideoCWProxyImpl(this);
}
