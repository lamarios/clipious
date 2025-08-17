// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Playlist {
  String get type;
  String get title;
  String get playlistId;
  String get author;
  String? get authordId;
  String? get authorUrl;
  List<ImageObject> get authorThumbnails;
  String? get description;
  int get videoCount;
  int? get viewCount;
  bool? get isListed;
  int? get updated;
  List<Video> get videos;
  @JsonKey(includeToJson: false, includeFromJson: false)
  int get removedByFilter;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaylistCopyWith<Playlist> get copyWith =>
      _$PlaylistCopyWithImpl<Playlist>(this as Playlist, _$identity);

  /// Serializes this Playlist to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Playlist &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.authordId, authordId) ||
                other.authordId == authordId) &&
            (identical(other.authorUrl, authorUrl) ||
                other.authorUrl == authorUrl) &&
            const DeepCollectionEquality()
                .equals(other.authorThumbnails, authorThumbnails) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.videoCount, videoCount) ||
                other.videoCount == videoCount) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.isListed, isListed) ||
                other.isListed == isListed) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            const DeepCollectionEquality().equals(other.videos, videos) &&
            (identical(other.removedByFilter, removedByFilter) ||
                other.removedByFilter == removedByFilter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      title,
      playlistId,
      author,
      authordId,
      authorUrl,
      const DeepCollectionEquality().hash(authorThumbnails),
      description,
      videoCount,
      viewCount,
      isListed,
      updated,
      const DeepCollectionEquality().hash(videos),
      removedByFilter);

  @override
  String toString() {
    return 'Playlist(type: $type, title: $title, playlistId: $playlistId, author: $author, authordId: $authordId, authorUrl: $authorUrl, authorThumbnails: $authorThumbnails, description: $description, videoCount: $videoCount, viewCount: $viewCount, isListed: $isListed, updated: $updated, videos: $videos, removedByFilter: $removedByFilter)';
  }
}

/// @nodoc
abstract mixin class $PlaylistCopyWith<$Res> {
  factory $PlaylistCopyWith(Playlist value, $Res Function(Playlist) _then) =
      _$PlaylistCopyWithImpl;
  @useResult
  $Res call(
      {String type,
      String title,
      String playlistId,
      String author,
      String? authordId,
      String? authorUrl,
      List<ImageObject> authorThumbnails,
      String? description,
      int videoCount,
      int? viewCount,
      bool? isListed,
      int? updated,
      List<Video> videos,
      @JsonKey(includeToJson: false, includeFromJson: false)
      int removedByFilter});
}

/// @nodoc
class _$PlaylistCopyWithImpl<$Res> implements $PlaylistCopyWith<$Res> {
  _$PlaylistCopyWithImpl(this._self, this._then);

  final Playlist _self;
  final $Res Function(Playlist) _then;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? playlistId = null,
    Object? author = null,
    Object? authordId = freezed,
    Object? authorUrl = freezed,
    Object? authorThumbnails = null,
    Object? description = freezed,
    Object? videoCount = null,
    Object? viewCount = freezed,
    Object? isListed = freezed,
    Object? updated = freezed,
    Object? videos = null,
    Object? removedByFilter = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      playlistId: null == playlistId
          ? _self.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      authordId: freezed == authordId
          ? _self.authordId
          : authordId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorUrl: freezed == authorUrl
          ? _self.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      authorThumbnails: null == authorThumbnails
          ? _self.authorThumbnails
          : authorThumbnails // ignore: cast_nullable_to_non_nullable
              as List<ImageObject>,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      videoCount: null == videoCount
          ? _self.videoCount
          : videoCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewCount: freezed == viewCount
          ? _self.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isListed: freezed == isListed
          ? _self.isListed
          : isListed // ignore: cast_nullable_to_non_nullable
              as bool?,
      updated: freezed == updated
          ? _self.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int?,
      videos: null == videos
          ? _self.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      removedByFilter: null == removedByFilter
          ? _self.removedByFilter
          : removedByFilter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [Playlist].
extension PlaylistPatterns on Playlist {
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
    TResult Function(_Playlist value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Playlist() when $default != null:
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
    TResult Function(_Playlist value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Playlist():
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
    TResult? Function(_Playlist value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Playlist() when $default != null:
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
            String type,
            String title,
            String playlistId,
            String author,
            String? authordId,
            String? authorUrl,
            List<ImageObject> authorThumbnails,
            String? description,
            int videoCount,
            int? viewCount,
            bool? isListed,
            int? updated,
            List<Video> videos,
            @JsonKey(includeToJson: false, includeFromJson: false)
            int removedByFilter)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Playlist() when $default != null:
        return $default(
            _that.type,
            _that.title,
            _that.playlistId,
            _that.author,
            _that.authordId,
            _that.authorUrl,
            _that.authorThumbnails,
            _that.description,
            _that.videoCount,
            _that.viewCount,
            _that.isListed,
            _that.updated,
            _that.videos,
            _that.removedByFilter);
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
            String type,
            String title,
            String playlistId,
            String author,
            String? authordId,
            String? authorUrl,
            List<ImageObject> authorThumbnails,
            String? description,
            int videoCount,
            int? viewCount,
            bool? isListed,
            int? updated,
            List<Video> videos,
            @JsonKey(includeToJson: false, includeFromJson: false)
            int removedByFilter)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Playlist():
        return $default(
            _that.type,
            _that.title,
            _that.playlistId,
            _that.author,
            _that.authordId,
            _that.authorUrl,
            _that.authorThumbnails,
            _that.description,
            _that.videoCount,
            _that.viewCount,
            _that.isListed,
            _that.updated,
            _that.videos,
            _that.removedByFilter);
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
            String type,
            String title,
            String playlistId,
            String author,
            String? authordId,
            String? authorUrl,
            List<ImageObject> authorThumbnails,
            String? description,
            int videoCount,
            int? viewCount,
            bool? isListed,
            int? updated,
            List<Video> videos,
            @JsonKey(includeToJson: false, includeFromJson: false)
            int removedByFilter)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Playlist() when $default != null:
        return $default(
            _that.type,
            _that.title,
            _that.playlistId,
            _that.author,
            _that.authordId,
            _that.authorUrl,
            _that.authorThumbnails,
            _that.description,
            _that.videoCount,
            _that.viewCount,
            _that.isListed,
            _that.updated,
            _that.videos,
            _that.removedByFilter);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Playlist implements Playlist {
  const _Playlist(
      {this.type = youtubePlaylist,
      required this.title,
      required this.playlistId,
      required this.author,
      this.authordId,
      this.authorUrl,
      final List<ImageObject> authorThumbnails = const [],
      this.description,
      required this.videoCount,
      this.viewCount,
      this.isListed,
      this.updated,
      final List<Video> videos = const [],
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.removedByFilter = 0})
      : _authorThumbnails = authorThumbnails,
        _videos = videos;
  factory _Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  @override
  @JsonKey()
  final String type;
  @override
  final String title;
  @override
  final String playlistId;
  @override
  final String author;
  @override
  final String? authordId;
  @override
  final String? authorUrl;
  final List<ImageObject> _authorThumbnails;
  @override
  @JsonKey()
  List<ImageObject> get authorThumbnails {
    if (_authorThumbnails is EqualUnmodifiableListView)
      return _authorThumbnails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authorThumbnails);
  }

  @override
  final String? description;
  @override
  final int videoCount;
  @override
  final int? viewCount;
  @override
  final bool? isListed;
  @override
  final int? updated;
  final List<Video> _videos;
  @override
  @JsonKey()
  List<Video> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final int removedByFilter;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaylistCopyWith<_Playlist> get copyWith =>
      __$PlaylistCopyWithImpl<_Playlist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlaylistToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Playlist &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.authordId, authordId) ||
                other.authordId == authordId) &&
            (identical(other.authorUrl, authorUrl) ||
                other.authorUrl == authorUrl) &&
            const DeepCollectionEquality()
                .equals(other._authorThumbnails, _authorThumbnails) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.videoCount, videoCount) ||
                other.videoCount == videoCount) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.isListed, isListed) ||
                other.isListed == isListed) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            (identical(other.removedByFilter, removedByFilter) ||
                other.removedByFilter == removedByFilter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      title,
      playlistId,
      author,
      authordId,
      authorUrl,
      const DeepCollectionEquality().hash(_authorThumbnails),
      description,
      videoCount,
      viewCount,
      isListed,
      updated,
      const DeepCollectionEquality().hash(_videos),
      removedByFilter);

  @override
  String toString() {
    return 'Playlist(type: $type, title: $title, playlistId: $playlistId, author: $author, authordId: $authordId, authorUrl: $authorUrl, authorThumbnails: $authorThumbnails, description: $description, videoCount: $videoCount, viewCount: $viewCount, isListed: $isListed, updated: $updated, videos: $videos, removedByFilter: $removedByFilter)';
  }
}

/// @nodoc
abstract mixin class _$PlaylistCopyWith<$Res>
    implements $PlaylistCopyWith<$Res> {
  factory _$PlaylistCopyWith(_Playlist value, $Res Function(_Playlist) _then) =
      __$PlaylistCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String type,
      String title,
      String playlistId,
      String author,
      String? authordId,
      String? authorUrl,
      List<ImageObject> authorThumbnails,
      String? description,
      int videoCount,
      int? viewCount,
      bool? isListed,
      int? updated,
      List<Video> videos,
      @JsonKey(includeToJson: false, includeFromJson: false)
      int removedByFilter});
}

/// @nodoc
class __$PlaylistCopyWithImpl<$Res> implements _$PlaylistCopyWith<$Res> {
  __$PlaylistCopyWithImpl(this._self, this._then);

  final _Playlist _self;
  final $Res Function(_Playlist) _then;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? playlistId = null,
    Object? author = null,
    Object? authordId = freezed,
    Object? authorUrl = freezed,
    Object? authorThumbnails = null,
    Object? description = freezed,
    Object? videoCount = null,
    Object? viewCount = freezed,
    Object? isListed = freezed,
    Object? updated = freezed,
    Object? videos = null,
    Object? removedByFilter = null,
  }) {
    return _then(_Playlist(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      playlistId: null == playlistId
          ? _self.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      authordId: freezed == authordId
          ? _self.authordId
          : authordId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorUrl: freezed == authorUrl
          ? _self.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      authorThumbnails: null == authorThumbnails
          ? _self._authorThumbnails
          : authorThumbnails // ignore: cast_nullable_to_non_nullable
              as List<ImageObject>,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      videoCount: null == videoCount
          ? _self.videoCount
          : videoCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewCount: freezed == viewCount
          ? _self.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isListed: freezed == isListed
          ? _self.isListed
          : isListed // ignore: cast_nullable_to_non_nullable
              as bool?,
      updated: freezed == updated
          ? _self.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int?,
      videos: null == videos
          ? _self._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      removedByFilter: null == removedByFilter
          ? _self.removedByFilter
          : removedByFilter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
